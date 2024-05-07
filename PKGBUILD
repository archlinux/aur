# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fooyin
_pkgname=Fooyin
pkgver=0.4.1
pkgrel=2
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
    'kdsingleapplication'
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
)
optdepends=(
    'sdl2'
    'pipewire'
)
options=(
    '!strip'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('1538a5300ce4a78db3a412a6aaff5b5c27bc29fae21e5e7152a280b50b085d87'
            '27adc8443e7b8f876eb841c4dfb87ca28821aac511850da961b90704eed14abb')
build() {
    sed -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|${pkgname}|g" \
        -i "${srcdir}/${pkgname}.sh"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sh ci/archlinux-depends.sh
    sh ci/archlinux-build.sh
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/run/bin/${pkgname}" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/run/lib/${pkgname}/"*.so* -t "${pkgdir}/usr/lib/${pkgname}"
    ln -sf "/usr/lib/libtag.so" "${pkgdir}/usr/lib/${pkgname%-bin}/libtag.so.1"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/run/lib/${pkgname}/plugins/"*.so -t "${pkgdir}/usr/lib/${pkgname}/plugins"
    for _icons in 16 22 32 48 64 128 256 512;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/data/icons/${_icons}-${pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux/org.${pkgname}.${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux/org.${pkgname}.${pkgname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname}.metainfo.xml"
}