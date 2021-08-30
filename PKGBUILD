# Maintainer: Luís Ferreira <net dot lsferreira at contact, backwards>
# Contributor: Oscar Shrimpton <oscar.shrimpton.personal@gmail.com>
# Contributor: GI Jack <GI_Jack@hackermail.com>

pkgname=sleuthkit-java
pkgver=4.11.0
pkgrel=1
pkgdesc='Java bindings for The Sleuth Kit.'
arch=(x86_64)
url='http://www.sleuthkit.org/sleuthkit'
license=('CPL', 'custom:"IBM Public Licence"', 'GPL2')
depends=(java-environment=11 java11-openjfx sleuthkit)
makedepends=(ant)
source=("https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-${pkgver}/sleuthkit-${pkgver}.tar.gz")
sha512sums=('fabaf0e7815145f82cf7d8c342d403939511afa36f29318a89212a8aa1a3465e2050629ff9e308b34cfeb3c2c98efa94f9546737cba749c075c4e583b8808580')

build() {
	cd "sleuthkit-${pkgver}"

	# build main program
	aclocal
	automake
	./configure --prefix=/usr
	make

	# build java bindings
	cd bindings/java
	ant
}

package() {
	cd "sleuthkit-${pkgver}"

	install -d "$pkgdir/usr/share/java"
	install -Dm0644 "bindings/java/dist/sleuthkit-${pkgver}.jar" "$pkgdir/usr/share/java"

	install -d "$pkgdir/usr/lib"
	install -Dm0644 "bindings/java/jni/.libs"/*.so "$pkgdir/usr/lib"
	install -Dm0644 "bindings/java/jni/.libs"/*.so.* "$pkgdir/usr/lib"
}
