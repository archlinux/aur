# SPDX-FileCopyrightText: 2026 Atay Özcan <atay@oezcan.me>
# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: Atay Özcan <atay@oezcan.me>
# Companion -git package. Tracks the main branch HEAD.
# Submit as the AUR package "sentinel-kde-git" alongside "sentinel-kde".
pkgname=sentinel-kde-git
pkgver=0.8.0.r0.g0000000
pkgrel=1
pkgdesc="UAC-style confirmation dialog for privilege escalation on KDE Plasma (git HEAD)"
install=sentinel-kde.install
options=('!debug')
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
    'plasma-workspace'
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
    'git'
)
optdepends=(
    'sudo-rs: memory-safe sudo replacement'
    'libcanberra: UAC-style audio cue at dialog open'
)
provides=("polkit-kde-agent=$pkgver" "sentinel-kde=$pkgver")
conflicts=('polkit-kde-agent' 'sentinel' 'sentinel-git' 'sentinel-kde')
backup=('etc/security/sentinel.conf' 'etc/pam.d/polkit-1')
source=("sentinel-kde::git+$url.git#branch=main")
# Always SKIP for VCS packages — makepkg validates the git ref instead
# of a tarball checksum.
sha256sums=('SKIP')

pkgver() {
    cd sentinel-kde
    # ${tag}.r{commits-since-tag}.g{shortsha}
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf '0.8.0.r%s.g%s' \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd sentinel-kde
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd sentinel-kde
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    if [[ "${CARCH:-}" == "x86_64" ]]; then
        export RUSTFLAGS="${RUSTFLAGS:-} -C target-cpu=x86-64-v3"
    fi
    cargo build --frozen --release --workspace

    install -d target/release/share
    target/release/sentinel-polkit-agent completions bash > target/release/share/sentinel-polkit-agent.bash
    target/release/sentinel-polkit-agent completions fish > target/release/share/sentinel-polkit-agent.fish
    target/release/sentinel-polkit-agent completions zsh  > target/release/share/_sentinel-polkit-agent
    target/release/sentinel-polkit-agent man              > target/release/share/sentinel-polkit-agent.1
}

check() {
    cd sentinel-kde
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --workspace --locked \
        -p sentinel-shared -p pam-sentinel -p sentinel-polkit-agent
}

package() {
    cd sentinel-kde

    install -Dm755 target/release/sentinel-helper-kde \
        "$pkgdir/usr/lib/sentinel-helper-kde"
    install -Dm755 target/release/sentinel-polkit-agent \
        "$pkgdir/usr/lib/sentinel-polkit-agent"
    install -Dm755 target/release/libpam_sentinel.so \
        "$pkgdir/usr/lib/security/pam_sentinel.so"

    install -Dm644 config/sentinel.conf \
        "$pkgdir/etc/security/sentinel.conf"
    install -Dm644 config/polkit-1 \
        "$pkgdir/etc/pam.d/polkit-1"
    install -Dm644 config/sudo \
        "$pkgdir/usr/share/doc/sentinel-kde/sudo"
    install -Dm644 config/su \
        "$pkgdir/usr/share/doc/sentinel-kde/su"

    install -Dm644 packaging/systemd/user/sentinel-polkit-agent.service \
        "$pkgdir/usr/lib/systemd/user/sentinel-polkit-agent.service"
    install -d "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants"
    ln -s ../sentinel-polkit-agent.service \
        "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants/sentinel-polkit-agent.service"

    install -Dm644 packaging/dbus/org.sentinel.Agent.conf \
        "$pkgdir/usr/share/dbus-1/system.d/org.sentinel.Agent.conf"

    install -Dm644 packaging/arch/49-sentinel-admin.rules \
        "$pkgdir/etc/polkit-1/rules.d/49-sentinel-admin.rules"

    install -Dm644 target/release/share/sentinel-polkit-agent.bash \
        "$pkgdir/usr/share/bash-completion/completions/sentinel-polkit-agent"
    install -Dm644 target/release/share/sentinel-polkit-agent.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/sentinel-polkit-agent.fish"
    install -Dm644 target/release/share/_sentinel-polkit-agent \
        "$pkgdir/usr/share/zsh/site-functions/_sentinel-polkit-agent"

    install -Dm644 target/release/share/sentinel-polkit-agent.1 \
        "$pkgdir/usr/share/man/man1/sentinel-polkit-agent.1"
    install -Dm644 packaging/man/sentinel.conf.5 \
        "$pkgdir/usr/share/man/man5/sentinel.conf.5"
    install -Dm644 packaging/man/pam_sentinel.8 \
        "$pkgdir/usr/share/man/man8/pam_sentinel.8"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sentinel-kde/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/sentinel-kde/README.md"
}
