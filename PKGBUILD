# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fooyin
_pkgname=Fooyin
pkgver=0.4.1
pkgrel=1
pkgdesc="A customisable music player"
arch=('any')
url="https://github.com/ludouzi/fooyin"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    'qt6-base'
    'alsa-lib'
    'taglib'
    'ffmpeg'
)
makedepends=(
    'gendesk'
    'gcc'
    'git'
    'qcoro-qt6'
    'ninja'
    'base-devel'
    'pkgconf'
    'qt6-svg'
    'qt6-tools'
    'kdsingleapplication'
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
            '840eb0ad528d294064aa09b2b6df7a0e4a800249f43305c756cf78bee627fe1d')
build() {
    sed -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|${pkgname}|g" \
        -i "${srcdir}/${pkgname}.sh"
    cd "${srcdir}/${pkgname}.git"
    install -Dm755 -d build
    cmake -S . -B ./build -G Ninja -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=Off
    cmake --build ./build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.git/build/run/bin/${pkgname}" -t "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/build/run/lib/${pkgname}/"*.so -t "${pkgdir}/opt/${pkgname}/lib"
    ln -sf "/usr/lib/libtag.so" "${pkgdir}/opt/${pkgname%-bin}/lib/libtag.so.1"
    install -Dm644 "${srcdir}/${pkgname}.git/build/run/lib/${pkgname}/plugins/"*.so -t "${pkgdir}/opt/${pkgname}/lib/plugins"
    for _icons in 16 22 32 48 64 128 256 512;do
        install -Dm644 "${srcdir}/${pkgname}.git/data/icons/${_icons}-${pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux/org.${pkgname}.${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}.git/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux/org.${pkgname}.${pkgname}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
}