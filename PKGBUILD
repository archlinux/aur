# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=xformers
pkgname=python-${_name}
pkgver=0.0.29.post3
pkgrel=1
pkgdesc="Transformers building blocks, supporting a composable construction"
arch=('any')
url="https://pypi.org/project/${_name}"
license=('BSD')
depends=(python python-pytorch python-numpy)
makedepends=(
	'python-wheel'
	'python-hatchling'
	'python-build'
	'python-installer'
	'python-setuptools'  # i think it normally should be required by python-pep517 which required by python-build/installer
ninja
)
source=(
	"$pkgname-$pkgver.tar.gz::\
https://files.pythonhosted.org/packages/c1/fd/e9201fbee6a1a6d7a9c67c24a256ad4c2377bc67a634f7dbeaea23bd668a/\
xformers-${pkgver}.tar.gz"
)

sha256sums=('0b77c67ecc3c9fdd8a0e4399e675adf12e2ff40285e00974cca2d09108157f60')

build() {
	cd "${_name}-${pkgver}"

	sed -i -e 's|torch/types.h|torch/library.h|g' xformers/csrc/attention/attention.cpp

	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
	# from incorrectly using a parent git checkout info.
	# https://github.com/pypa/build/issues/384#issuecomment-947675975
	GIT_CEILING_DIRECTORIES="${PWD}/.." \
	NVCC_CCBIN='/usr/bin/g++-13' \
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
