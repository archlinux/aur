# Maintainer ~ kyle[dot]devir[at]mykolab[dot]com
# Co-Maintainer: William Tang <ttan0037@student.monash.edu>
# Co-Maintainer: Ilya Chelyadin  <ilya77105@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=maya
pkgver=2024.2
_majorver="${pkgver%%.*}"
pkgrel=1
pkgdesc='Autodesk Maya 3D Animation, Modelling, Simulation and Rendering Software'
arch=('x86_64')
url='http://www.autodesk.com/products/maya/overview'
license=('custom')
depends=('audiofile' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi' 'adsklicensing>=13.0.0.8122' 'libxp' 'gtk2' 'libxcrypt-compat'
         'libjpeg6-turbo' 'libffi6' 'nss' 'libxaw' 'libpng15' 'libtool' 'ncurses5-compat-libs' 'libpulse'
         'glu' 'gst-plugins-base-libs' 'libxtst' 'libtiff5')
optdepends=('opencl-driver: OpenCL support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://Maya2024_64-$pkgver-1191.x86_64.rpm"
        'application-home-workaround.patch')
b2sums=('d98630b22f8a4171c577b6f1cd8aac13a16da60b26587d21b455bfc60042319e3eddabf78155a3dc711d2a550e85d378293a7be71d4889af998cd06b9d624504'
        'b4f09a64402e54e0067ca381efbc921a7f3cd595aef10135d423fc4a405b105b7cbd4d6907851cf9563cf02be3ec514d48d0a555a976f5daa7d4a66edee594ee')

options=(!strip)
install="${pkgname}.install"

prepare() {
    # Patch launch script
    patch usr/autodesk/maya2024/bin/maya2024 application-home-workaround.patch

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
}

package() {
    mv opt usr var "$pkgdir/"
    install -Dm644 "$pkgdir/usr/autodesk/${pkgname}${_majorver}/resources/copyrights.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
