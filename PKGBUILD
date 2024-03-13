# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bilibili
pkgver=1.13.0_2
_electronversion=21
pkgrel=4
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
    "electron${_electronversion}-bin"
    'hicolor-icon-theme'
)
makedepends=(
    'wget'
    'perl-image-exiftool'
    'git'
    'asar'
    'unzip'
    'p7zip'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver//_/-}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    cd "${srcdir}/${pkgname}.git"
    sh "tools/setup-${pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/app/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/app/extensions" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/res/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}.git/res/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644  "${srcdir}/${pkgname}.git/license" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}