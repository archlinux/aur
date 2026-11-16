# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.21.0
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
sha256sums_aarch64=('fc06d364a308ca3db97d50cd941c24f0f663c5fcbac5f1c77b879f4d0f1fa7f4')
sha256sums_armv7h=('beb6b5545502de1b6b272c956e338108c32c90aa8b20e4ed70957df91819da7b')
sha256sums_i686=('3b0cbd91782f54782787cc7c03300268c238f215bd67287b546e0f59d4511681')
sha256sums_x86_64=('9afb537352f3466d59c0316524fc03ee722eea6d54c0ee9ec6e2afc53a70a92c')
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