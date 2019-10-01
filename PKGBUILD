# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>
#
# Idea from http://www.andrews-corner.org/qaac.html
# Use at your own risk. Please read the COPYING and
# Apple Software License Agreement for iTunes for Windows
# carefully before use. Do NOT use if you disagree with them.

pkgname=qaac-wine
_pkgname=qaac
pkgver=2.68
pkgrel=2
pkgdesc="QuickTime AAC/ALAC encoder (wine version)"
arch=('x86_64')
url="https://sites.google.com/site/qaacpage/"
license=('custom')
depends=('wine')
makedepends=('p7zip')
source=("https://github.com/nu774/qaac/releases/download/v${pkgver}/qaac_${pkgver}.zip"
        "iTunes64Setup.exe::https://www.apple.com/itunes/download/win64"
        "https://raw.githubusercontent.com/nu774/qaac/master/COPYING"
        "https://www.apple.com/legal/sla/docs/iTunesWindows.pdf"
        "wrapper.sh")
sha256sums=('8067826564d182a239a2347b40d52369c4a378b7df7918bd156138bf904168d0'
            'SKIP'
            'SKIP'
            'SKIP'
            '23a807d100b96cd2b1a618a044583101a521de6d79e29330fed7a9f600501823')

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
    install -Dm755 wrapper.sh "${pkgdir}/usr/lib/qaac/wrapper.sh"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s ../lib/qaac/wrapper.sh "${pkgdir}/usr/bin/qaac"
    ln -s ../lib/qaac/wrapper.sh "${pkgdir}/usr/bin/refalac"

    mkdir -p "${pkgdir}/usr/share/licenses/qaac"
    install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/qaac/COPYING"
    install -Dm644 "iTunesWindows.pdf" "${pkgdir}/usr/share/licenses/qaac/iTunesWindows.pdf"
}
