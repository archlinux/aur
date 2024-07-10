# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname='cmake-init'
pkgname="${_pkgname}-git"
pkgver=0.40.7.r0.gd8c519c
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
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
sha256sums=('SKIP')
source=("git+${url}.git")

_srcdir="$_pkgname"

pkgver() {
	cd "${_srcdir}"
	( set -o pipefail
		git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "$_srcdir/package"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcdir/package"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 '../COPYING' -t "$pkgdir/usr/share/licenses/${_pkgname}"
}
