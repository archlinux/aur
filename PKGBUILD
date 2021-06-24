# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

pkgname=rapidwright
_pkgver=2020.2.6-beta
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
	"invoke_rapidwright"
)

sha256sums=('c48727499dad87687f90c7788adcd16c9c7ce4710cd2d26312ee436779ccd9b8'
            '3f4c549499ddcdfcb43878d960f351c9d406374b0a47180e51bb55ebf580a56b'
            '43ff56e12f840e6749578cbfea62ad4e604545747b7797fa94ea0d9bbf7a0d07'
            'a0c2f5577cd955cb81aec2839c3c060dc78c6ee48dc99406f67cc902e98f644f')

prepare() {
	cd "RapidWright-$_pkgver"

	ln -s "$srcdir/jars" .
}

build() {
	cd "RapidWright-$_pkgver"

	gradle build
}

package() {
	cd "RapidWright-$_pkgver"

	install -Dm644 -t "$pkgdir/usr/share/java/$pkgname" "build/libs/rapidwright.jar" jars/*.jar
	rm "$pkgdir/usr/share/java/$pkgname/jython-standalone-2.7.2.jar"

	mkdir "$pkgdir/usr/share/rapidwright/"
	cp -a "$srcdir/data" "$pkgdir/usr/share/rapidwright/"
	chmod -R o+rX "$pkgdir/usr/share/rapidwright/"

	install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/invoke_rapidwright"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.TXT
}
