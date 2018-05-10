# Maintaiiner: ximlel <352109085@qq.com>

pkgname=ygopro
pkgver=1.034
pkgrel=3
pkgdesc="A script engine for “yu-gi-oh!” and sample gui"
arch=('i686' 'x86_64')
url='https://github.com/Fluorohydride/ygopro'
license=('GPL2')
depends=('gcc' 'git' 'make' 'premake' 'freetype2' 'libevent' 'sqlite' 'irrlicht' 'lua')
backup=(opt/ygopro/system.conf)
source=("https://codeload.github.com/Fluorohydride/ygopro/tar.gz/v${pkgver}.${pkgrel}")
source=("https://codeload.github.com/Fluorohydride/ygopro-core/zip/master")
source=("https://codeload.github.com/Fluorohydride/ygopro-scripts/zip/master")
source=("https://gitee.com/ximlel/ygopro_data/repository/archive/v${pkgver}.${pkgrel}.zip")
sha256sums=('9a6c6aeea1bad1138d3d8218420b03d4078c0debf5638adce1a48075bdc218b8'
            "SKIP"
            "SKIP"
            "SKIP")
options=('emptydirs')

package() {
	cd "${srcdir}"
	tar -xzvf "ygopro-${pkgver}.${pkgrel}.tar.gz"
	unzip ygopro-core-master.zip
	unzip ygopro-scripts-master.zip
	unzip "v${pkgver}.${pkgrel}.zip"
	rm -R ygopro-core/.git
	rm -R ygopro-scripts/.git
	mv ygopro-core/* "ygopro-${pkgver}.${pkgrel}/ocgcore"
	mv ygopro-scripts/* "ygopro-${pkgver}.${pkgrel}/script"
	mv ygopro-data/* "ygopro-${pkgver}.${pkgrel}"
	cd "ygopro-${pkgver}.${pkgrel}"
	premake4 gmake
	cd build
	make all
	mv ../bin/debug/* ../
	make clean
	cd ..
	rm -R bin build obj gframe ocgcore
	sed -i "s/c:\/windows\/fonts/./" system.conf
	mv -v ygopro.png "$pkgdir/usr/share/pixmaps/ygopro.png"
	mv -v ygopro.desktop "$pkgdir/usr/share/applications/ygopro.desktop"
	mkdir -pv "$pkgdir/opt/ygopro"
	cp -dRv * "$pkgdir/opt/ygopro"
	cd "$pkgdir/opt/ygopro"
	find "$pkgdir/opt/ygopro" -type d -exec chmod 777 {} \;
	find "$pkgdir/opt/ygopro" -type f -exec chmod 777 {} \;
}

post_remove() {
	rm -R "$pkgdir/opt/ygopro"
}
