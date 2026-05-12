# Maintainer: Ayush Singh <ayush@beagleboard.org>
pkgname=bb-imager-cli
pkgver=1.0.7
pkgrel=1
pkgdesc="Tool for creating and flashing BeagleBoard OS images"
arch=('x86_64')
url="https://www.beagleboard.org/bb-imager"
license=('MIT')

depends=('xz' 'hidapi' 'libusb' 'glibc' 'libgcc')
makedepends=('rust' 'cpio')

source=("bb-imager-cli-$pkgver::https://github.com/beagleboard/bb-imager-rs/archive/refs/tags/$pkgver.tar.gz"
        "bb-imager-cli-vendor-$pkgver::https://github.com/beagleboard/bb-imager-rs/releases/download/$pkgver/cargo-vendor.tar.zst")
sha256sums=('1fc64ed93328d5b96da92fb2a33502f4b2430be684bdf2205c1b3143ed281b22'
            '620944b6fe79bc8927c1d3ba3e5015f69ee78fe3a3369a603e9ecbe98be078e9')

prepare() {
        cd "bb-imager-rs-$pkgver"

        mkdir -p .cargo
        cat > .cargo/config.toml <<EOF
[source.crates-io]
replace-with = "vendored-sources"

[source.vendored-sources]
directory = "${srcdir}/vendor"
EOF
}

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
        make check-cli
        make test-cli
}
