# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=xformers
pkgname=python-${_name}
pkgver=0.0.29
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
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/e1/0d/7318eed50e4eef31d01d96453bcc29c200c72f77d28fb33e927b6ef9e815/xformers-${pkgver}.tar.gz"
)
sha256sums=('9d7710f6a45d7ea6de903ce28743e336c640aad17b5e753196df5768b6ab31c4')

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
