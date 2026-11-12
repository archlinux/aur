# Maintainer: Ayush Singh <ayush@beagleboard.org>
pkgname=bb-imager-cli
pkgver=1.0.21
pkgrel=1
pkgdesc="Tool for creating and flashing BeagleBoard OS images"
arch=('x86_64')
url="https://www.beagleboard.org/bb-imager"
license=('MIT')

depends=('xz' 'hidapi' 'libusb' 'glibc' 'libgcc')
makedepends=('rust' 'cpio')

source=("bb-imager-cli-$pkgver::https://github.com/beagleboard/bb-imager-rs/archive/refs/tags/$pkgver.tar.gz"
        "bb-imager-cli-vendor-$pkgver::https://github.com/beagleboard/bb-imager-rs/releases/download/$pkgver/cargo-vendor.tar.zst")
sha256sums=('94529901d670f2a2a30209e9a0be897509f0b9bc9df2a3d9062531c8512f22c2'
            'e57cf3c790496f5753cb063b3b50d79f2156ccb33e0dd6aa9e01761c904b06e6')

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
