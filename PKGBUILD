#Maintainer: Bazza <bazza@riseup.net>

pkgname=('storyboarder')
pkgver=3.0.0
pkgrel=1
pkgdesc="The best way to visualize your story. It makes it easy to visualize a story as fast you can draw stick figures."
provides=("storyboarder")
depends=('zlib' 'hicolor-icon-theme' )
makedepends=('nvm' 'nodejs')
url='https://wonderunit.com/storyboarder/'
arch=('x86_64')
source=("https://github.com/wonderunit/storyboarder/archive/refs/tags/v${pkgver}.zip")
md5sums=('e4d21697c9f90adf7344a87917aa3a6f')
license=()
options=(!strip)

prepare(){
     curl https://upload.wikimedia.org/wikipedia/commons/8/8c/Transparent.png > "${srcdir}"/storyboarder-${pkgver}/src/img/watermark.png
     cd "${srcdir}/storyboarder-${pkgver}"
     source /usr/share/nvm/init-nvm.sh
     nvm install 14.16.0
     npm install
     npm run build
     npm run dist:linux
     echo "[Desktop Entry]
Name=Storyboader
Exec=/opt/storyboarder/storyboarder
Icon=storyboarder
Type=Application
Terminal=false
StartupNotify=true
Categories=Graphics;" > "${srcdir}"/storyboarder-${pkgver}/storyboarder.desktop
}

package(){
     # opt dir
     mkdir -p "${pkgdir}"/usr/bin/
     echo -e '#!/bin/sh\n/opt/storyboarder/storyboarder' > "${pkgdir}"/usr/bin/storyboarder
     chmod 755 "${pkgdir}"/usr/bin/storyboarder
     mkdir -p "${pkgdir}"/opt/storyboarder/
     # linux unpacked
     cp -ar  "${srcdir}"/storyboarder-${pkgver}/dist/linux-unpacked/* "${pkgdir}"/opt/storyboarder/
     # Desktop
     install -Dm644 "${srcdir}"/storyboarder-${pkgver}/storyboarder.desktop "${pkgdir}"/usr/share/applications/storyboarder.desktop
     # Icon
     install -Dm644 "${srcdir}"/storyboarder-${pkgver}/src/img/logoicon.png "${pkgdir}"/usr/share/pixmaps/storyboarder.png
}

