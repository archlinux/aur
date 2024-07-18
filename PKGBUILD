# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Maintainer: nomisge <nomisge @ live . de>
# Contributor: Padraic Fanning <fanninpm AT miamioh DOT edu>

_name=generic
pkgname=python-${_name}
pkgver=1.1.3
pkgrel=1
pkgdesc="Library for Generic programming, also known as Multiple dispatch"
arch=('any')
url="https://github.com/gaphor/${_name}"
license=('BSD')
depends=('python')
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=('d0786f9a86a9891ffea0d5f846192a75aeb09601a7d3ae3442a6569877360c75')

build() {
	cd "${_name}-${pkgver}"
	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
	# from incorrectly using a parent git checkout info.
	# https://github.com/pypa/build/issues/384#issuecomment-947675975
	GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}-${pkgver}"
	export PYTHONPATH="${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-py3-none-any.whl:${PYTHONPATH}"
	pytest
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
