# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

_pkgver=v2026.9.11
pkgver="${_pkgver#v}"
pkgrel=1

_pkgname=sourcepp
pkgname="python-${_pkgname}"

pkgdesc='Several modern C++20 libraries for sanely parsing Valve formats. (python bindings)'
arch=('x86_64')
url='https://github.com/craftablescience/sourcepp'
license=('MIT')

depends=(
	'python>=3.9' 'python<4.0.0'
)

makedepends=('git' 'cmake' 'python-build' 'python-scikit-build-core' 'nanobind' 'python-installer')

source=("git+${url}#tag=${_pkgver}")
sha256sums=('6eb11c8ea42c224e8f6a17f9fbfeee73660b1b099b5d6f791734edadd89d748d')

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
