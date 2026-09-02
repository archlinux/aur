# Maintainer: Ayush Singh <ayush@beagleboard.org>
pkgname=bb-imager-cli
pkgver=1.0.15
pkgrel=1
pkgdesc="Tool for creating and flashing BeagleBoard OS images"
arch=('x86_64')
url="https://www.beagleboard.org/bb-imager"
license=('MIT')

depends=('xz' 'hidapi' 'libusb' 'glibc' 'libgcc')
makedepends=('rust' 'cpio')

source=("bb-imager-cli-$pkgver::https://github.com/beagleboard/bb-imager-rs/archive/refs/tags/$pkgver.tar.gz"
        "bb-imager-cli-vendor-$pkgver::https://github.com/beagleboard/bb-imager-rs/releases/download/$pkgver/cargo-vendor.tar.zst")
sha256sums=('f3fcef9d11d472bc26ea0f710d6c1009593933dd4c5b9b62b7f4159d8d3e2e4a'
            '62e56a5d04d38a7f5c3b6e2fd90d7ad10fe29a26e236171a97a0a8542bea4a98')

build() {
        cd "bb-imager-rs-$pkgver"
        make build-cli SYSTEM_DEPS=1 SHARED_HIDRAW=1 OFFLINE=1
}

package() {
        cd "bb-imager-rs-$pkgver"
        make install-cli DESTDIR="$pkgdir" PREFIX=/usr
        install -Dm644 LICENSE $pkgdir/usr/share/licenses/bb-imager-cli/MIT
}

check() {
        cd "bb-imager-rs-$pkgver"
        make check-cli SYSTEM_DEPS=1 SHARED_HIDRAW=1 OFFLINE=1
}
