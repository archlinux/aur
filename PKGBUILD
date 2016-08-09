# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=libinput-gestures-git
_pkgname=libinput-gestures
pkgver=r21.db6b688
pkgrel=1
pkgdesc="Actions gestures on your touchpad using libinput"
arch=('any')
license=('GPL3')
url="https://github.com/bulletmark/libinput-gestures"
depends=('libinput' 'xdotool' 'python')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
backup=("etc/conf.d/${_pkgname}.conf")
install="${pkgname}.install"
source=("${_pkgname}"::"git+https://github.com/bulletmark/${_pkgname}")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^slurm-//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	# Quick and dirty fix to make /etc/conf.d/libinput-gestures.conf the main/only configuration file
	sed -i 's/~\/.config/\/etc\/conf.d/g' libinput-gestures
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -D -m755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
	install -D -m644 "${_pkgname}.conf"    "${pkgdir}/etc/conf.d/${_pkgname}.conf"
	install -D -m644 "${_pkgname}.desktop" "${pkgdir}/etc/xdg/autostart/${_pkgname}.desktop"
}
