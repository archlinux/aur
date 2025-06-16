# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=anytxt-bin
_pkgname=Anytxt
_debname="com.cbewin.${pkgname%-bin}"
pkgver=1.3.2463
pkgrel=1
pkgdesc="Desktop search tool for file content.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://anytxt.net.cn/"
_sfurl="https://sourceforge.net/projects/anytxt"
license=('LicenseRef-freeware')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'openssl-1.1'
    'libxcrypt-compat'
    'pcre'
    'qt5-declarative'
    'qt5-base'
    'libssh'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::https://versaweb.dl.sourceforge.net/project/anytxt/${_pkgname}_${pkgver}_Linux_arm_64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::https://versaweb.dl.sourceforge.net/project/anytxt/${_pkgname}_${pkgver}_Linux_X86_64.rpm")
sha256sums=('db1db4c15024a45337e7e7190046e6414184603321be058797422a54ed5fc85d')
sha256sums_aarch64=('d0c431d3e82e9df968c03945db61981c6a797d29db3f4cca0e7cf161f4b31469')
sha256sums_x86_64=('1a608c42db8df72df1bf271f3dbadf14b1d07ac062aacc8c121c5b711cd7250f')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/ATGUI/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/apps\/${_debname}\/files\/ATGUI/${pkgname%-bin}/g
        s/\/usr\/share\/icons\/hicolor\/256x256\/apps\/${_debname}.png/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_debname}.desktop"
    rm -rf "${srcdir}/opt/apps/${_debname}/usr"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/apps/${_debname}/files/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_debname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    ln -sf "/usr/lib/${pkgname%-bin}/ATGUI" "${pkgdir}/usr/bin/atgui"
}