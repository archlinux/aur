#Maintainer: Bazza <bazza@riseup.net>

pkgname=('kumoworks')
pkgver=1.0.1
pkgrel=1
pkgdesc="KumoWorks is a cloud rendering tool for animation production."
provides=("storyboarder")
depends=('qt5-tools'  )
makedepends=('cmake')
url='https://github.com/opentoonz/kumoworks'
arch=('x86_64')
source=("https://github.com/opentoonz/kumoworks/archive/refs/tags/v${pkgver}.zip")
md5sums=('d23c02b5529fc3623f46f4d2605160f8')
license=('BSD 3-Clause "New" or "Revised" License')
options=(!strip)

prepare(){
	cd kumoworks-${pkgver}
	sed -i 's/include <QPainter>/include <QPainter>\n#include <QPainterPath>/g' sources/*cpp
	cp sources/RandomNumberGenerator.h sources/randomnumbergenerator.h
	mkdir build
	cd build
	cmake ../sources/
	make
	echo "[Desktop Entry]
Name=KumoWorks
Exec=/opt/kumoworks/kumoworks
Icon=kumoworks
Type=Application
Terminal=false
StartupNotify=true
Categories=Graphics;" > "${srcdir}"/kumoworks-${pkgver}/kumoworks.desktop
}

package(){
     mkdir -p "${pkgdir}"/usr/bin/
     echo -e '#!/bin/sh\n/opt/kumoworks/kumoworks' > "${pkgdir}"/usr/bin/kumoworks
     chmod 755 "${pkgdir}"/usr/bin/kumoworks
     mkdir -p "${pkgdir}"/usr/share/applications/
     mkdir -p "${pkgdir}"/usr/share/pixmaps/
     mkdir -p "${pkgdir}"/opt/kumoworks/
     curl https://download.tuxfamily.org/4232/icons/kumoworks.png > "${pkgdir}"/usr/share/pixmaps/kumoworks.png
     cp "${srcdir}"/kumoworks-${pkgver}/kumoworks.desktop "${pkgdir}"/usr/share/applications/kumoworks.desktop
     cp "${srcdir}"/kumoworks-${pkgver}/build/KumoWorks "${pkgdir}"/opt/kumoworks/kumoworks
}
