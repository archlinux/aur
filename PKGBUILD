# Maintainer: devome <evinedeng@hotmail.com>

_dlname="tinyMediaManager"
_pkgname="${_dlname,,}"
pkgname="${_pkgname}-bin"
pkgver=5.3.2
pkgrel=1
pkgdesc="A media management tool written in Java/Swing."
provides=("${_pkgname}")
conflicts=("${_pkgname}")
arch=("x86_64" "aarch64")
url="https://www.${_pkgname}.org"
license=("Apache-2.0")
source=("${_pkgname}.desktop"
        "${_pkgname}.png")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.xz::https://release.${_pkgname}.org/v${pkgver%%.*}/dist/${_dlname}-${pkgver}-linux-amd64.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.xz::https://release.${_pkgname}.org/v${pkgver%%.*}/dist/${_dlname}-${pkgver}-linux-arm64.tar.xz")
sha256sums=('08499a10730b6af6113c4a56e4ed7bed068d7fed282080dfd550b66d6a8ac9f5'
            '79b50c260b1c1c1f695c0ea1d743742d11d9a1337a2bc73985e4428752492f0f')
sha256sums_x86_64=('3386cf290f08dbf3c7794e61c63a1b77937ff08c85961cb0ebe0a5650c9bff8a')
sha256sums_aarch64=('e05c228d0a0ce1514b20d50fb81cb74b46d260297beac5953408579257d23569')
_mark1=$(if [[ $CARCH == x86_64 ]]; then echo "linux";      elif [[ $CARCH == aarch64 ]]; then echo "arm";            fi)
_mark2=$(if [[ $CARCH == x86_64 ]]; then echo "${_dlname}"; elif [[ $CARCH == aarch64 ]]; then echo "${_dlname}-arm"; fi)

prepare() {
    cd "${_dlname}"
    mv LICENSE ..
    rm -rf jre "native/${_mark1}/addons/"*
}

package() {
    depends=("ffmpeg" "java-runtime-headless>=8" "libmediainfo")
    
    install -Dm644 "LICENSE"             "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png"     "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    install -dm755 "${pkgdir}/"{opt,usr/bin}

    cp --preserve=mode -r "${_dlname}"   "${pkgdir}/opt/${_pkgname}"

    ln -s "/opt/${_pkgname}/${_mark2}"   "${pkgdir}/usr/bin/${_pkgname}"
    ln -s "/usr/lib/jvm/default"         "${pkgdir}/opt/${_pkgname}/jre"
}
