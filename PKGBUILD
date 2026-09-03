# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=remotrix-bin
_pkgname=Remotrix
pkgver=0.3.0
pkgrel=1
pkgdesc="A Rust-native desktop download manager inspired by Motrix-next, built with the iced GUI framework and an aria2-next sidecar engine driven over WebSocket JSON-RPC (aria2-ws)."
arch=('x86_64')
url="https://github.com/lazy1104/Remotrix"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=('4cccbd653478c35a8309258d7a3d894dc4b20a7f8ca07a6b7d003e91bd4a81f8'
            '634f002e12fff4b4fab31bd3cf91c5975bd365dbafa027725559ee2677252ce8')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/Categories=/Categories=Network;/" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
