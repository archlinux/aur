# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fooyin-bin
_pkgname=Fooyin
_appname="org.${pkgname%-bin}.${pkgname%-bin}"
pkgver=0.4.1
pkgrel=1
pkgdesc="A customisable music player"
arch=('any')
url="https://github.com/ludouzi/fooyin"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'qt6-base'
    'alsa-lib'
    'ffmpeg'
    'taglib'
)
optdepends=(
    'sdl2'
    'pipewire'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-mantic_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('64c459ba91df8ff6f4c4768090fb259e2e76c0bcecc10e37a8747ee2a63d1f7b'
            '840eb0ad528d294064aa09b2b6df7a0e4a800249f43305c756cf78bee627fe1d')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/metainfo/${_appname}.metainfo.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/"*.so* -t "${pkgdir}/opt/${pkgname%-bin}/lib"
    ln -sf "/usr/lib/libtag.so" "${pkgdir}/opt/${pkgname%-bin}/lib/libtag.so.1"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/plugins/"*.so -t "${pkgdir}/opt/${pkgname%-bin}/lib/plugins"
    for _icons in 16x16 22x22 32x32 48x48 64x64 128x128 256x256 512x512 scalable;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}."* \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/translations/"*.qm -t "${pkgdir}/opt/${pkgname%-bin}/translations"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}