# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fooyin
_pkgname=Fooyin
pkgver=0.4.1
pkgrel=3
pkgdesc="A customisable music player"
arch=('any')
url="https://github.com/ludouzi/fooyin"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-tools'
    'alsa-lib'
    'taglib'
    'ffmpeg'
    'kdsingleapplication'
)
makedepends=(
    'gcc'
    'git'
    'qcoro-qt6'
    'ninja'
    'base-devel'
    'pkgconf'
    'cmake'
)
optdepends=(
    'sdl2: For the SDL2 audio output plugin'
    'pipewire: For the PipeWire audio output plugin'
)
options=(
    '!strip'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('1538a5300ce4a78db3a412a6aaff5b5c27bc29fae21e5e7152a280b50b085d87')
build() {
    sed -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|${pkgname}|g" \
        -i "${srcdir}/${pkgname}.sh"
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -S . -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_PCH=ON \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build -j$(nproc)
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/fooyin/LICENSE"
}