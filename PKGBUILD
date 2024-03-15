# Contributor: Ayatale  <ayatale@qq.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pplink-bin
_chsname="PP直连"
pkgver=13.3.1
_electronversion=19
pkgrel=1
pkgdesc="帮助电脑、手机、平板等设备建立点到点的安全直连"
arch=('x86_64')
url="https://www.ppzhilian.com"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'hicolor-icon-theme'
    'python>=3'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/download/linux/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('3effd4737e5fbf4921b86a0ea71b04f833be1d5971e465bce6a33f060f0efc97'
            '6acc470ced558f0572421e8d554fe5f99abc45be5f390f52d170a1e5d51440bb'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_chsname}/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_chsname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_chsname}/resources/"{app.asar.unpacked,aria2} "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}