# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fxradio
_pkgname=FXRadio
pkgver=0.19.2
pkgrel=2
pkgdesc="Internet radio directory for desktop written in tornadofx"
arch=('any')
url="http://hudacek.online/fxradio"
_ghurl="https://github.com/Joseph5610/fxradio"
license=('AGPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    'vlc'
    'java-runtime'
    'libxtst'
    'gtk3'
    'gtk2'
    'alsa-lib'
    'ffmpeg4.4'
)
makedepends=(
    'jdk-openjdk'
    'java-openjfx'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
)
sha256sums=('a296cd16093b2a4d016fbb7bb5007985eec462b50a29ab28fa1ed147f08d98e7')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./gradlew -i jfxNative
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_pkgname} %U/${pkgname} %U/g
        s/\/opt\/${_pkgname}\/${_pkgname}.png/${pkgname}/g
        s/Utility/AudioVideo;/g
    " "${srcdir}/opt/${pkgname}/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname}"}
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/build/jfx/native/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname}"
    ln -sf "/usr/lib/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}