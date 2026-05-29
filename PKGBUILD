# SPDX-FileCopyrightText: 2026 Atay Özcan <atay@oezcan.me>
# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: Atay Özcan <atay@oezcan.me>
pkgname=sentinel-kde
pkgver=0.8.0
pkgrel=3
install=sentinel-kde.install
# Cargo.toml's release profile strips symbols at link time, so makepkg's
# debug-package generator has nothing to index — opt out to silence the
# noisy gdb-add-index errors.
options=('!debug')
pkgdesc="UAC-style confirmation dialog for privilege escalation on KDE Plasma (Wayland)"
arch=('x86_64' 'aarch64')
url="https://github.com/atayozcan/sentinel-kde"
license=('GPL-3.0-or-later')
depends=(
    'pam'
    'polkit'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'kirigami'
    'kirigami-addons'
    'layer-shell-qt'
    'plasma-workspace'   # org.kde.desktop QQuickStyle + breeze integration
    'libplasma'
    'wayland'
    'libxkbcommon'
    'fontconfig'
    'freetype2'
    'mesa'
    'vulkan-icd-loader'
    'gcc-libs'
    'glibc'
)
makedepends=(
    'rust'
    'cargo'
    'cmake'
    'pkgconf'
    'wayland-protocols'
    'qt6-tools'
    # mold is required: rust-lld can't resolve cxx-qt-lib's bridge symbols
    # against Qt6/KF6 with -fat LTO, and Arch's default linker config picks
    # rust-lld unless we override. mold links cleanly.
    'mold'
)
optdepends=(
    'sudo-rs: memory-safe sudo replacement'
    'libcanberra: UAC-style audio cue at dialog open'
)
# Same role at runtime as the upstream Plasma polkit agent — provide its
# name so plasma-meta's dep is satisfied and pacman can swap them.
provides=("polkit-kde-agent=$pkgver" "sentinel-kde=$pkgver")
conflicts=('polkit-kde-agent' 'sentinel' 'sentinel-git')
backup=('etc/security/sentinel.conf' 'etc/pam.d/polkit-1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Regenerated to a real value by the AUR-publish CI workflow before the
# PKGBUILD lands on the AUR repo. In-repo copy stays 'SKIP' so dependabot-
# style updates don't churn this file every release.
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # `sentinel-polkit-agent`'s build.rs hardcodes the helper path it
    # spawns from this env var; the default fallback (`/usr/lib/
    # sentinel-helper`) is the COSMIC binary name, which doesn't exist
    # on the KDE side. Without this export the agent's
    # `BeginAuthentication` call silently fails to spawn the helper,
    # `pkexec` returns "Not authorized", and the user blames Sentinel.
    # install.sh + build-release.sh set this already; the PKGBUILD has
    # to mirror them.
    export SENTINEL_HELPER_PATH=/usr/lib/sentinel-helper-kde
    # mold linker — rust-lld can't resolve cxx-qt-lib's bridge symbols
    # (`rust$cxxqtlib1$cxxbridge1$…`) against Qt6/KF6. Mold (and gold) do.
    # Append rather than overwrite so /etc/makepkg.conf RUSTFLAGS still
    # compose cleanly with our linker override.
    export RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-fuse-ld=mold"
    # Microarch baseline: x86-64-v3 (Haswell/Zen 1+ — AVX2, BMI1/2, FMA,
    # F16C). Anyone running Plasma 6 on Wayland in 2026+ is on a v3+ CPU.
    # aarch64 builds use the toolchain default.
    if [[ "${CARCH:-}" == "x86_64" ]]; then
        export RUSTFLAGS="$RUSTFLAGS -C target-cpu=x86-64-v3"
    fi
    # Dropped `--frozen`: cxx-qt-build's generated C++ outputs need a
    # writable build script run; `--frozen` blocks that on a cold cache,
    # which is exactly the CI / clean-chroot case. `--locked` (implied by
    # the prepare-step `cargo fetch --locked`) still pins Cargo.lock.
    cargo build --release --workspace

    install -d target/release/share
    target/release/sentinel-polkit-agent completions bash > target/release/share/sentinel-polkit-agent.bash
    target/release/sentinel-polkit-agent completions fish > target/release/share/sentinel-polkit-agent.fish
    target/release/sentinel-polkit-agent completions zsh  > target/release/share/_sentinel-polkit-agent
    target/release/sentinel-polkit-agent man              > target/release/share/sentinel-polkit-agent.1
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # The Qt/QML helper needs a Wayland compositor — skip it in chroot.
    cargo test --frozen --release --workspace --locked \
        -p sentinel-shared -p pam-sentinel -p sentinel-polkit-agent
}

package() {
    cd "$pkgname-$pkgver"

    # Binaries.
    install -Dm755 target/release/sentinel-helper-kde \
        "$pkgdir/usr/lib/sentinel-helper-kde"
    install -Dm755 target/release/sentinel-polkit-agent \
        "$pkgdir/usr/lib/sentinel-polkit-agent"

    # 0755 not 0644 — libpam under systemd-sandboxed PAM stacks refuses
    # to dlopen .so files without the execute bit.
    install -Dm755 target/release/libpam_sentinel.so \
        "$pkgdir/usr/lib/security/pam_sentinel.so"

    # Config + PAM.
    install -Dm644 config/sentinel.conf \
        "$pkgdir/etc/security/sentinel.conf"
    install -Dm644 config/polkit-1 \
        "$pkgdir/etc/pam.d/polkit-1"
    # sudo + su are docs-only — silently rewriting /etc/pam.d/sudo is a
    # notorious foot-gun. The post_install hook tells users how to opt in.
    install -Dm644 config/sudo \
        "$pkgdir/usr/share/doc/$pkgname/sudo"
    install -Dm644 config/su \
        "$pkgdir/usr/share/doc/$pkgname/su"

    # systemd USER service + auto-enable in graphical-session.target.
    install -Dm644 packaging/systemd/user/sentinel-polkit-agent.service \
        "$pkgdir/usr/lib/systemd/user/sentinel-polkit-agent.service"
    install -d "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants"
    ln -s ../sentinel-polkit-agent.service \
        "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants/sentinel-polkit-agent.service"

    # DBus system-bus policy for the pre-approval interface.
    install -Dm644 packaging/dbus/org.sentinel.Agent.conf \
        "$pkgdir/usr/share/dbus-1/system.d/org.sentinel.Agent.conf"

    # Polkit admin rule — wheel-group members can self-confirm.
    install -Dm644 packaging/arch/49-sentinel-admin.rules \
        "$pkgdir/etc/polkit-1/rules.d/49-sentinel-admin.rules"

    # Shell completions.
    install -Dm644 target/release/share/sentinel-polkit-agent.bash \
        "$pkgdir/usr/share/bash-completion/completions/sentinel-polkit-agent"
    install -Dm644 target/release/share/sentinel-polkit-agent.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/sentinel-polkit-agent.fish"
    install -Dm644 target/release/share/_sentinel-polkit-agent \
        "$pkgdir/usr/share/zsh/site-functions/_sentinel-polkit-agent"

    # Man pages.
    install -Dm644 target/release/share/sentinel-polkit-agent.1 \
        "$pkgdir/usr/share/man/man1/sentinel-polkit-agent.1"
    install -Dm644 packaging/man/sentinel.conf.5 \
        "$pkgdir/usr/share/man/man5/sentinel.conf.5"
    install -Dm644 packaging/man/pam_sentinel.8 \
        "$pkgdir/usr/share/man/man8/pam_sentinel.8"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
