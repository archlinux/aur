# Maintainer: Yauheni Kirylau <actionless dot loveless AT gmail.com>
# shellcheck disable=SC2034,SC2154

_pkgname=python-bangla
pkgname="$_pkgname"-git
pkgver=0.0.0.r26.g34e2a71
pkgrel=2
pkgdesc="Bangla is a package for Bangla language users with various functionalities including Bangla date and Bangla numeric conversation"
arch=('any')
url="https://github.com/arsho/bangla"
license=('MIT')
source=(
	"$pkgname::git+${url}"
)
md5sums=('SKIP')
depends=(
	'python'
)
makedepends=(
	'python-wheel'
	'python-hatchling'
	'python-build'
	'python-installer'
	'python-setuptools'  # i think it normally should be required by python-pep517 which required by python-build/installer
)
optdepends=(
)
conflicts=("$_pkgname")
provides=("$_pkgname")

pkgver() {
	cd "${srcdir}/${pkgname}" || exit 2
	set -o pipefail
	git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "0.0.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)" \
	|| echo 0.0.0.1
}

build() {
	cd "${srcdir}/${pkgname}" || exit 2
	/usr/bin/python3 -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}" || exit 2
	/usr/bin/python3 -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
