# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=vagga
pkgver=0.6.1
_alpinever=3.3
_keysver=1.1-r0
_apktoolsver=2.6.5-r1
_busyboxver=1.24.2-r0
pkgrel=1
pkgdesc="A containerisation tool without daemons"
arch=('i686' 'x86_64')
url="http://vagga.readthedocs.org"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git' 'wget')
install=vagga.install
# fetch_binaries.sh contains the alpine apk references
source=("https://github.com/tailhook/vagga/archive/v$pkgver/vagga-$pkgver.tar.gz"
        "http://dl-3.alpinelinux.org/alpine/v$_alpinever/main/x86_64/alpine-keys-$_keysver.apk"
        "http://dl-3.alpinelinux.org/alpine/v$_alpinever/main/x86_64/apk-tools-static-$_apktoolsver.apk"
        "http://dl-3.alpinelinux.org/alpine/v$_alpinever/main/x86_64/busybox-static-$_busyboxver.apk"
        "MIRRORS.txt")
noextract=("alpine-keys-$_keysver.apk")
sha256sums=('f63f342e4d8a54cf75ae1cd13a2af64ad49b6402c42ead9e1ecc619f7cf0f8de'
            'bd1f365f1dbda97e02fceb86fe4ff7e220f31ecc9debfd2a0c43764b45d31d0e'
            '03162d70e6d42eea77624a8da76d69e665ca19aa834361c3652414f111884636'
            '3a2ff02c8d8ebc29c019ddc15216b0fee5a59c95b02edd523da6aef621f29488'
            'ba0377e6a562774240a223a8411788384d022b4d26be16f8474c6da38bc2dd4f')

prepare() {
	cd "$pkgname-$pkgver"
  mkdir -p alpine
  ln -s ../../MIRRORS.txt alpine/MIRRORS.txt
  ln -s ../sbin/apk.static apk
  ln -s ../bin/busybox.static busybox
  ln -s ../alpine-keys-$_keysver.apk alpine-keys.apk
}

build() {
	cd "$pkgname-$pkgver"
	VAGGA_VERSION="$pkgver" cargo build --release
	cp --remove-destination target/release/vagga .
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
