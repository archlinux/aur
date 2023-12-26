# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: nixi
# Contributor: Orphaned
# Contributor: Emil Miler <em@0x45.cz>
# Contributor: DaZ <daz.root+arch@gmail.com>
pkgname=slic3r-bin
_pkgname=Slic3r
pkgver=1.3.0
pkgrel=11
pkgdesc="Open Source toolpath generator for 3D printers"
arch=('x86_64')
url="https://slic3r.org/"
_ghurl="https://github.com/slic3r/Slic3r"
license=("AGPL3")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'freeglut'
    'glu'
    'libpng12'
    'perl'
    'libxcrypt-compat'
    'gtk2'
    'cairo'
    'libglvnd'
    'xz'
    'libxi'
    'libjpeg-turbo'
    'pango'
    'gdk-pixbuf2'
    'expat'
    'libx11'
    'libsm'
    'openssl-1.0'
    'libxxf86vm'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.bz2::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.tar.bz2"
    "${pkgname%-bin}.sh"
)
sha256sums=('23761e32aca057de12e940fca097bcfef5a1efea9ff4998f8aa9fd58241db6dd'
            'b0d43eb126182883574f969990236275106af80775d21cdfdfb84ff61574b3b1')
build(){
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}.pl|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -n -f --categories "Utility;Development" --name "${_pkgname}" --exec "${pkgname%-bin}"
    unlink "${srcdir}/${_pkgname}/local-lib/lib/perl5/${CARCH}-linux-thread-multi/Alien/wxWidgets/gtk_3_0_2_uni/bin/wx-config"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}/var/${_pkgname}_192px.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}