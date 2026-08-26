# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=parra-bin
_pkgname="${pkgname%-bin}"
pkgver=0.1.2
pkgrel=1
_tag="v${pkgver}"
pkgdesc="Wallpaper daemon with compositor-driven effects, for wlr-layer-shell"
arch=("x86_64")
url="https://github.com/Uyanide/parra"
license=("MIT")
options=(!debug)
depends=(
	"glibc"
	"libgcc"
	"wayland"
	"libglvnd"
)
optdepends=(
	"niri: compositor with full feature support"
	"hyprland: compositor with partial feature support"
)
provides=("${_pkgname}=${pkgver}")
source=(
	"${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/${_tag}/${_pkgname}-${_tag}-${CARCH}-unknown-linux-gnu.tar.gz"
	"${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Uyanide/parra/refs/tags/${_tag}/LICENSE"
	"${_pkgname}-${pkgver}-service::https://raw.githubusercontent.com/Uyanide/parra/refs/tags/${_tag}/examples/parra.service"

)
sha512sums=('c14adf5ef036480771baaa80e1486f379ec4d80c1661cc3779af24abc2cf552c0b5a9c4bd445ad74d14d8671dcba80d484b73bedf85f692437b2928536e9bee0'
            '81df58be436e450e36805ee5b9330f0f0a5060206b86bfb9bcd2ebe9d3c5e25106322ba7b1e4f96e85dc7958efff84a51322710bbef7e27df5598625202d8b89'
            '6f62c5a184d2abd31de195060a9eb0d32aa6d1cce580860ada5946436bdf59e90d5bb2a073e761c751c4dec1df2dc536c7f9280c519db8019d0265deabe7d850')

build() {
	# Generate shell completions
	for shell in bash fish zsh; do
		"${srcdir}/${_pkgname}" completions "${shell}" > "${shell}-completions"
	done
}

package() {
	install -Dm755 "${_pkgname}" \
		"${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}-${pkgver}-LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${_pkgname}-${pkgver}-service" \
		"${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"

	# Install shell completions
	install -Dm644 bash-completions \
		"${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 fish-completions \
		"${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
	install -Dm644 zsh-completions \
		"${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
