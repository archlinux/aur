# Maintainer: Matthieu Bessat <mail at matthieubessat dot fr>

_pkgname=pads
pkgname=${_pkgname}-git
pkgver=0.2.6.r0.gc7b4563
pkgrel=1
pkgdesc="A simple CLI tool for switching the default/active output device for PulseAudio."
arch=('i686' 'x86_64')
url="https://github.com/dogue/pads"
license=('MIT')
depends=('libpulse')
makedepends=('rust' 'cargo' 'git')
conflicts=()
source=("git+https://github.com/dogue/pads.git")
md5sums=('SKIP')


pkgver() {
    cd $_pkgname
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
    cd $_pkgname
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $_pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd $_pkgname
    install -Dm755 "target/release/$_pkgname" \
        -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
