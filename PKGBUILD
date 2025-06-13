# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
_pkgname=zalo
pkgname=zalo-macos
replaces=(zalo-unofficial-git)
provides=(zalo-unofficial-git)
conflicts=(zalo-unofficial-git)
pkgver=25.6.1
pkgrel=1
pkgdesc="Unofficial Zalo client for Linux, ported from MacOS version"
arch=('x86_64')
url="https://zalo.me"
license=('custom')
depends=(
    'python'
    'python-pillow'
    'python-pystray'
    'electron22-bin'
)
makedepends=(
    '7zip'
    'asar'
)
source=(
    "zalo.dmg::https://res-download-pc-te-vnso-pt-34.zadn.vn/mac/ZaloSetup-universal-${pkgver}.dmg"
    "zalo.desktop"
    "zalo_py"
    "Zalo.png"
    "LICENSE.html::https://zalo.vn/dieukhoan"
)
noextract=("zalo.dmg")
sha256sums=('f8925b6fd00a86ec347a8b87e4dd32f42d5ef18dd3061d6c6a7286faff452cba'
            '3c54d9828c0e4b763226516ab1d7984c72777e70165983795f5d77c8db93fec9'
            '0aefeac62e9dec9e064d87aa000064b4fb6a01c22079fb9b39e2f68ac663f967'
            '54556414e921d2e72db65cdace024251c05e31ce2e1aa3db82aa330436815445'
            'SKIP'
)
options=('!strip' '!purge')
prepare() {
    local archive_path="Zalo ${pkgver}-universal/Zalo.app/Contents/Resources"
    mkdir -p "${srcdir}/build"
    for file in app-update.yml app.asar icon.icns app.asar.unpacked; do
        7z x -y "${srcdir}/zalo.dmg" "$archive_path/$file"
        mv "$archive_path/$file" "${srcdir}/build/"
    done
    rm -rf "Zalo ${pkgver}-universal"
}
build() {
    asar e "${srcdir}/build/app.asar" "${srcdir}/build/app"
    rm "${srcdir}/build/app.asar"
}
package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    cp -r "${srcdir}/build/app" "${pkgdir}/opt/${_pkgname}/"
    cp -r "${srcdir}/build/icon.icns" "${pkgdir}/opt/${_pkgname}/"
    cp -r "${srcdir}/build/app-update.yml" "${pkgdir}/opt/${_pkgname}/"
    install -Dm644 "${srcdir}/Zalo.png" "${pkgdir}/opt/${_pkgname}/icon.png"
    install -Dm644 "${srcdir}/zalo.desktop" "${pkgdir}/usr/share/applications/zalo.desktop"
    install -Dm755 "${srcdir}/zalo_py" "${pkgdir}/usr/bin/zalo"
    install -Dm644 "${srcdir}/LICENSE.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.html"
}
