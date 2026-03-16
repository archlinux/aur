# Maintainer: LifeOfATitan <abdoul@designsunreal.com>
pkgname=orbit-wifi
pkgver=2.3.0
pkgrel=1
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
sha256sums=('4004d82ed327a3693b793362e4f1ee5723c6ad6931ace5f902af7dc764fd21f1'
            'c48aacf0c8020cb7a2d8a4796d2c0b3826eea91a28aa325ec1a61acb99b8216a')

prepare() {
    cd "orbit-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "orbit-$pkgver"
    # The aws-lc-sys crate has a known conflict with standard Arch Linux CFLAGS/CXXFLAGS
    # specifically around jitterentropy which must be compiled with -O0.
    # We clear the environment flags to allow the crate's build script to manage its own optimizations.
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS
    
    export AWS_LC_SYS_CMAKE_BUILDER=1
    cargo build --frozen --release
}

package() {
    cd "orbit-$pkgver"
    install -Dm755 "target/release/orbit" "$pkgdir/usr/bin/orbit"
    
    # Install systemd service
    install -Dm644 "$srcdir/orbit.service" "$pkgdir/usr/lib/systemd/user/orbit.service"
    
    # Install README and LICENSE
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
