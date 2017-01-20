# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=vagga
pkgver=0.7.0
_alpinever=3.5
_keysver=1.3-r0
_apktoolsver=2.6.8-r1
_busyboxver=1.25.1-r0
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
sha256sums=('d9b6a1fad89b632daa8de206bd7dc586515ec273436217129c0259d7236c0349'
            'ef73b2b6f96d8b0dae94d0165b73576f0b5397e83c461a0f1e7ea3920a1b2bcd'
            '8f406358142e48166723e928bb1f087f3da0b1231f6e79a2249b9d83290133b6'
            'a81259ceb80c29f3d622119c6c104d06799df581decfc3ffc62cea01bdbe9412'
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
