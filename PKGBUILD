# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

_pkgver=v2026.11.1
pkgver="${_pkgver#v}"
pkgrel=2

_pkgname=sourcepp
pkgname="python-${_pkgname}"

pkgdesc='Several modern C++20 libraries for sanely parsing Valve formats. (python bindings)'
arch=('x86_64')
url='https://github.com/craftablescience/sourcepp'
license=('MIT')

depends=(
	'python>=3.10' 'python<=3.15'
)

makedepends=('git' 'cmake' 'make' 'python-build' 'python-scikit-build-core' 'nanobind' 'python-installer')

source=("git+${url}#tag=${_pkgver}")
sha256sums=('45bfe3d2d057a4aaa095e997137c03ad493978dcb0bf107a49718c1999640477')

build() {
	cd "${_pkgname}"
	cmake -G "Unix Makefiles" -B build -DCMAKE_BUILD_TYPE=Release -DSOURCEPP_BUILD_PYTHON_WRAPPERS=ON -DSOURCEPP_VERSION="${pkgver}"

	cd lang/python
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE

	cd lang/python
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
