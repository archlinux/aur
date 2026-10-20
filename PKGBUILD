# Maintainer: prettyleaf
# Maintainer: pluralplay

pkgname=flclashx-git
_pkgname=FlClashX
_desktop_file=com.follow.clashx.desktop
pkgver=0.5.0
pkgrel=1
pkgdesc="[Pre-release] Fork of FlClash | A multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/pluralplay/FlClashX"
license=('GPL-3.0')
conflicts=("${pkgname%-git}" "flclash-bin" "flclash" "flclashx" "flclashx-bin" "flclashx-bin-debug")
provides=("${pkgname%-git}=${pkgver}")
depends=(
    'libayatana-appindicator'
    'libkeybinder3'
)
options=('!strip' '!emptydirs')
source=("${pkgname%-git}.sh")
source_aarch64=("${pkgname%-git}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}-pre.${pkgrel}/${_pkgname}-linux-arm64.deb")
source_x86_64=("${pkgname%-git}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}-pre.${pkgrel}/${_pkgname}-linux-amd64.deb")
sha256sums=('3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
sha256sums_aarch64=('a522d6eebf73bd6684d70905a7c436bb1c2921454545b1a98871d74578af745c')
sha256sums_x86_64=('0316f8033fd494578945191c96606d058321f4229f36a1fcfc97f117c845fe7a')
prepare() {
    sed -i -e "
      s/@appname@/${pkgname%-git}/g
      s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
      s|^Exec=.*|Exec=${pkgname%-git}|
      s|^Icon=.*|Icon=${pkgname%-git}|
      s|^Categories=.*|Categories=Network;|
    " "${srcdir}/usr/share/applications/${_desktop_file}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_desktop_file}" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"
}
