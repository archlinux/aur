# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

pkgname=rapidwright
_pkgver=2020.2.2-beta
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Build Customized FPGA Implementations for Vivado"
arch=('any')
url='http://www.rapidwright.io/'
license=('custom')
depends=('java-runtime' 'jython')
makedepends=('java-environment' 'gradle')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/Xilinx/RapidWright/archive/v$_pkgver.tar.gz"
	"rapidwright_data-${pkgver}.zip::https://github.com/Xilinx/RapidWright/releases/download/v$_pkgver/rapidwright_data.zip"
	"rapidwright_jars-${pkgver}.zip::https://github.com/Xilinx/RapidWright/releases/download/v$_pkgver/rapidwright_jars.zip"
	"fix-jar-build-issues.patch"
	"invoke_rapidwright"
)

sha256sums=('7c9d6d878de6789a69cf0be62e1f4c7a4027ccb3dd239dd900820c33502aa8bc'
            '209034844725477742d1c484a171c3930b6df1a057d24dd423484429365f0907'
            'f098785a7146a47892bf5af835202178b3bc34545571f8d1018dbf0eee2c19c8'
            'e4f4e416882f33e0b5c9674cc5575782209895d47b719d2df45a4d5fd179dc1f'
            'a0c2f5577cd955cb81aec2839c3c060dc78c6ee48dc99406f67cc902e98f644f')

prepare() {
	cd "RapidWright-$_pkgver"

	ln -s "$srcdir/jars" .

	patch -p1 < "$srcdir/fix-jar-build-issues.patch"
}

build() {
	cd "RapidWright-$_pkgver"

	gradle build
}

package() {
	cd "RapidWright-$_pkgver"
	
	install -Dm644 -t "$pkgdir/usr/share/java/$pkgname" "bin/libs/RapidWright-$_pkgver.jar" jars/*.jar
	rm "$pkgdir/usr/share/java/$pkgname/jython-standalone-2.7.2.jar"

	mkdir "$pkgdir/usr/share/rapidwright/"
	cp -a "$srcdir/data" "$pkgdir/usr/share/rapidwright/"
	chmod -R o+rX "$pkgdir/usr/share/rapidwright/"

	install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/invoke_rapidwright"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.TXT
}
