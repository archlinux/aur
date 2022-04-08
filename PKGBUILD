# Maintainer ~ kyle[dot]devir[at]mykolab[dot]com
# Co-Maintainer: William Tang <ttan0037@student.monash.edu>
# Co-Maintainer: Ilya Chelyadin  <ilya77105@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=maya
pkgver=2023.0
pkgrel=1
pkgdesc='Autodesk Maya 3D Animation, Modelling, Simulation and Rendering Software'
arch=('x86_64')
url='http://www.autodesk.com/products/maya/overview'
license=('custom')
depends=('glu' 'gst-plugins-base-libs' 'gtk2' 'gts' 'lib32-glibc' 'libjpeg6-turbo' 'libpng15' 'libpulse'
         'libtool' 'libxaw' 'libxkbcommon-x11' 'libxtst' 'ncurses5-compat-libs' 'xcb-util-image' 'xcb-util-keysyms'
         'xcb-util-renderutil' 'xcb-util-wm' 'audiofile' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi' 'adsklicensing=12.0.0.6537'
         'libcrypt.so=1-64' 'libffi6')
optdepends=('adlmflexnetclient>=23.0.0: Autodesk Network Licensing Client (Deprecated on August 7, 2021)'
            'adlmflexnetserver-ipv6>=23.0.0: Autodesk Network Licensing Server (Deprcated on August 7, 2021)'
            'maya-arnold: Maya Arnold Renderer Plugin'
            'maya-bifrost: Maya Bifrost Effects Plugin'
            'maya-rokoko-motion-library: Maya Rokoko Motion Library Animation Plugin'
            'maya-substance: Maya Substance Material Plugin'
            'maya-usd: Maya Universal Scene Description Plugin')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=('manual://Maya2023_64-2023.0-1319.x86_64.rpm')
sha256sums=('fd4930b5554ed9cf685670c13af9c5b853e99ba001e39cd54d516af3ab62506e')

options=(!strip)

prepare() {
    majorver="${pkgver%%.*}"

    # Fix symbol links
    mkdir -p usr/autodesk/${pkgname}${majorver}/lib
    ln -sf /usr/lib/libssl.so.1.1 usr/autodesk/${pkgname}${majorver}/lib/libssl.so.10
    ln -sf /usr/lib/libcrypto.so.1.1 usr/autodesk/${pkgname}${majorver}/lib/libcrypto.so.10

    # Fix tmp directory
    ln -sf /tmp usr/tmp

    # Move destop file
    sed -i "s/maya/${pkgname}${majorver}/g" usr/autodesk/${pkgname}${majorver}/desktop/Autodesk-Maya.desktop
    mkdir -p usr/share/applications
    mv usr/autodesk/${pkgname}${majorver}/desktop/Autodesk-Maya.desktop usr/share/applications/${pkgname}.desktop

    # Remove redundant file
    rm usr/autodesk/${pkgname}${majorver}/desktop/Autodesk-Maya.directory

    # Avoid reading the system libmd which is a different library of the same name
    touch usr/autodesk/${pkgname}${majorver}/lib/libmd.so
}

package() {
    mv opt usr var $pkgdir/
}
