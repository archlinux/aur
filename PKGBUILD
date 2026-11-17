# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.22.0
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
sha256sums_aarch64=('981c3052a2306defe435c927b239906c37ffc89778f055779cbcb047b0fe88d2')
sha256sums_armv7h=('bcf1593be00dd00455980e857f5f7bc27ffa5980f1c8e03d0a5b3ff46aaa16a3')
sha256sums_i686=('6d05cc10c63ed8e663099a1ae71f477fa650d4990919b2453d20c084b4413297')
sha256sums_x86_64=('237516c29fafebf683492a7f2fce8a64b06f5032544d85ad26acfaa03fc863ed')
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