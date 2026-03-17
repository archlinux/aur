# Maintainer: LifeOfATitan <abdoul@designsunreal.com>
pkgname=orbit-wifi
pkgver=2.3.0
pkgrel=6
pkgdesc="A WiFi/Bluetooth manager for Wayland with glassmorphism UI"
arch=('x86_64')
url="https://github.com/LifeOfATitan/orbit"
license=('MIT')
options=(!debug)
install=orbit.install
depends=(
    'gtk4'
    'gtk4-layer-shell'
    'networkmanager'
    'bluez'
)
makedepends=(
    'cargo'
    'rust'
    'cmake'
    'nasm'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "orbit.service")
sha256sums=('8c6f447a862c6b75a73bcc9a10089a36f00e0eb1405eccd0f10545f06a7cf2a7'
            'c48aacf0c8020cb7a2d8a4796d2c0b3826eea91a28aa325ec1a61acb99b8216a')

prepare() {
    cd "orbit-$pkgver"
    export CFLAGS="${CFLAGS/-O2/}"
    export CXXFLAGS="${CXXFLAGS/-O2/}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "orbit-$pkgver"
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS
    export AWS_LC_SYS_CMAKE_BUILDER=1
    cargo build --frozen --release
}

package() {
    cd "orbit-$pkgver"
    install -Dm755 "target/release/orbit" "$pkgdir/usr/bin/orbit"
    install -Dm644 "$srcdir/orbit.service" "$pkgdir/usr/lib/systemd/user/orbit.service"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
