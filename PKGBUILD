# Contributor: Ivy Foster <ivy.foster@gmail.com>
# Reference: PKGBUILD(5)

pkgname=libbulletml
pkgver=0.0.6
pkgrel=1
pkgdesc='C++ library to handle BulletML, a markup language to describe bullets in shooting games.'
url='http://shinh.skr.jp/libbulletml/index_en.html'
license=('custom:libbulletml')
changelog='libbulletml.changelog'

arch=('x86_64' 'i686')
source=("http://shinh.skr.jp/libbulletml/libbulletml-$pkgver.tar.bz2"
	'http://shinh.skr.jp/d/d_cpp.tar.bz2'
	"http://http.debian.net/debian/pool/main/b/bulletml/bulletml_$pkgver-5.debian.tar.bz2")
# upstream does not provide checksums, though Debian does for their patches
sha256sums=('SKIP' 'SKIP'
	'f6ef24ea2dd1d572bee08207176d150b3a52b7075e4da9a05af3376fd8cbb672')
noextract=('d_cpp.tar.bz2')

prepare() {
	cd bulletml
	tar xf "$srcdir"/d_cpp.tar.bz2
	for patch in "$srcdir"/debian/patches/*.patch; do
		patch -Np1 < "$patch"
	done
}

build() {
	cd bulletml
	make -C src libbulletml.a
	rm -f src/*.o src/*/*.o # yes, really, this actually *is* necessary
	make -C src CFLAGS="$CFLAGS -fPIC -fpic" CXXFLAGS="$CFLAGS -fPIC -fpic" \
		LDFLAGS="-Wl,-z,defs" libbulletml.so
}

package() {
	cd bulletml

	install -D -m 644 src/bulletml.d "$pkgdir"/usr/include/d/bulletml.d
	install -d "$pkgdir"/usr/include/bulletml/tinyxml
	install -m 644 src/*.h "$pkgdir"/usr/include/bulletml
	install -m 644 src/tinyxml/tinyxml.h "$pkgdir"/usr/include/bulletml/tinyxml

	install -d "$pkgdir"/usr/lib
	install -m 644 src/libbulletml.{a,so} "$pkgdir"/usr/lib

	install -D -m 644 README "$pkgdir"/usr/share/doc/libbulletml/README.jp
	install -m 644 README.en "$pkgdir"/usr/share/doc/libbulletml
	install -m 644 README.bulletml "$pkgdir"/usr/share/doc/libbulletml
	install -D -m 644 README "$pkgdir"/usr/share/licenses/libbulletml/README.jp
	install -m 644 README.en "$pkgdir"/usr/share/licenses/libbulletml
}
