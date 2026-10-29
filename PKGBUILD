# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=parra-bin
_pkgname="${pkgname%-bin}"
pkgver=0.2.1
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
	"libglvnd"
	"wayland"
)
optdepends=(
	"hyprland>=0.57.0: compositor with partial feature support"
	"niri>=26.04: compositor with full feature support"
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(
	"${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/${_tag}/${_pkgname}-${_tag}-${CARCH}-unknown-linux-gnu.tar.gz"
	"${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Uyanide/parra/refs/tags/${_tag}/LICENSE"
	"${_pkgname}-${pkgver}-service::https://raw.githubusercontent.com/Uyanide/parra/refs/tags/${_tag}/examples/parra.service"
)
sha512sums=('a000b4a9b8dd6005ab1205d6784f097634a802a11e7be9d62d0b9c076102c90ea0277f6a12ab54624ec9b240f589cc2aad5a4ad419a16d9ba90f2b7aff843960'
            '81df58be436e450e36805ee5b9330f0f0a5060206b86bfb9bcd2ebe9d3c5e25106322ba7b1e4f96e85dc7958efff84a51322710bbef7e27df5598625202d8b89'
            '6f62c5a184d2abd31de195060a9eb0d32aa6d1cce580860ada5946436bdf59e90d5bb2a073e761c751c4dec1df2dc536c7f9280c519db8019d0265deabe7d850')

build() {
	# Generate shell completions
	local shell
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
