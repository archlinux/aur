# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=remotrix-bin
_pkgname=Remotrix
pkgver=0.3.2
pkgrel=1
pkgdesc="A Rust-native desktop download manager inspired by Motrix-next, built with the iced GUI framework and an aria2-next sidecar engine driven over WebSocket JSON-RPC (aria2-ws)."
arch=('x86_64')
url="https://github.com/lazy1104/Remotrix"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libgcc'
    'glibc'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=('3129c64e81accdfa478c958f1c8b06fbcf9d6c9f9067f26475923207127ecee5'
            'bd41313039d578d73789177f2a71081afedfae4450a9203d845704a32ac7ec6b')
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
