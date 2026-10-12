# Maintainer: Ayush Singh <ayush@beagleboard.org>
pkgname=bb-imager-cli
pkgver=1.0.20
pkgrel=1
pkgdesc="Tool for creating and flashing BeagleBoard OS images"
arch=('x86_64')
url="https://www.beagleboard.org/bb-imager"
license=('MIT')

depends=('xz' 'hidapi' 'libusb' 'glibc' 'libgcc')
makedepends=('rust' 'cpio')

source=("bb-imager-cli-$pkgver::https://github.com/beagleboard/bb-imager-rs/archive/refs/tags/$pkgver.tar.gz"
        "bb-imager-cli-vendor-$pkgver::https://github.com/beagleboard/bb-imager-rs/releases/download/$pkgver/cargo-vendor.tar.zst")
sha256sums=('1efdbde3e56bc2ebd66c5939a440f4a2fc015996068615eafc03f6d71f4dd0d8'
            '8d2f77e868b2178a3206202aeab97c1bbea64646cb384a4201c271b61a97272b')

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
