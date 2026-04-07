# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Exorcism
# Contributor: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=xformers
pkgname=python-${_name}
pkgver=0.0.35
pkgrel=1
pkgdesc="Transformers building blocks, supporting a composable construction"
arch=('any')
url="https://github.com/facebookresearch/${_name}"
license=('BSD')
depends=(
	'python'
	'python-pytorch'
	'python-numpy'
)
makedepends=(
	'python-wheel'
	'python-fsspec'
	'python-hatchling'
	'python-build'
	'python-installer'
	'python-setuptools'  # i think it normally should be required by python-pep517 which required by python-build/installer
	'ninja'
)
source=(
	"$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/x/${_name}/${_name}-${pkgver}.tar.gz"
)

sha256sums=('f7fc183a58e4bf0e2ae339a18fb1b1d4a37854c0f2545b4f360fef001646ab76')

build() {
	cd "${_name}-${pkgver}"

	sed -i -e 's|torch/types.h|torch/library.h|g' xformers/csrc/attention/attention.cpp

	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
	# from incorrectly using a parent git checkout info.
	# https://github.com/pypa/build/issues/384#issuecomment-947675975
	export GIT_CEILING_DIRECTORIES="${PWD}/.."
	export NVCC_CCBIN="${NVCC_CCBIN}"
	export CFLAGS='-DGLOG_USE_GLOG_EXPORT'
	export CCFLAGS='-DGLOG_USE_GLOG_EXPORT'
	export NVCC_APPEND_FLAGS='-DGLOG_USE_GLOG_EXPORT'
	export CXXFLAGS='-DGLOG_USE_GLOG_EXPORT'

	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
