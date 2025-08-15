# Maintainer: Exorcism
# Contributor: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=xformers
pkgname=python-${_name}
pkgver=0.0.32.post2
pkgrel=1
pkgdesc="Transformers building blocks, supporting a composable construction"
arch=('any')
url="https://pypi.org/project/${_name}"
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
ninja
)
source=(
	"$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/x/${_name}/${_name}-${pkgver}.tar.gz"
)

sha256sums=('9538be803969c6e1ca16a3ece921e472c24f79970b10be1087a389dcb66e412a')

build() {
	cd "${_name}-${pkgver}"

	sed -i -e 's|torch/types.h|torch/library.h|g' xformers/csrc/attention/attention.cpp

	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
	# from incorrectly using a parent git checkout info.
	# https://github.com/pypa/build/issues/384#issuecomment-947675975
	GIT_CEILING_DIRECTORIES="${PWD}/.." \
	NVCC_CCBIN='/usr/bin/g++-14' \
	CFLAGS='-DGLOG_USE_GLOG_EXPORT' \
	CCFLAGS='-DGLOG_USE_GLOG_EXPORT' \
	NVCC_APPEND_FLAGS='-DGLOG_USE_GLOG_EXPORT' \
	CXXFLAGS='-DGLOG_USE_GLOG_EXPORT' \
		python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
