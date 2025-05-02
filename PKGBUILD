# Maintainer ~ kyle[dot]devir[at]mykolab[dot]com
# Co-Maintainer: William Tang <ttan0037@student.monash.edu>
# Co-Maintainer: Ilya Chelyadin  <ilya77105@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=maya
pkgver=2026.0
_majorver="${pkgver%%.*}"
pkgrel=2
pkgdesc='Autodesk Maya 3D Animation, Modelling, Simulation and Rendering Software'
arch=('x86_64')
url='http://www.autodesk.com/products/maya/overview'
license=('custom')
depends=('audiofile' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi' 'adsklicensing>=15.1.0.12339' 'libxp' 'gtk2' 'libxcrypt-compat'
         'libjpeg6-turbo' 'libffi6' 'nss' 'libxaw' 'libpng15' 'libtool' 'ncurses5-compat-libs' 'libpulse'
         'glu' 'gst-plugins-base-libs' 'libxtst' 'libtiff5')
optdepends=('opencl-driver: OpenCL support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://Maya${_majorver}_64-${pkgver}-13641.x86_64.rpm"
        'application-home-workaround.patch')
b2sums=('baa8804d59b81c2cf546be02e439acb5f965bfe866a05d354a9fb06dcf0869f6ef9a45e3c458f3e73ca12dea897c9af2f47821fe7c4cbb4b9b10c3ab1eb3f9f4'
        'b4f09a64402e54e0067ca381efbc921a7f3cd595aef10135d423fc4a405b105b7cbd4d6907851cf9563cf02be3ec514d48d0a555a976f5daa7d4a66edee594ee')

options=(!strip)
install="${pkgname}.install"

prepare() {
    # Patch launch script
    patch usr/autodesk/maya2026/bin/maya2026 application-home-workaround.patch

    # Fix tmp directory
    ln -sf /tmp usr/tmp

    # Move destop file
    sed -i "s/maya/${pkgname}${_majorver}/g" usr/autodesk/${pkgname}${_majorver}/desktop/Autodesk-Maya.desktop
    mkdir -p usr/share/applications
    mv usr/autodesk/${pkgname}${_majorver}/desktop/Autodesk-Maya.desktop usr/share/applications/${pkgname}.desktop

    # Remove redundant file
    rm usr/autodesk/${pkgname}${_majorver}/desktop/Autodesk-Maya.directory

    # Avoid reading the system libmd, which is a different library of the same name
    touch usr/autodesk/${pkgname}${_majorver}/lib/libmd.so

    # Required by Maya
    ln -s /usr/lib/libxml2.so usr/autodesk/${pkgname}${_majorver}/lib/libxml2.so.2
}

package() {
    mv opt usr var "$pkgdir/"
    install -Dm644 "$pkgdir/usr/autodesk/${pkgname}${_majorver}/resources/copyrights.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
