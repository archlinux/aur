# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor : HeartsDo <heartsdo[at]vivaldi[dot]net>
# Contributor : Colin Berry <colinb969 at gmail dot com>
pkgname=flashpoint-bin
_pkgname=Flashpoint
pkgver=14.0.1
_electronversion=19
pkgrel=2
pkgdesc="Launcher for BlueMaxima's Flashpoint - Infinity Edition.(Prebuilt version)"
arch=('x86_64')
url="https://flashpointarchive.org"
_ghurl="https://github.com/FlashpointProject"
license=('LicenseRef-freeware')
depends=(
    'nss>=3.0'
    'openssl-1.1'
    'php'
    'gtk3'
    'wine'
    'xorg-server'
    'sdl2'
    'java-runtime'
    "electron${_electronversion}"
)
makedepends=(
    '7zip'
)
optdepends=(
    'flashplayer-standalone: native Flash support'
    'gtk2'
    'libxt'
)
options=(
    '!strip'
    '!emptydirs'
)
noextract=("${pkgname%-bin}-${pkgver}.7z")
source=(
    "${pkgname%-bin}-${pkgver}.7z::https://download.unstable.life/upload/fp${pkgver}_lin_main_20250222.7z"
    "${pkgname%-bin}.desktop"
)
sha256sums=('bab843b8422da500056698819aa6752804eedb8ba130380403e4f49532d8537e'
            '8784a3536919f917c9848fc577a9ea7649fdd709cd543f4b127a7057fc3f2e41')
prepare(){
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    7zr x "${srcdir}/${pkgname%-bin}-${pkgver}.7z" -o"${srcdir}/opt/${pkgname%-bin}"
    _file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome_crashpad_handler chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
        libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak vk_swiftshader_icd.json)
    for _files in "${_file_list[@]}";do
        rm -rf "${srcdir}/opt/${pkgname%-bin}/Launcher/${_files}"
        ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${srcdir}/opt/${pkgname%-bin}/Launcher/${_files}"
    done
}
package(){
    cp -Pr --no-preserve=ownership "${srcdir}/opt" "${pkgdir}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    chown -R "${USER}" "${pkgdir}/opt/${pkgname%-bin}"
}