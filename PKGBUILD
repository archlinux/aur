# Maintaiiner: ximlel <352109085@qq.com>

pkgname=ygopro
pkgver=1.034
pkgrel=3
pkgdesc="A script engine for “yu-gi-oh!” and sample gui"
arch=('i686' 'x86_64')
url='https://github.com/Fluorohydride/ygopro'
license=('GPL2')
depends=('freetype2' 'libevent' 'sqlite' 'irrlicht' 'lua')
makedepends=('gcc' 'make' 'premake')
backup=(opt/ygopro/system.conf)
source=("https://codeload.github.com/Fluorohydride/ygopro/tar.gz/v${pkgver}.${pkgrel}"
        "core.zip::https://codeload.github.com/Fluorohydride/ygopro-core/zip/master"
        "scripts.zip::https://codeload.github.com/Fluorohydride/ygopro-scripts/zip/master"
        "data.zip::https://gitee.com/ximlel/ygopro_data/repository/archive/v${pkgver}.${pkgrel}.zip")
sha256sums=('9a6c6aeea1bad1138d3d8218420b03d4078c0debf5638adce1a48075bdc218b8'
            "SKIP"
            "SKIP"
            '6c740184be7657d128ffbb96233e39c0ab932854216c4e23a3852926310283d5')
options=('emptydirs' '!buildflags' '!makeflags')

package() {
	cd "${srcdir}"
	mv -v ygopro-core-master/* "ygopro-${pkgver}.${pkgrel}/ocgcore"
	mv -v ygopro-scripts-master/* "ygopro-${pkgver}.${pkgrel}/script"
	cd "ygopro-${pkgver}.${pkgrel}"
	premake4 gmake
	cd build
	make all
	mv -v ../bin/debug/* ../
	make clean
	cd ..
	rm -R bin build obj gframe ocgcore
	sed -i "s/c:\/windows\/fonts/./" system.conf
	mkdir -pv "$pkgdir/opt/ygopro"
	cp -dRv * "$pkgdir/opt/ygopro"
	cd "${srcdir}/ygopro_data"
	mkdir -pv "$pkgdir/usr/share/pixmaps"	
	mv -v ygopro.png "$pkgdir/usr/share/pixmaps/ygopro.png"
	mkdir -pv "$pkgdir/usr/share/applications"
	mv -v ygopro.desktop "$pkgdir/usr/share/applications/ygopro.desktop"
	mv -v * "$pkgdir/opt/ygopro"
	cd "$pkgdir/opt/ygopro"
	find "$pkgdir/opt/ygopro" -type d -exec chmod 777 {} \;
	find "$pkgdir/opt/ygopro" -type f -exec chmod 777 {} \;
}

post_remove() {
	rm -R "$pkgdir/opt/ygopro"
}
