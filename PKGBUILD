# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>
#
# Idea from http://www.andrews-corner.org/qaac.html
# Use at your own risk. Please read the COPYING and
# Apple Software License Agreement for iTunes for Windows
# carefully before use. Do NOT use if you disagree with them.

pkgname=qaac-wine
_pkgname=qaac
pkgver=2.81
pkgrel=1
pkgdesc="QuickTime AAC/ALAC encoder (wine version)"
arch=('x86_64')
url="https://github.com/nu774/qaac"
license=('custom')
depends=('wine')
makedepends=('p7zip' 'wine' 'winetricks' 'binutils')
source=("https://github.com/nu774/qaac/releases/download/${pkgver}/qaac_${pkgver}.zip"
        "iTunes64Setup.exe::https://www.apple.com/itunes/download/win64"
        "https://raw.githubusercontent.com/nu774/qaac/master/COPYING"
        "https://www.apple.com/legal/sla/docs/iTunesWindows.pdf"
        "wrapper.sh")
sha256sums=('94de510c8b8dd47f752d53a976bd3ba8691fd6f821075e6fa170ce1f1bc8dc5e'
            'SKIP'
            'SKIP'
            'SKIP'
            '6591c998319680a4474ee93ffc3a50c9be143e53f2e636d8fe66538cde6aa1e3')

extract_filename() {
    if [ "$(head -c 2 "$1" | tr -d '\0')" == "MZ" ]; then
        LC_ALL=C objdump -p "$f" 2>/dev/null | grep 'The Export Tables' -A 10 | awk '$1 == "Name" { print $3 }'
    fi
}

build() {
    cd "${srcdir}"
    #mkdir -p wineprefix
    #export WINEPREFIX=$PWD/wineprefix
    #export WINEARCH=win64
    #wineserver -k || true
    #DISPLAY= winetricks win7
    #WINEDLLOVERRIDES=winemenubuilder.exe=d msiexec /i "${srcdir}/iTunes64.msi" /qn
    #wineserver -k || true
    7z x -y iTunes64.msi
    for f in fil*; do
        filename=$(extract_filename "$f")
        if [ ! -z "$filename" ]; then
            echo "$filename"
            mv "$f" "$filename"
        fi
    done
}

check() {
    export WINEDEBUG=-all
    export WINEPATH="${srcdir}"
    export WINEPREFIX="${srcdir}/wineprefix"

    wine "${srcdir}/qaac_${pkgver}/x64/qaac64.exe" --check && \
    wine "${srcdir}/qaac_${pkgver}/x64/refalac64.exe" --check
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
    local LIBICUDT_NAME=$(find . -name 'icudt*.dll' -printf '%f')
    for f in ASL.dll CoreAudioToolbox.dll CoreFoundation.dll $LIBICUDT_NAME libdispatch.dll libicuin.dll libicuuc.dll objc.dll; do
        install -Dm644 "${f}" "${pkgdir}/usr/lib/qaac/${f}"
    done
    install -Dm755 wrapper.sh "${pkgdir}/usr/lib/qaac/wrapper.sh"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s ../lib/qaac/wrapper.sh "${pkgdir}/usr/bin/qaac"
    ln -s ../lib/qaac/wrapper.sh "${pkgdir}/usr/bin/refalac"

    mkdir -p "${pkgdir}/usr/share/licenses/qaac"
    install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/qaac/COPYING"
    install -Dm644 "iTunesWindows.pdf" "${pkgdir}/usr/share/licenses/qaac/iTunesWindows.pdf"
}
