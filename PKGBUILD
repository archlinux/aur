# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

pkgname=rapidwright
_pkgver=2020.2.5-beta
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

sha256sums=('77839103eba44239b7167c10595e0f1c9adc1fe66dfd90b6ffb1a8ef3fec431e'
            'de0402d738911db0cb9dd3342a7ed20bbb43ef87e1768ed669fc1611e74f4031'
            '6f369a18819b91e03c9a9c471dd09a596f14aa0b9a4c8f4541cfb9ecf168df50'
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
