# Maintainer: devome <evinedeng@hotmail.com>

_dlname="tinyMediaManager"
_pkgname="${_dlname,,}"
pkgname="${_pkgname}-bin"
pkgver=5.2.3
pkgrel=1
pkgdesc="A media management tool written in Java/Swing."
provides=("${_pkgname}")
conflicts=("${_pkgname}")
arch=("x86_64" "aarch64")
url="https://www.${_pkgname}.org"
license=("Apache-2.0")
depends=("ffmpeg" "java-runtime>=8" "libmediainfo")
source=("${_pkgname}.desktop"
        "${_pkgname}.png")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.xz::https://release.${_pkgname}.org/v${pkgver%%.*}/dist/${_dlname}-${pkgver}-linux-amd64.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.xz::https://release.${_pkgname}.org/v${pkgver%%.*}/dist/${_dlname}-${pkgver}-linux-arm64.tar.xz")
sha256sums=('08499a10730b6af6113c4a56e4ed7bed068d7fed282080dfd550b66d6a8ac9f5'
            '79b50c260b1c1c1f695c0ea1d743742d11d9a1337a2bc73985e4428752492f0f')
sha256sums_x86_64=('7d7615dce2938879a9e268d6fbb077e8a75837552e256865aca416aeec890170')
sha256sums_aarch64=('2d72afe6f0d68a4c9cf75f544e721ebbef326bd2246d01d416346cb310dfb380')
_mark1=$(if [[ $CARCH == x86_64 ]]; then echo "linux";      elif [[ $CARCH == aarch64 ]]; then echo "arm";            fi)
_mark2=$(if [[ $CARCH == x86_64 ]]; then echo "${_dlname}"; elif [[ $CARCH == aarch64 ]]; then echo "${_dlname}-arm"; fi)

prepare() {
    cd "${_dlname}"
    mv LICENSE ..
    rm -rf jre "native/${_mark1}/addons/"*
}

package() {
    install -Dm644 "LICENSE"             "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png"     "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    install -dm755 "${pkgdir}/"{opt,usr/bin}

    cp --preserve=mode -r "${_dlname}"   "${pkgdir}/opt/${_pkgname}"

    ln -s "/opt/${_pkgname}/${_mark2}"   "${pkgdir}/usr/bin/${_pkgname}"
    ln -s "/usr/lib/jvm/default"         "${pkgdir}/opt/${_pkgname}/jre"
    # ln -s "/usr/bin/ffmpeg"              "${pkgdir}/opt/${_pkgname}/native/${_mark1}/addons/ffmpeg"
}
