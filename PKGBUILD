# Maintainer: Cian Ormond <aur@cianormond.com>
pkgname='vatprism'
pkgver=0.3.4
pkgrel=1
pkgdesc="VATSIM map and data explorer"
arch=(x86_64)
url="https://vatprism.org"
license=('AGPL3')
depends=('java-runtime>=15')
makedepends=('maven' 'java-environment>=15')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marvk/vatprism/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e76b015809eff1ff17a83bf6bfd674994bee236798c4d32dccdaed4f8c80174d')

build() {
	cd "$pkgname-$pkgver"
	mvn package
}

package() {
	cd "$pkgname-$pkgver"
	echo "#!/bin/sh" > vatprism
	echo "exec /usr/bin/java -jar '/usr/share/java/vatprism/vatprism.jar' \"$@\"" >> vatprism
	chmod +rwx vatprism
	install -D vatprism "$pkgdir/usr/bin/vatprism"
	cd "target-fat-jar"
	install -D "vatsim-map-$pkgver-fat.jar" "$pkgdir/usr/share/java/vatprism/vatprism.jar"
}
