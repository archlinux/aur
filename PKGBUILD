# Maintainer: Ayush Singh <ayush@beagleboard.org>
pkgname=bb-imager-cli
pkgver=1.0.8
pkgrel=1
pkgdesc="Tool for creating and flashing BeagleBoard OS images"
arch=('x86_64')
url="https://www.beagleboard.org/bb-imager"
license=('MIT')

depends=('xz' 'hidapi' 'libusb' 'glibc' 'libgcc')
makedepends=('rust' 'cpio')

source=("bb-imager-cli-$pkgver::https://github.com/beagleboard/bb-imager-rs/archive/refs/tags/$pkgver.tar.gz"
        "bb-imager-cli-vendor-$pkgver::https://github.com/beagleboard/bb-imager-rs/releases/download/$pkgver/cargo-vendor.tar.zst")
sha256sums=('1150cda2f33c63dc75696e5cac9883e9ec363859661d22525868817efc71c914'
            '1294e5345d4d3e6f1c4559d0438a9fd028b721263d8c45a530b77280a98da79a')

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
        make check-cli SYSTEM_DEPS=1 SHARED_HIDRAW=1 OFFLINE=1
}
