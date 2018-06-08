# Maintaiiner: ximlel <352109085@qq.com>

pkgname=ygopro
pkgver=1.034
pkgrel=4
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
sha256sums=('b51d4fa75a485a9bc8446081583a97150b1ff65f03ff16e33d7fd95998491fec'
            "SKIP"
            "SKIP"
            '9b0e2d4485f8a5cc9f033be3a05ce7afdf10d538e8fe88eb3c5557d750a365f4')
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
