# Maintainer: prettyleaf
# Maintainer: pluralplay

pkgname=flclashx-git
_appname=flclashx-pre
_pkgname=FlClashXPre
_asset=FlClashX
_desktop_file=com.follow.clashx.pre.desktop
pkgver=0.5.9
pkgrel=1
pkgdesc="[Pre-release] FlClashX Pre, installed beside FlClashX | A multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/pluralplay/FlClashX"
license=('GPL-3.0')
conflicts=("${_appname}")
provides=("${_appname}=${pkgver}")
depends=(
    'libayatana-appindicator'
)
options=('!strip' '!debug' '!emptydirs')
source=("${_appname}.sh")
source_aarch64=("${_appname}-${pkgver}-${pkgrel}-aarch64.deb::${url}/releases/download/v${pkgver}-pre.${pkgrel}/${_asset}-linux-arm64.deb")
source_x86_64=("${_appname}-${pkgver}-${pkgrel}-x86_64.deb::${url}/releases/download/v${pkgver}-pre.${pkgrel}/${_asset}-linux-amd64.deb")
sha256sums=('3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
sha256sums_aarch64=('c625299b766f2fdf70f0258f108aedbc769110a44c0fd29d71a6d4b7e78fa639')
sha256sums_x86_64=('40aacc617a544006d140c7f563de25ead0200f749b3f1e7e4ef8e6c4f752f4ce')

prepare() {
    sed -i -e "
      s/@appname@/${_appname}/g
      s/@runname@/${_pkgname}/g
    " "${srcdir}/${_appname}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
      s|^Exec=.*|Exec=${_appname}|
      s|^Icon=.*|Icon=${_appname}|
    " "${srcdir}/usr/share/applications/${_desktop_file}"
}

package() {
    install -Dm755 "${srcdir}/${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"
    install -dm755 "${pkgdir}/usr/lib/${_appname}"
    # The pre-release bundle lives under /opt/FlClashXPre in the .deb.
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${_appname}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_desktop_file}" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_appname}.png"
}
