# Maintainer: Luís Ferreira <net dot lsferreira at contact, backwards>
# Contributor: Oscar Shrimpton <oscar.shrimpton.personal@gmail.com>
# Contributor: GI Jack <GI_Jack@hackermail.com>

pkgname=sleuthkit-java
pkgver=4.11.1
pkgrel=3
pkgdesc='Java bindings for The Sleuth Kit.'
arch=(x86_64)
url='http://www.sleuthkit.org/sleuthkit'
license=('CPL', 'custom:"IBM Public Licence"', 'GPL2')
depends=(java-runtime=8 java8-openjfx sleuthkit)
optdepends=('sqlite-jdbc: For JDBC SQLite support')
makedepends=(ant java-environment=8)
source=("https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-${pkgver}/sleuthkit-${pkgver}.tar.gz")
sha512sums=('04e4ca1c18bda56c816aa493eb3b887f2f62162e16c35079d4208b89464a78109fc189fec55ea6db8a60ab01a4e46c87902f00286abee203ff0c53ab572cfeda')

build() {
	cd "sleuthkit-${pkgver}"

	# build main program
	aclocal
	automake
	./configure --prefix=/usr
	make

	# build java bindings
	(cd bindings/java;
		ant -q dist
	)

	(cd case-uco/java;
		ant -q
	)

}

package() {
	cd "sleuthkit-${pkgver}"

	install -d "$pkgdir/usr/share/java"
	install -Dm0644 "bindings/java/dist/sleuthkit-${pkgver}.jar" "$pkgdir/usr/share/java"
	install -Dm0644 "case-uco/java/dist/sleuthkit-caseuco-${pkgver}.jar" "$pkgdir/usr/share/java"

	install -d "$pkgdir/usr/lib"
	install -Dm0644 "bindings/java/jni/.libs"/*.so.0.0.0 "$pkgdir/usr/lib"
	ln -s /usr/lib/libtsk_jni.so.0.0.0 "$pkgdir/usr/lib/libtsk_jni.so.0"
	ln -s /usr/lib/libtsk_jni.so.0.0.0 "$pkgdir/usr/lib/libtsk_jni.so"
}
