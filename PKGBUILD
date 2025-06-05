# Maintainer: myt1 <myt at qq dot com>
pkgname=readcat-electron
_pkgname=ReadCat-linux
_pkgname1=read-cat-insiders
pkgver=1.0.0
_pkgver=v1.0.0-dev.241109
_electronversion=36
pkgrel=2
pkgdesc="一款免费,开源,简洁,纯净,无广告的小说阅读器"
arch=(
    'aarch64'
    'x86_64'
)
url="https://read-cat.top/"
license=('GPL-3.0')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils'
        'at-spi2-core' 'util-linux-libs' 'libsecret'
)
conflicts=(
    "${pkgname%-bin}"
    "${pkgname-bin}"
)
depends=(
    "electron${_electronversion}"
)
_pkgver1=f63eabac
#source_aarch64=("https://github.com/read-cat/read-cat/releases/download/${_pkgver}/${_pkgname}-arm64-${pkgver}-dev.${_pkgver1}")
source_x86_64=("https://github.com/read-cat/read-cat/releases/download/${_pkgver}/${_pkgname}-amd64-${pkgver}-dev.${_pkgver1}.deb")
source=(
    "LICENSE.txt"
    "${_pkgname1}.sh"
)
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_x86_64=('744e790668daff6e010fa4ada0d15612c1c6a7c31354736d1db8390c858aa6ae')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-electron}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|readcat|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${_pkgname1}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    sed '3s/.*/Exec=read-cat-insiders %U/g' -i "${srcdir}/usr/share/applications/${_pkgname1}.desktop"
    sed -i '3i\Name=小说阅读器' "${srcdir}/usr/share/applications/${_pkgname1}.desktop"
    install -Dm755 "${srcdir}/${_pkgname1}.sh" "${pkgdir}/usr/bin/${_pkgname1}"
    install -Dm644 "${srcdir}/opt/${_pkgname%-linux}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-electron}"
    cp -r "${srcdir}/opt/${_pkgname%-linux}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-electron}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname1}.desktop" "${pkgdir}/usr/share/applications/${_pkgname1}.desktop"
    mv "${srcdir}/usr/share/icons" "${pkgdir}/usr/share/icons"
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname%-electron}/LICENSE"
}
