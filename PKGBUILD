# Maintainer: Oscar Shrimpton <oscar.shrimpton.personal@gmail.com>,
pkgname=sleuthkit-java
pkgver=4.7.0
pkgrel=0
pkgdesc='Java bindings for The Sleuth Kit.'
arch=(x86_64)
url='http://www.sleuthkit.org/sleuthkit'
license=('CPL', 'custom:"IBM Public Licence"', 'GPL2')
depends=(java-environment=8 java8-openjfx sleuthkit)
makedepends=(ant)
source=("https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-${pkgver}/sleuthkit-${pkgver}.tar.gz" "build-tmp-dir.patch" "download-deps-https.patch" "download-ivy-https.patch")
md5sums=('ffd33f3130f954583527b31242bbaefa'
         '8a39286ec6585c5298073043af3b4dcf'
         'f951e410ecef03c978d9d2034871fb35'
         '13c842d0bcc03867548d10e7808e3aa6')

prepare() {
	patch "sleuthkit-${pkgver}/bindings/java/build.xml" build-tmp-dir.patch
	patch "sleuthkit-${pkgver}/bindings/java/build.xml" download-ivy-https.patch
	patch "sleuthkit-${pkgver}/bindings/java/ivysettings.xml" download-deps-https.patch
}

build() {
	cd "sleuthkit-${pkgver}"
	
	# build main program
	./configure
	make

	# build java bindings
	cd bindings/java
	ant
}

package() {
	# copy to package
	mkdir -p $pkgdir/usr/share/java/
	cp "sleuthkit-${pkgver}/bindings/java/dist/sleuthkit-${pkgver}.jar" $pkgdir/usr/share/java
}
