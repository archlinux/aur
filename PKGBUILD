# Maintainer ~ kyle[dot]devir[at]mykolab[dot]com
# Co-Maintainer: William Tang <ttan0037@student.monash.edu>
# Co-Maintainer: Ilya Chelyadin  <ilya77105@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=maya
pkgver=2023.3
_majorver="${pkgver%%.*}"
pkgrel=1
pkgdesc='Autodesk Maya 3D Animation, Modelling, Simulation and Rendering Software'
arch=('x86_64')
url='http://www.autodesk.com/products/maya/overview'
license=('custom')
depends=('audiofile' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi' 'adsklicensing=12.1.0.7121' 'libxp' 'gtk2' 'libxcrypt-compat'
         'libjpeg6-turbo' 'libffi6' 'nss' 'libxaw' 'libpng15' 'libtool' 'ncurses5-compat-libs' 'libpulse'
         'glu' 'gst-plugins-base-libs' 'libxtst')
optdepends=('maya-arnold: Maya Arnold Renderer Plugin'
            'maya-bifrost: Maya Bifrost Effects Plugin'
            'maya-substance: Maya Substance Material Plugin'
            'maya-usd: Maya Universal Scene Description Plugin')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://Maya2023_64-$pkgver-2072.x86_64.rpm"
        'application-home-workaround.patch')
sha256sums=('5d5ea3268bdfe2003c96591c099b760ef09d7e917f918fd992563726a7f905c1'
            '0bac864b64db2cdc7be5de574e404bc36f80959bc867988f6a67cdbaf32abb1a')

options=(!strip)
install="${pkgname}.install"

prepare() {
    # Patch launch script
    patch usr/autodesk/maya2023/bin/maya2023 application-home-workaround.patch

    # Fix tmp directory
    ln -sf /tmp usr/tmp

    # Move destop file
    sed -i "s/maya/${pkgname}${_majorver}/g" usr/autodesk/${pkgname}${_majorver}/desktop/Autodesk-Maya.desktop
    mkdir -p usr/share/applications
    mv usr/autodesk/${pkgname}${_majorver}/desktop/Autodesk-Maya.desktop usr/share/applications/${pkgname}.desktop

    # Remove redundant file
    rm usr/autodesk/${pkgname}${_majorver}/desktop/Autodesk-Maya.directory

    # Avoid reading the system libmd which is a different library of the same name
    touch usr/autodesk/${pkgname}${_majorver}/lib/libmd.so
}

package() {
    mv opt usr var $pkgdir/
}
