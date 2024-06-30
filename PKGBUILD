# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Maintainer: nomisge <nomisge @ live . de>
# Contributor: Padraic Fanning <fanninpm AT miamioh DOT edu>

_name=generic
pkgname=python-${_name}
pkgver=1.1.2
pkgrel=2
pkgdesc="Library for Generic programming, also known as Multiple dispatch"
arch=('any')
url="https://github.com/gaphor/${_name}"
license=('BSD')
# Note: python-exceptiongroup is a requirement until we switch over to
# Python 3.11
depends=('python')
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	"https://patch-diff.githubusercontent.com/raw/gaphor/generic/pull/525.diff"
)
sha256sums=('2885cd28156d3d83f69257d974db57f60f5171e3f6c50edf8e4421ba42f2b4f1'
            'b7124e689278e4b8c2d1091e4268cc639991a878460acfdc08434522f1b8f69e')

prepare() {
	cd "${_name}-${pkgver}"
	patch -Np1 -i "${srcdir}/525.diff"
}

build() {
	cd "${_name}-${pkgver}"
	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
	# from incorrectly using a parent git checkout info.
	# https://github.com/pypa/build/issues/384#issuecomment-947675975
	GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}-${pkgver}"
	export PYTHONPATH=./:$PYTHONPATH
	pytest
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
