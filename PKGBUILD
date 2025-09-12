# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
_pkgname=zalo
pkgname=zalo-macos
replaces=(zalo-unofficial-git)
provides=(zalo-unofficial-git)
conflicts=(zalo-unofficial-git)
pkgver=25.8.3
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
)
source=(
    "zalo.dmg::https://res-download-pc-te-vnso-pt-34.zadn.vn/mac/ZaloSetup-universal-${pkgver}.dmg"
    "zalo.desktop"
    "zalo_py"
    "Zalo.png"
    "LICENSE.html::https://zalo.vn/dieukhoan"
)
noextract=("zalo.dmg")
sha256sums=('432cf162995e33c083ff09869b92a6b28b05c0751244e1807d4fc0c0720c1546'
            '3c54d9828c0e4b763226516ab1d7984c72777e70165983795f5d77c8db93fec9'
            '7d8618d47839107e19978d68dbbb34cb1fa166607ff4762dea6cfc15d0c0a804'
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
package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    rm -rf "${pkgdir}/opt/${_pkgname}/app"
    install -m644 "${srcdir}/build/app.asar" "${pkgdir}/opt/${_pkgname}/app.asar"
    install -m644 "${srcdir}/build/icon.icns" "${pkgdir}/opt/${_pkgname}/icon.icns"
    cp -r "${srcdir}/build/app.asar.unpacked" "${pkgdir}/opt/${_pkgname}/app.asar.unpacked"
    install -m644 "${srcdir}/Zalo.png" "${pkgdir}/opt/${_pkgname}/icon.png"
    install -Dm644 "${srcdir}/zalo.desktop" "${pkgdir}/usr/share/applications/zalo.desktop"
    install -Dm755 "${srcdir}/zalo_py" "${pkgdir}/usr/bin/zalo"
    install -Dm644 "${srcdir}/LICENSE.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.html"
}
