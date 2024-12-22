# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# shellcheck disable=SC2034,SC2154

pkgname=shellcheck_makefile-git
pkgver=1.27.3.r0.gb550505
pkgrel=2
pkgdesc="Small utility for applying Shellcheck on Makefiles. Depends only on shellcheck, make and python."
arch=('any')
url="https://github.com/actionless/shellcheck_makefile"
license=('GPL-3.0-only')
source=(
	"$pkgname::git+${url}#branch=master"
)
b2sums=('SKIP')
depends=(
	'shellcheck'
	'make'
	'python'
)
makedepends=(
	'python-wheel'
	'python-hatchling'
	'python-build'
	'python-installer'
	'python-setuptools'  # i think it normally should be required by python-pep517 which required by python-build/installer
	#'python-markdown-it-py'
)
optdepends=(
)
conflicts=('shellcheck_makefile')
provides=('shellcheck_makefile')

pkgver() {
	cd "${srcdir}/${pkgname}" || exit 2
	set -o pipefail
	git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || echo 0.0.1
}

build() {
	cd "${srcdir}/${pkgname}" || exit 2
	if test -d ./dist ; then
		rm -r ./dist
	fi
	/usr/bin/python3 -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}" || exit 2
	/usr/bin/python3 -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	#install -Dm644 shellcheck_makefile.1 "$pkgdir/usr/share/man/man1/shellcheck_makefile.1"
}
