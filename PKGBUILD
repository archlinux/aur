# SPDX-FileCopyrightText: 2025 Atay Özcan <atay@oezcan.me>
# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: Atay Özcan <atay@oezcan.me>
pkgname=sentinel
pkgver=0.8.0
pkgrel=1
install=sentinel.install
# Cargo.toml's release profile already strips symbols (`strip = "symbols"`),
# so makepkg's debug-package generator has nothing to index — opt out to
# avoid noisy gdb-add-index "No debugging symbols" errors.
options=('!debug')
pkgdesc="UAC-style confirmation dialog for Linux privilege escalation (COSMIC + sudo-rs friendly)"
arch=('x86_64' 'aarch64')
url="https://github.com/atayozcan/sentinel"
license=('GPL-3.0-or-later')
depends=(
    'pam'
    'polkit'
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
    'pkgconf'
    'wayland-protocols'
)
optdepends=(
    'sudo-rs: memory-safe sudo replacement'
    'polkit: for graphical privilege prompts'
)
backup=('etc/security/sentinel.conf' 'etc/pam.d/polkit-1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Regenerated to a real value by the AUR-publish CI workflow before
# the PKGBUILD lands on the AUR repo. The in-repo copy stays at
# 'SKIP' so dependabot-style updates don't churn this file every
# release; never commit a real hash here.
sha256sums=('a30767dbef692bb7f112d0b9257031e49339cedb20bfbfbb65281d5c723f3dd5')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export SENTINEL_PREFIX=/usr
    export SENTINEL_SYSCONFDIR=/etc
    export SENTINEL_LIBEXECDIR=lib
    # Microarch baseline: x86-64-v3 (Haswell/Zen 1+ — AVX2, BMI1/2, FMA, F16C).
    # Arch officially baselined to v2 in 2024 but virtually all hardware
    # capable of running a modern Wayland compositor is v3+. ALHP /
    # CachyOS users get a v3-tuned binary; everyone else still on a
    # pre-Haswell CPU should use the .deb/.rpm or build from source.
    # Append rather than overwrite so makepkg's CFLAGS-equivalent layer
    # (if a user sets RUSTFLAGS in /etc/makepkg.conf via cargo-rustflags)
    # composes cleanly.
    export RUSTFLAGS="${RUSTFLAGS:-} -C target-cpu=x86-64-v3"
    cargo build --frozen --release --workspace

    # Generate shell completions + man pages from the freshly-built binaries.
    install -d target/release/share
    for bin in sentinel-helper sentinel-polkit-agent; do
        target/release/$bin completions bash > target/release/share/$bin.bash
        target/release/$bin completions fish > target/release/share/$bin.fish
        target/release/$bin completions zsh  > target/release/share/_$bin
        target/release/$bin man              > target/release/share/$bin.1
    done
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --workspace --locked
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/sentinel-helper \
        "$pkgdir/usr/lib/sentinel-helper"

    # 0755 (not 0644) — libpam under systemd-sandboxed PAM stacks
    # refuses to dlopen .so files without the execute bit.
    install -Dm755 target/release/libpam_sentinel.so \
        "$pkgdir/usr/lib/security/pam_sentinel.so"

    install -Dm644 config/sentinel.conf \
        "$pkgdir/etc/security/sentinel.conf"

    install -Dm644 config/polkit-1 \
        "$pkgdir/etc/pam.d/polkit-1"

    # config/sudo is *not* installed to /etc/pam.d/sudo automatically —
    # silently rewriting /etc/pam.d/sudo is a notorious foot-gun. Ship
    # it under /usr/share/doc/ for users to copy in manually.
    install -Dm644 config/sudo \
        "$pkgdir/usr/share/doc/$pkgname/sudo"

    install -Dm755 target/release/sentinel-polkit-agent \
        "$pkgdir/usr/lib/sentinel-polkit-agent"

    install -Dm644 packaging/systemd/polkit-agent-helper@.service.d/sentinel.conf \
        "$pkgdir/etc/systemd/system/polkit-agent-helper@.service.d/sentinel.conf"

    install -Dm644 packaging/xdg-autostart/sentinel-polkit-agent.desktop \
        "$pkgdir/etc/xdg/autostart/sentinel-polkit-agent.desktop"

    # Shell completions.
    install -Dm644 target/release/share/sentinel-helper.bash \
        "$pkgdir/usr/share/bash-completion/completions/sentinel-helper"
    install -Dm644 target/release/share/sentinel-polkit-agent.bash \
        "$pkgdir/usr/share/bash-completion/completions/sentinel-polkit-agent"
    install -Dm644 target/release/share/sentinel-helper.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/sentinel-helper.fish"
    install -Dm644 target/release/share/sentinel-polkit-agent.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/sentinel-polkit-agent.fish"
    install -Dm644 target/release/share/_sentinel-helper \
        "$pkgdir/usr/share/zsh/site-functions/_sentinel-helper"
    install -Dm644 target/release/share/_sentinel-polkit-agent \
        "$pkgdir/usr/share/zsh/site-functions/_sentinel-polkit-agent"

    # Man pages.
    install -Dm644 target/release/share/sentinel-helper.1 \
        "$pkgdir/usr/share/man/man1/sentinel-helper.1"
    install -Dm644 target/release/share/sentinel-polkit-agent.1 \
        "$pkgdir/usr/share/man/man1/sentinel-polkit-agent.1"
    install -Dm644 packaging/man/sentinel.conf.5 \
        "$pkgdir/usr/share/man/man5/sentinel.conf.5"
    install -Dm644 packaging/man/pam_sentinel.8 \
        "$pkgdir/usr/share/man/man8/pam_sentinel.8"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
