# Maintainer: Benjamin von Polheim <ben at vp dot solutions>

pkgname=pushin-cli-bin
_pkgname=pushin-cli
pkgver=0.3.1
pkgrel=1
pkgdesc="CLI for the pushin.eu API (pun), mirroring the gh GitHub CLI's noun-verb shape"
arch=('x86_64' 'aarch64')
url="https://pushin.eu/pjullrich/pushin-cli"
license=('MIT')
provides=('pun' 'pushin-cli')
conflicts=('pushin-cli')
options=('!strip')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f4a854693e57be9fd870e537b1ab30a219c7f27e954abc73253b02ef1a428c34')

package() {
	cd "${_pkgname}-v${pkgver}"

	case "${CARCH}" in
		x86_64)  _platform=linux-x86_64 ;;
		aarch64) _platform=linux-arm64 ;;
	esac

	install -Dm755 "dist/${_platform}/pun" "${pkgdir}/usr/bin/pun"

	# Keep the build offline: pun does an update check on every invocation
	export PUN_NO_UPDATE_CHECK=1

	local _pun="${pkgdir}/usr/bin/pun"

	install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
	install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
	install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

	"${_pun}" completion bash > "${pkgdir}/usr/share/bash-completion/completions/pun"
	"${_pun}" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_pun"
	"${_pun}" completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/pun.fish"

	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
