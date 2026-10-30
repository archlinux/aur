# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=clash-of-rust-bin
_pkgname=Clash-of-Rust
pkgver=0.6.5
pkgrel=1
pkgdesc="Cross-platform client side based on Rust, Slint and mihomo."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Fu021/Clash-of-Rust"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'glib2'
    'libgcc'
    'hicolor-icon-theme'
    'fontconfig'
    'mihomo'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
sha256sums_aarch64=('193a4188ada4371be0baf19f6abf2119208b06bce43a85a4dc56782d2c3b75bb')
sha256sums_x86_64=('8dd160004ed9e39b5ee60d9010f2ce6eaae4ddb4ee981bafae349f1836378894')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/usr\/bin\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    ln -sf "/usr/bin/mihomo" "${srcdir}/opt/${pkgname%-bin}/resources/mihomo"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -a "${srcdir}/opt/${pkgname%-bin}/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/cor" "${pkgdir}/usr/bin/cor"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/polkit-1/actions/org.clashofrust.tun.policy" -t "${pkgdir}/usr/share/polkit-1/actions"
}
