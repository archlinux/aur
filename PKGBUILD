# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fxradio
_pkgname=FXRadio
pkgver=0.18.2
pkgrel=1
pkgdesc="Internet radio directory for desktop written in tornadofx"
arch=('any')
url="http://hudacek.online/fxradio"
_githuburl="https://github.com/Joseph5610/fxradio"
license=('AGPL3')
conflicts=("${pkgname}")
depends=('vlc' 'java-runtime' 'libxtst' 'gtk3' 'gtk2' 'giflib' 'pango' 'zlib' 'gcc-libs' 'glibc' 'bash' 'freetype2' 'libx11' 'libxext' 'lcms2' \
    'cairo' 'libxi' 'libjpeg-turbo' 'gdk-pixbuf2' 'libpng' 'alsa-lib' 'libxrender' 'glib2' 'libglvnd' 'ffmpeg4.4' 'harfbuzz')
makedepends=('jdk-openjdk>=20' 'java-openjfx>=20')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ed00fbc37a7175d54977034b8995a52fa9c9490b2770901faf75e87ec2839836')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./gradlew jfxNative
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/${pkgname},usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/build/jfx/native/${_pkgname}/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    sed "s|/opt/${_pkgname}/${_pkgname} %U|${pkgname} %U|g;s|/opt/${_pkgname}/${_pkgname}.png|${pkgname}|g;s|Utility|AudioVideo;|g" \
        -i "${pkgdir}/opt/${pkgname}/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}