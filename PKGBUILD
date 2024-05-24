# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fooyin-bin
_pkgname=Fooyin
_appname="org.${pkgname%-bin}.${pkgname%-bin}"
pkgver=0.4.3
pkgrel=1
pkgdesc="A customisable music player"
arch=('x86_64')
url="https://github.com/ludouzi/fooyin"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-tools'
    'alsa-lib'
    'taglib'
    'ffmpeg'
    'kdsingleapplication'
)
optdepends=(
    'sdl2: For the SDL2 audio output plugin'
    'pipewire: For the PipeWire audio output plugin'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-mantic_amd64.deb"
)
sha256sums=('af650ec32c27a257c51688b0224e4bdf54413e2aee08cd71cfcd3c3e2bb55ca9')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/"*.so* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/plugins/"*.so -t "${pkgdir}/usr/lib/${pkgname%-bin}/plugins"
    ln -sf "/usr/lib/libtag.so" "${pkgdir}/usr/lib/${pkgname%-bin}/libtag.so.1"
    for _icons in 16x16 22x22 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/translations/"*.qm -t "${pkgdir}/usr/share/${pkgname%-bin}/translations"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}