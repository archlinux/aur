# Contributor: Ivy Foster <code@escondida.tk>
# Reference: PKGBUILD(5)

pkgname=libbulletml
pkgver=0.0.6
pkgrel=6
pkgdesc='C++ library to handle BulletML, a markup language to describe bullets in shooting games.'
url='http://shinh.skr.jp/libbulletml/index_en.html'
license=('custom:libbulletml')

arch=(x86_64 i686)
source=(
	"http://shinh.skr.jp/libbulletml/libbulletml-$pkgver.tar.bz2"
	'http://shinh.skr.jp/d/d_cpp.tar.bz2'
	"http://http.debian.net/debian/pool/main/b/bulletml/bulletml_$pkgver-7.debian.tar.xz"
	Makefile
)
# Upstream does not provide checksums, though Debian does for their patches,
# so take the first two checksums with a grain of salt.
sha256sums=(
	7c37f3d2d52825417c5de716f89bea4b71156371e698e2579daf7921df07aa79
	f0a9f01ef9daaa980f876253c81e8e76eea17b7de1aa569bf23661b456c5c9d3
	e85182a82604b4bc3c3f42b35f5d77decd327239602bcc4b5ac3a2e1269f211e
	30495a94bb378d1744d902ccc84a44cdf855f448e66a08afb1dda32f0c4a10a8
)
noextract=(d_cpp.tar.bz2)

prepare() {
	cd bulletml
	tar xf "$srcdir/d_cpp.tar.bz2"
	for patch in ../debian/patches/*.patch; do
		patch -Np1 < "$patch"
	done

	cp "$srcdir/Makefile" src
}

build() {
	make -C bulletml/src
}

package() {
	cd bulletml

	make -C src DESTDIR="$pkgdir" prefix=/usr install

	install -D -m 644 README "$pkgdir/usr/share/doc/libbulletml/README.jp"
	install -m 644 README.en "$pkgdir/usr/share/doc/libbulletml"
	install -m 644 README.bulletml "$pkgdir/usr/share/doc/libbulletml"

	install -D -m 644 README "$pkgdir/usr/share/licenses/libbulletml/README.jp"
	install -m 644 README.en "$pkgdir/usr/share/licenses/libbulletml"
}
