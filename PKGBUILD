# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=downkyi-bin
_pkgname=DownKyi
_debname="cn.bzdrs.${pkgname%-bin}"
pkgver=1.0.22
pkgrel=1
pkgdesc="Bilibili download Ji,bilibili website video download tool,supports batch download, supports 8K,HDR,Dolby Vision,provides toolbox (audio & video extraction, watermarking, etc.)(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/yaobiao131/downkyicore"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    'staticlibs'
)
depends=(
    'aria2'
    'ffmpeg'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_self-contained_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_self-contained_amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('1cdf1c48c32ffec0f68a347a212d4ee91bb3dccb890cebc40a2b09e391efa0e3')
sha256sums_aarch64=('ac4f6e83072dd04051409ec95aa7550f429465f9cefad14a42d4438d41d1d5ad')
sha256sums_x86_64=('5d906cc8a3fb8a7748b6ded3b6a58a8ea7b488288dbb535cf71389908d580502')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Icon=${_debname}/Icon=${pkgname%-bin}/g
        s/\/opt\/${_debname}\/${_pkgname}/${pkgname%-bin}/g
        s/env LANG=zn_CN.UTF-8 //g
    " "${srcdir}/usr/share/applications/${_debname}.desktop"
    ln -sf "/usr/bin/aria2c" "${srcdir}/opt/${_debname}/aria2/aria2c"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/opt/${_debname}/ffmpeg/ffmpeg"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_debname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_debname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
