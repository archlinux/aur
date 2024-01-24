# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fooyin
_pkgname=Fooyin
pkgver=0.2.1
pkgrel=1
pkgdesc="A customisable music player"
arch=('any')
url="https://github.com/ludouzi/fooyin"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    'hicolor-icon-theme'
    'qt6-base'
    'alsa-lib'
    'taglib'
    'ffmpeg'
)
makedepends=(
    'gendesk'
    'cmake'
    'gcc'
    'git'
    'qcoro-qt6'
    'ninja'
)
optdepends=(
    'sdl2'
    'pipewire'
)
options=(
    '!strip'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '1e338ff128b2be2b0d484ea2d00814db6709a5e2cc455a373428d21f8ed690d5')
build() {
    sed -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|${pkgname}|g" \
        -i "${srcdir}/${pkgname}.sh"
    cd "${srcdir}/${pkgname}.git"
    mkdir build
    cmake -S . -B ./build -G Ninja -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=Off
    cmake --build ./build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.git/build/bin/${pkgname}" -t "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/build/lib/${pkgname}/"*.so -t "${pkgdir}/opt/${pkgname}/lib"
    install -Dm644 "${srcdir}/${pkgname}.git/build/lib/${pkgname}/plugins/"*.so -t "${pkgdir}/opt/${pkgname}/lib/plugins"
    for _icons in 16 22 32 48 64 128 256 512;do
        install -Dm644 "${srcdir}/${pkgname}.git/data/icons/${_icons}-${pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.git/dist/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}