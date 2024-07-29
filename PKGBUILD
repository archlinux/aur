# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Maintainer: little_sheepycn <little_sheepycn@redstonebuild.onmicrosoft.com>
# Contributor: msojocs <jiyecafe@gmail.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: YidaozhanYa <yidaozhan_ya@outlook.com>
# Contributor: whitels <2959471117@qq.com>
# Contributor: wxt1221 <3264117476@qq.com>
# 感谢 Peternal 对 SVG图标 的授权
pkgname=bilibili-bin
_pkgname="io.github.msojocs.${pkgname%-bin}"
pkgver=1.14.0_2
_electronversion=21
epoch=5
pkgrel=1
pkgdesc='哔哩哔哩官方客户端linux移植版。Bilibili official desktop client.Binary version.Use system-wide electron.'
arch=(
    'aarch64'
    'x86_64'
)
url='https://github.com/msojocs/bilibili-linux'
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'ffmpeg'
    "electron${_electronversion}"
    'libappindicator-gtk3'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver//_/-}/${_pkgname}_${pkgver//_/-}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver//_/-}/${_pkgname}_${pkgver//_/-}_amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/msojocs/bilibili-linux/v${pkgver//_/-}/license"
    "${pkgname%-bin}.sh"
)
sha256sums=('21668b8229199de1a523b82805c80d6e110a67fef5766aa7cc3c7df4416d1468'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('51a188e012e17e8625b99a4046c8fe2348849855d860d7e5e095a105638e8a9d')
sha256sums_x86_64=('41031d129284eebfdf3cc697ff212869aeca8e296188f3182d1bc63e4bf58ddb')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/apps/${_pkgname}/files/bin//bin/${pkgname%-bin}|${pkgname%-bin}|g;s|${_pkgname}|${pkgname%-bin}|g" \
        -i "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/bin/app/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/apps/${_pkgname}/files/bin/app/extensions" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"   
}