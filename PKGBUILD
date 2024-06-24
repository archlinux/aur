# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: sukanka <su975853527 at gmail dot com>
pkgname=baidu-translate-client-bin
_zhsname="百度翻译"
pkgver=1.7.0
_electronversion=11
pkgrel=1
pkgdesc="Baidu translate.${_zhsname}"
arch=(
    'aarch64'
    'x86_64'
)
url="https://fanyi.baidu.com/"
license=('LicenseRef-custom')
provides=(
    "${pkgname%-bin}=${pkgver}"
    "${pkgname%-client-bin}=${pkgver}"
)
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'libxkbcommon-x11'
)
makedepends=(
    'p7zip'
    'icoutils'
)
source=(
    "${pkgname%-bin}-${pkgver}.exe::https://fanyiapp.cdn.bcebos.com/fanyi-client/pkg/win/${pkgver}/%E7%99%BE%E5%BA%A6%E7%BF%BB%E8%AF%91_Setup_${pkgver}.exe"
    "${pkgname%-bin}.desktop"
    "LICENSE-${pkgver}.html::https://fanyi.baidu.com/static/webpage/agreement.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('77b54aa77b98df4d2c4d9746520ba3b2fef23e13aae918ee4fbdbdc5bd6ea388'
            '2229396e7ba87154026501bcd4bff88ee565b5b72c933e48f8707b6065f1f770'
            'ffa785eb66c6abf12217bc9dbf447c56bb15e2a1ff038da7c8c1b8e5f57ce2fb'
            '05762c556c85a4423b28600ccbbe7b7dcdd3d1be526ef4a588a510671fa6c62a')
build(){
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@|--disable-gpu-sandbox|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    7z e "${srcdir}/${pkgname%-bin}-${pkgver}.exe" -aoa
    wrestool -x --output="${srcdir}" -t14 "${srcdir}/${pkgname%-bin}-${pkgver}.exe"
    icotool -i 5 -x "${srcdir}/"*.ico -o "${srcdir}/${pkgname%-bin}.png"
    case "${CARCH}" in
      aarch64)
        bsdtar -xf "${srcdir}/app-32.7z"
        ;;
      x86_64)
        bsdtar -xf "${srcdir}/app-64.7z"
        ;;
    esac
    rm -rf "${srcdir}/resources/app.asar.unpacked/node_modules/@baidu/fanyi-iohook/builds/"electron-*-{win32-*,darwin-*}
}
package(){
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}