# Maintainer: Oscar Shrimpton <oscar.shrimpton.personal@gmail.com>,
pkgname=sleuthkit-java
pkgver=4.10.2
pkgrel=1
pkgdesc='Java bindings for The Sleuth Kit.'
arch=(x86_64)
url='http://www.sleuthkit.org/sleuthkit'
license=('CPL', 'custom:"IBM Public Licence"', 'GPL2')
depends=(java-environment=8 java8-openjfx sleuthkit)
makedepends=(ant)
source=("https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-${pkgver}/sleuthkit-${pkgver}.tar.gz")
sha512sums=('71fe5dc2311ffea50d3dcb2524fee65fe49051c1ea021b0b33c003d7c9d6fffc28db2b3258c642571c51ce79089c99e835207df8f463b6ec2a06e041e487c960')

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
