# Maintainer: Gabriel Francisco dos Santos <gabriel at goodstream dot com>

pkgname=papagaia-git
pkgver=r15.a0945d6
pkgrel=1
pkgdesc='Voice-writing and text-rewriting tool for Linux Wayland desktops'
arch=('x86_64')
url='https://github.com/ceifa/papagaia'
license=('MIT')
depends=('gcc-libs' 'glibc' 'alsa-lib' 'gtk4' 'gtk4-layer-shell')
makedepends=('cargo' 'git')
optdepends=(
    'wl-clipboard: clipboard support on Wayland'
    'wtype: keyboard simulation on Wayland'
    'ydotool: keyboard simulation (alternative to wtype)'
    'whisper.cpp: local speech-to-text for dictation'
)
provides=("papagaia=${pkgver}")
conflicts=('papagaia')
source=("${pkgname}::git+https://github.com/ceifa/papagaia.git"
        'papagaia-daemon.service')
sha256sums=('SKIP'
            '2f2d18e22d6f2fa0b7ac1a7cede9cb2a913ab63894dfdd1d08cc695cce616304')
install=papagaia.install

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$pkgname"
    install -Dm0755 target/release/papagaia "$pkgdir/usr/bin/papagaia"
    install -Dm0755 target/release/papagaia-daemon "$pkgdir/usr/bin/papagaia-daemon"
    install -Dm0755 target/release/papagaia-overlay "$pkgdir/usr/bin/papagaia-overlay"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "$srcdir/papagaia-daemon.service" "$pkgdir/usr/lib/systemd/user/papagaia-daemon.service"
}
