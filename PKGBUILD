# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
_pkgname=zalo
pkgname=zalo-macos
provides=(zalo)
pkgver=25.11.1
pkgrel=1
epoch=1
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
    "zalo.dmg::https://res-download-pc-te-vnso-ne-2.zadn.vn/mac/ZaloSetup-universal-${pkgver}.dmg"
    "zalo.desktop"
    "zalo_py"
    "Zalo.png"
    "LICENSE.html::https://zalo.vn/dieukhoan"
    "zalo-linux-compatibility.patch"
)
noextract=("zalo.dmg")
sha256sums=('55f1f0955450e14de5806f2f124be5710f4d3a117854d6723289da07cf367377'
            '3c54d9828c0e4b763226516ab1d7984c72777e70165983795f5d77c8db93fec9'
            '7d8618d47839107e19978d68dbbb34cb1fa166607ff4762dea6cfc15d0c0a804'
            '54556414e921d2e72db65cdace024251c05e31ce2e1aa3db82aa330436815445'
            'SKIP'
            '9dee99c5c64944ede2e7fb38a40319bc7206bd840729a4c8a80e2cd6fd09b39a'
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

    # Unpack asar, apply patch
    cd "${srcdir}/build"
    mkdir app
    asar extract app.asar app/

    cd app
    patch -p1 < "${srcdir}/zalo-linux-compatibility.patch"

    # Pack back to asar
    cd "${srcdir}/build"
    asar pack app app.asar
    rm -rf app/
}
package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    install -m644 "${srcdir}/build/app.asar" "${pkgdir}/opt/${_pkgname}/app.asar"
    install -m644 "${srcdir}/build/icon.icns" "${pkgdir}/opt/${_pkgname}/icon.icns"
    cp -r "${srcdir}/build/app.asar.unpacked" "${pkgdir}/opt/${_pkgname}/app.asar.unpacked"
    install -m644 "${srcdir}/Zalo.png" "${pkgdir}/opt/${_pkgname}/icon.png"
    install -Dm644 "${srcdir}/zalo.desktop" "${pkgdir}/usr/share/applications/zalo.desktop"
    install -Dm755 "${srcdir}/zalo_py" "${pkgdir}/usr/bin/zalo"
    install -Dm644 "${srcdir}/LICENSE.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.html"
}
