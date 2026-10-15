# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=setsuna-bin
_pkgname=Setsuna
_debname="com.gt610.${pkgname%-bin}"
pkgver=1.0.213+0
pkgrel=1
pkgdesc="Download in one Setsuna - Motrix & AriaNg alternative in one app."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/GT-610/setsuna"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'aria2'
    'libnotify'
    'libayatana-appindicator'
    'libayatana-indicator'
    'ayatana-ido'
    'libsecret'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_x64.deb")
sha256sums=('3fa20f85c87576bc9daa1db5d163def5aa239d040b7e308d747cc46bdd1b1713')
sha256sums_aarch64=('dd0132bd357b49f84dcc800cf0107e2995f097a63ea94120419eed9de34b6779')
sha256sums_x86_64=('c5dd3e79c0934d26547f864da2eeda7aae44e70b3429bbc97e965c7dc0c5774a')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/usr\/lib\/${pkgname%-bin}\///g
        s/Icon=${_debname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_debname}.desktop"
    ln -sf "/usr/bin/aria2c" "${srcdir}/usr/lib/${pkgname%-bin}/data/core/aria2c"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -a "${srcdir}/usr/lib" "${pkgdir}/usr"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
