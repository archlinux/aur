# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

pkgname=rapidwright
_pkgver=2022.1.2-beta
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Build Customized FPGA Implementations for Vivado"
arch=('any')
url='http://www.rapidwright.io/'
license=('custom')
depends=('java-runtime=17' 'jython')
makedepends=('java-environment=17' 'gradle')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/Xilinx/RapidWright/archive/v$_pkgver.tar.gz"
	"rapidwright_data-${pkgver}.zip::https://github.com/Xilinx/RapidWright/releases/download/v$_pkgver/rapidwright_data.zip"
	"rapidwright_jars-${pkgver}.zip::https://github.com/Xilinx/RapidWright/releases/download/v$_pkgver/rapidwright_jars.zip"
	"invoke_rapidwright"
)

sha256sums=('1cde4697ae93b9fdab5e02cb7cc3b8c37d835ccd94631346dd457d25b86b301a'
            'b5652bff9c95fc81a3eec4231924efaa77485962869a880efff2ed6df641a420'
            '6dde609984431f6a91dbd7b78b4e04d42ff828593c79c9b6faf6f8b758d58668'
            'a0c2f5577cd955cb81aec2839c3c060dc78c6ee48dc99406f67cc902e98f644f')

prepare() {
	cd "RapidWright-$_pkgver"

	ln -s "$srcdir/jars" .
}

build() {
	cd "RapidWright-$_pkgver"

	gradle build --exclude-task test
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
