# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fxradio
_pkgname=FXRadio
pkgver=0.19.1
pkgrel=1
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
    'jdk-openjdk>=21'
    'java-openjfx'
    'git'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
)
sha256sums=('SKIP')
build() {
    cd "${srcdir}/${pkgname}.git"
    ./gradlew jfxNative
    sed "s|/opt/${_pkgname}/${_pkgname} %U|${pkgname} %U|g;s|/opt/${_pkgname}/${_pkgname}.png|${pkgname}|g;s|Utility|AudioVideo;|g" \
        -i "${srcdir}/opt/${pkgname}/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}.git/build/jfx/native/${_pkgname}/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}