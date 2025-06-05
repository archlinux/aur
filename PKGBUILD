# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
_pkgname=zalo
pkgname=zalo-macos
replaces=(zalo-unofficial-git)
provides=(zalo-unofficial-git)
conflicts=(zalo-unofficial-git)
pkgver=25.5.3
pkgrel=3
pkgdesc="Unofficial Zalo client for Linux, port from MacOS version"
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
sha256sums=('6fad5baecf01084f9f1000f2db14025199f2e4d510722c72c439eb972ea40f0c'
            'SKIP'
            'SKIP'
            'SKIP'
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
