# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>
#
# Idea from http://www.andrews-corner.org/qaac.html
# Use at your own risk. Please read the COPYING and
# Apple Software License Agreement for iTunes for Windows
# carefully before use. Do NOT use if you disagree with them.

pkgname=qaac-wine
_pkgname=qaac
pkgver=2.68
pkgrel=1
pkgdesc="QuickTime AAC/ALAC encoder (wine version)"
arch=('x86_64')
url="https://sites.google.com/site/qaacpage/"
license=('custom')
depends=('wine')
makedepends=('p7zip')
source=("https://github.com/nu774/qaac/releases/download/v${pkgver}/qaac_${pkgver}.zip"
        "iTunes64Setup.exe::https://www.apple.com/itunes/download/win64"
        "https://raw.githubusercontent.com/nu774/qaac/master/COPYING"
        "https://www.apple.com/legal/sla/docs/iTunesWindows.pdf")
sha256sums=('8067826564d182a239a2347b40d52369c4a378b7df7918bd156138bf904168d0'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
    cd "${srcdir}"
    mkdir -p AppleApplicationSupport64
    cd AppleApplicationSupport64
    7z x -y ../AppleApplicationSupport64.msi
}

package() {
    mkdir -p "${pkgdir}/usr/lib/qaac"

    cd "${srcdir}"
    for f in qaac64.exe refalac64.exe; do
        install -Dm755 "qaac_${pkgver}/x64/${f}" "${pkgdir}/usr/lib/qaac/${f}"
    done
    for f in libsoxconvolver64.dll libsoxr64.dll; do
        install -Dm644 "qaac_${pkgver}/x64/${f}" "${pkgdir}/usr/lib/qaac/${f}"
    done
    local LIBICUDT_NAME="$(ls AppleApplicationSupport64/*icudt*.dll | sed 's/.*icudt/icudt/')"
    for f in ASL.dll CoreAudioToolbox.dll CoreFoundation.dll $LIBICUDT_NAME libdispatch.dll libicuin.dll libicuuc.dll objc.dll; do
        install -Dm644 "AppleApplicationSupport64/x64_AppleApplicationSupport_${f}" "${pkgdir}/usr/lib/qaac/${f}"
    done

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "../lib/qaac/qaac64.exe" "${pkgdir}/usr/bin/qaac"
    ln -s "../lib/qaac/refalac64.exe" "${pkgdir}/usr/bin/refalac"

    mkdir -p "${pkgdir}/usr/share/licenses/qaac"
    install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/qaac/COPYING"
    install -Dm644 "iTunesWindows.pdf" "${pkgdir}/usr/share/licenses/qaac/iTunesWindows.pdf"
}
