# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname='cmake-init'
pkgname="${_pkgname}-git"
pkgver=0.31.1.r0.g8264e70
pkgrel=1
pkgdesc='An opinionated CMake project initializer that generates CMake projects.'
arch=(any)
url="https://github.com/friendlyanon/${_pkgname}"
license=('GPL3')
depends=('python' 'cmake' 'git')
optdepends=(
	'clang: clang-tidy and clang-format'
	'cppcheck'
	'doxygen'
	'lcov'
	'codespell'
	'conan'
	'vcpkg'
)
sha256sums=('SKIP')
source=("git+${url}.git")

_srcdir="$_pkgname"

pkgver() {
	cd "${_srcdir}"
	( set -o pipefail
		git describe --tags --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$_srcdir/package"
	python 'setup.py' build
}

package() {
	cd "$_srcdir/package"
	
	python 'setup.py' install --optimize=1 --root="$pkgdir/" --prefix="/usr"
	
	cd ..
	install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/${_pkgname}"
}
