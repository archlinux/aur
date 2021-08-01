# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

pkgname=rapidwright
_pkgver=2021.1.0-beta
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

sha256sums=('b0e9b8e13ee7b02d3e3ed3ac8ff4302215fd48fab0078f3babe5aad18d734fb4'
            'd05cb8939bf6d76b42c66335d349b33ae251e56432575948a1724d2040287203'
            '1b4fdc497e6ffa75fdca3b0fc369cb42325c56f1775d3fd19e16c8850319c38b'
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
