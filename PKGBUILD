# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=memos
pkgname="${_appname}pot-bin"
_pkgname=Memospot
pkgver=1.0.5
pkgrel=1
pkgdesc="Self-contained desktop version of Memos -a privacy-first, lightweight note-taking service."
arch=('x86_64')
url="https://memospot.github.io/"
_ghurl="https://github.com/memospot/memospot"
license=('BlueOak-1.0.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/memospot/memospot/v${pkgver}/LICENSE.md"
)
sha256sums=('0fd9f38688b19c94131f5bea229d042c260ae9db1f5660dc3934707d89400843'
            '5f279601a1d1c2da10ef493b295bd1ee75fe3d50afdc43ca297769a22ad6d895')
package() {
    install -Dm755 "${srcdir}/usr/bin/"{"${_appname}","${pkgname%-bin}"} -t "${pkgdir}/usr/bin"
    mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
