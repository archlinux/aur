# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: nixi
# Contributor: Orphaned
# Contributor: Emil Miler <em@0x45.cz>
# Contributor: DaZ <daz.root+arch@gmail.com>
pkgname=slic3r-bin
_pkgname=Slic3r
pkgver=1.3.0
pkgrel=15
pkgdesc="Open Source toolpath generator for 3D printers.(Prebuilt version)"
arch=('x86_64')
url="https://slic3r.org/"
_ghurl="https://github.com/slic3r/Slic3r"
license=("AGPL-3.0-only")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'freeglut'
    'glu'
    'libpng12'
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
    'libtiff5'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.bz2::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.tar.bz2"
    "${pkgname%-bin}.sh"
)
sha256sums=('23761e32aca057de12e940fca097bcfef5a1efea9ff4998f8aa9fd58241db6dd'
            '4e274db561e265bd0757393175be0f5d0633bbb84fd7aa48f14c608a07c789e8')
prepare(){
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}.pl/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -n -f \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility;Development" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin}"
    unlink "${srcdir}/${_pkgname}/local-lib/lib/perl5/${CARCH}-linux-thread-multi/Alien/wxWidgets/gtk_3_0_2_uni/bin/wx-config"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}/var/${_pkgname}_192px.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}