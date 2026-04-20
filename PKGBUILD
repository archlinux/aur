# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291
# Maintainer: Toria <ninetailedtori@uwu.gal>

_release=$(curl -s https://api.github.com/repos/libsdl-org/sdl2-compat/releases/latest)
_pkgname='sdl2-compat-win32'
pkgname=("${_pkgname}" "lib32-${_pkgname}")
pkgbase=sdl2-compat-win32
pkgver=$(echo "${_release}" | jq -r '.name')
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="An SDL2 compatibility layer that uses SDL3 behind the scenes. DLL version to apply for Wine/Proton applications."
url="https://github.com/libsdl-org/sdl2-compat"
depends=('sdl3' 'glibc')
makedepends=(
    'curl'
    'jq'
)
license=('Zlib')
source=(
    "https://github.com/libsdl-org/sdl2-compat/releases/download/release-${pkgver}/sdl2-compat-${pkgver}-win32-x64.zip"
    "https://github.com/libsdl-org/sdl2-compat/releases/download/release-${pkgver}/sdl2-compat-${pkgver}-win32-x86.zip"
)
noextract=(
    "sdl2-compat-${pkgver}-win32-x64.zip"
    "sdl2-compat-${pkgver}-win32-x86.zip"
)
mapfile -t sha256sums < <(echo "$_release" | jq -r '.assets[] | select(.name | test("win32-(x64|x86)\\.zip")) | .digest' | sed 's/sha256://')
validpgpkeys=('0900104363B4C9D4223DE149D913FE7D4B61D39B') # Sam Lantinga

package_sdl2-compat-win32() {
    cd "${srcdir}"
    unzip "sdl2-compat-${pkgver}-win32-x64.zip" -d "sdl2-compat-${pkgver}-win32-x64/"
    cd "sdl2-compat-${pkgver}-win32-x64/"
    install -Dm644 "SDL2.dll" "${pkgdir}/usr/lib/SDL2.dll"
    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_lib32-sdl2-compat-win32() {
    cd "${srcdir}"
    unzip "sdl2-compat-${pkgver}-win32-x86.zip" -d "sdl2-compat-${pkgver}-win32-x86/"
    cd "sdl2-compat-${pkgver}-win32-x86/"
    install -Dm644 "SDL2.dll" "${pkgdir}/usr/lib32/SDL2.dll"
    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
