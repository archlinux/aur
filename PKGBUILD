# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bilibili
pkgver=1.13.2_1
_electronversion=21
pkgrel=2
pkgdesc="基于哔哩哔哩官方客户端移植的Linux版本 支持漫游"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/msojocs/bilibili-linux"
license=('MIT')
provides=("${pkgname}")
conflicts=(
    "${pkgname}"
)
depends=(
    "electron${_electronversion}"
    "ffmpeg"
)
makedepends=(
    'wget'
    'perl-image-exiftool'
    'asar'
    'unzip'
    'p7zip'
    'curl'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('9764c9a3bba3de88ca594e48ea44277b2214c0dee6c40d0e4241d91620d308b7'
            '61d56055897e9d71d68e185ac2de7c4cb2fbca16eb3fb0091703612c113441f3')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    cd "${srcdir}/${pkgname}-linux-${pkgver//_/-}"
    sh "tools/setup-${pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-linux-${pkgver//_/-}/app/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-linux-${pkgver//_/-}/app/extensions" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-linux-${pkgver//_/-}/res/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-linux-${pkgver//_/-}/res/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644  "${srcdir}/${pkgname}-linux-${pkgver//_/-}/license" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}