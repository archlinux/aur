# Maintainer ~ kyle[dot]devir[at]mykolab[dot]com
# Co-Maintainer: William Tang <ttan0037@student.monash.edu>
# Co-Maintainer: Ilya Chelyadin  <ilya77105@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=maya
pkgver=2027.1
_majorver="${pkgver%%.*}"
pkgrel=1
pkgdesc='Autodesk Maya 3D Animation, Modelling, Simulation and Rendering Software'
arch=('x86_64')
url='http://www.autodesk.com/products/maya/overview'
license=('custom')
depends=(
         'adp-desktop-sdk'
         'adsklicensing>=16.0.3.14414'
         'alsa-lib'
         'at-spi2-core'
         'attr'
         'audiofile'  # Required for audio
         'bash'
         'cairo'
         'curl'
         'dbus'
         'expat'
         'fontconfig'
         'gcc-libs'
         'gdk-pixbuf2'
         'glibc'
         'glu'
         'gtk2'
         'krb5'
         'libcap'
         'libcups'
         'libdrm'
         'libglvnd'
         'libice'
         'libjpeg6-turbo'
         'libmng'
         'libpng'
         'libpulse'
         'librsvg'
         'libsm'
         'libtiff5'
         'libtool'
         'libva'
         'libvdpau'
         'libx11'
         'libxaw'
         'libxcb'
         'libxcomposite'
         'libxdamage'
         'libxext'
         'libxfixes'
         'libxft'
         'libxi'
         'libxinerama'
         'libxkbcommon-x11'
         'libxkbcommon'
         'libxkbfile'
         'libxmu'
         'libxp'
         'libxpm'
         'libxrandr'
         'libxrender'
         'libxt'
         'libxtst'
         'libxv'
         'libxxf86vm'
         'nspr'
         'nss'
         'openssl'
         'pango'
         'util-linux-libs'
         'wayland'
         'xcb-util-cursor'
         'xcb-util-image'
         'xcb-util-keysyms'
         'xcb-util-renderutil'
         'xcb-util-wm'
         'xorg-fonts-100dpi'  # Required for font errors
         'xorg-fonts-75dpi'  # Required for font errors
         'zstd'
         )
optdepends=('opencl-driver: OpenCL support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://Maya${_majorver}_64-${pkgver}-4277.x86_64.rpm"
        'application-home-workaround.patch')
b2sums=('9a231e9d347d2f0f9731c392eacf5d43929b889c2a1b93771d02fe7c37be03ac9d00cad36c9b9d5dc4ca85f5c36abe4368ab67c219b18fb8cf4bcdfa63b7fef7'
        'b4f09a64402e54e0067ca381efbc921a7f3cd595aef10135d423fc4a405b105b7cbd4d6907851cf9563cf02be3ec514d48d0a555a976f5daa7d4a66edee594ee')

options=(!strip)
install="${pkgname}.install"

prepare() {
    # Patch launch script
    patch usr/autodesk/${pkgname}${_majorver}/bin/${pkgname}${_majorver} application-home-workaround.patch

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
