# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>
# Contributor: Luís Ferreira <net dot lsferreira at contact, backwards>
# Contributor: Oscar Shrimpton <oscar.shrimpton.personal@gmail.com>
# Contributor: GI Jack <GI_Jack@hackermail.com>

pkgname=sleuthkit-java
pkgver=4.15.0
pkgrel=1
pkgdesc='Java bindings for The Sleuth Kit.'
arch=(x86_64)
url='http://www.sleuthkit.org/sleuthkit'
license=('CPL-1.0' 'IPL-1.0' 'GPL-2.0-only')
depends=(java-runtime=17 java-openjfx=17 sleuthkit)
optdepends=('sqlite-jdbc: For JDBC SQLite support')
makedepends=(ant java-environment=17)
source=("https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-${pkgver}/sleuthkit-${pkgver}.tar.gz")
sha512sums=('754ca24c13ce62703aca3a55fa21dcd04fd7b3febfd0c21b2adaa304439ae56bbab588a355680f7063b826920c9ae0abb17c2e7f5d40eb745c1a957ce283cba9')

build() {
	cd "sleuthkit-${pkgver}"

	# build main program
	autoreconf -fi
	CFLAGS="-std=gnu17" ./configure --prefix=/usr --enable-java
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
	
	install -D licenses/IBM-LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm0644 "bindings/java/dist/sleuthkit-${pkgver}.jar" -t "$pkgdir/usr/share/java"
	install -Dm0644 "case-uco/java/dist/sleuthkit-caseuco-${pkgver}.jar" -t "$pkgdir/usr/share/java"

	install -Dm0644 "bindings/java/jni/.libs"/*.so.0.0.0 -t "$pkgdir/usr/lib"
	ln -s /usr/lib/libtsk_jni.so.0.0.0 "$pkgdir/usr/lib/libtsk_jni.so.0"
	ln -s /usr/lib/libtsk_jni.so.0.0.0 "$pkgdir/usr/lib/libtsk_jni.so"
}
