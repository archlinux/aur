# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.23.0
pkgrel=1
pkgdesc="A command-line tool that lets you easily create isolated shells for development."
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://www.jetify.com/devbox/"
_ghurl="https://github.com/jetify-com/devbox"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'docker'
    'nix'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7l.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('9428ae5c91292aff8800bc8effa2fb94b51ce0e8a6226ffb61e62431a23aa901')
sha256sums_armv7h=('b9db02d2cae87cbf0c18f110a35b5187b5e31b6bfe3bd51b9f6291720bc7ee48')
sha256sums_i686=('8974515e7da2ebff7ac91ce9a67713782a7dd390a02ed3b0a3993e1fb0cd2e0c')
sha256sums_x86_64=('c6a853f6b7b4bb3d575299528459a534d5a70fa5ff84210c39dfc1899c32a108')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	for _shell in bash fish zsh; do
		case ${_shell} in
			bash)	_dest="/usr/share/bash-completion/completions/${pkgname%-bin}" ;;
			fish)	[ -x /usr/bin/fish ] || continue
				_dest="/usr/share/fish/vendor.completions.d/${pkgname%-bin}.fish" ;;
			zsh)	[ -x /usr/bin/zsh ] || continue
				_dest="/usr/share/zsh/site-functions/_${pkgname%-bin}" ;;
		esac
		"${srcdir}/${pkgname%-bin}" completion "${_shell}" | install -Dm644 /dev/stdin "${pkgdir}${_dest}"
	done
}