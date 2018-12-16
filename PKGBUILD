# Maintainer: Yauheni Kirylau <actionless dot loveless AT gmail.com>
# shellcheck disable=SC2034,SC2148,SC2154,SC2164

_pkgname=nohang
pkgname=${_pkgname}-git
pkgver=0.1.r85.g74640fe
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
)
optdepends=(
	'libnotify: to show GUI notifications'
	'sudo: to show GUI notifications if nohang started with UID=0'
)
conflicts=("${_pkgname}")
backup=('etc/nohang/nohang.conf')

pkgver() {
	cd "${srcdir}/${pkgname}" || exit 2
	set -o pipefail
	git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${pkgname}" || exit 2
	make DESTDIR="${pkgdir}" install

	# Realign files in Arch packaging style:

	cd "${pkgdir}"

	mv usr/sbin/* usr/bin
	rm -r usr/sbin

	mv lib/* usr/lib
	rm -r lib

	mkdir -p usr/lib/systemd
	mv usr/lib/system usr/lib/systemd/
}
