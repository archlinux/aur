# Maintaiiner: ximlel <352109085@qq.com>

pkgname=ygopro
pkgver=1.034
pkgrel=3
pkgdesc="A script engine for \"yu-gi-oh!\" and sample gui"
arch=('i686' 'x86_64')
url='https://github.com/Fluorohydride/ygopro'
license=('GPL2')
depends=('gcc' 'git' 'make' 'premake' 'freetype2' 'libevent' 'sqlite' 'irrlicht' 'lua')
backup=(opt/ygopro/system.conf)
source=("https://codeload.github.com/Fluorohydride/ygopro/tar.gz/v${pkgver}.${pkgrel}")
sha256sums=('9a6c6aeea1bad1138d3d8218420b03d4078c0debf5638adce1a48075bdc218b8')
options=('emptydirs')

package() {
	cd "$pkgdir/usr/lib"
	ln -s liblua5.3.so liblua.so
	cd "${srcdir}/ygopro-${pkgver}.${pkgrel}"
	git clone --depth 1 https://github.com/Fluorohydride/ygopro-core.git
	git clone --depth 1 https://github.com/Fluorohydride/ygopro-scripts.git
	rm -R "ygopro-core/.git"
	rm -R "ygopro-scripts/.git"
	mv ygopro-core/* "ocgcore"
	mv ygopro-scripts/* "script"
	rm -rf "ygopro-core"
	rm -rf "ygopro-scripts"
	premake4 gmake
	cd "build"
	make all
	mv ../bin/debug/* ../
	make clean
	cd ..
	rm -R "bin" "build" "obj"
	mkdir -pv "$pkgdir/opt/ygopro"
	cp -dRv * "$pkgdir/opt/ygopro"
	cd "$pkgdir/opt/ygopro"
	find "$pkgdir/opt/ygopro" -type d -exec chmod 777 {} \;
	find "$pkgdir/opt/ygopro" -type f -exec chmod 777 {} \;
}

post_remove() {
	rm -R /opt/ygopro
}
