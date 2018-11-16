# Maintainer: Yauheni Kirylau <actionless dot loveless AT gmail.com>
# shellcheck disable=SC2034,SC2148,SC2154,SC2164

_pkgname=nohang
pkgname=${_pkgname}-git
pkgver=r152.g37bb978
pkgrel=1
pkgdesc="A highly configurable OOM preventer"
arch=('any')
url="https://github.com/hakavlad/nohang"
license=('MIT')
source=(
	"$pkgname::git+https://github.com/hakavlad/nohang.git#branch=master"
)
md5sums=('SKIP')
depends=(
	'python'
	'libnotify'
	'sudo'
	'procps-ng'
)
optdepends=(
)
conflicts=("${_pkgname}")
backup=('etc/nohang/nohang.conf')

pkgver() {
	cd "${srcdir}/${pkgname}" || exit 2
	set -o pipefail
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
		echo "r$(git log --oneline | wc -l).g$(git describe --always)"
}

package() {
	cd "${srcdir}/${pkgname}" || exit 2
	make DESTDIR="${pkgdir}" install

	cd "${pkgdir}"
	mv usr/sbin usr/bin
	mv lib usr/lib
}
