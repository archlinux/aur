# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Contributor: Padraic Fanning <fanninpm AT miamioh DOT edu>

_name=generic
pkgname=python-${_name}
pkgver=1.1.0
pkgrel=2
pkgdesc="Library for Generic programming, also known as Multiple dispatch"
arch=('any')
url="https://github.com/gaphor/generic"
license=('BSD')
# Note: python-exceptiongroup is a requirement until we switch over to
# Python 3.11
depends=('python' 'python-exceptiongroup')
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8628d1bce4044e7664c149f785d7ad17a388e96c648ee09aef39d73578d52943')

build() {
	cd "${_name}-${pkgver}"
	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
	# from incorrectly using a parent git checkout info.
	# https://github.com/pypa/build/issues/384#issuecomment-947675975
	GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}-${pkgver}"
	pytest
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
