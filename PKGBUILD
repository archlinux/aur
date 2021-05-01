# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

pkgname=rapidwright
_pkgver=2020.2.4-beta
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
	"0001-build.gradle-replace-deprecated-compile-configuratio.patch"
	"invoke_rapidwright"
)

sha256sums=('c1671f1c08b9b16da5c6c7f9e04ef772d99d973a9c2d6d3123521f1baa42d767'
            '35ad60693e9aba3f6fe362f06c0bf9a267e86915b1d54553620582be8bb2d4d6'
            '0e42d1c67911b943f8fe93dfcbc9c110e9b2b80bc306f546a0e20e34eb92e2b3'
            '3d9de7c0f43a830b076e6a9fb3e27f958680e684b15fb2e2d8ff3a6aa2c0c25c'
            'a0c2f5577cd955cb81aec2839c3c060dc78c6ee48dc99406f67cc902e98f644f')

prepare() {
	cd "RapidWright-$_pkgver"

	ln -s "$srcdir/jars" .

	patch -p1 < "$srcdir/0001-build.gradle-replace-deprecated-compile-configuratio.patch"
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
