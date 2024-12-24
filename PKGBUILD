# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Michael M. Tung <mtung at mat dot upv dot es>

_pyname=panflute
pkgname=python-$_pyname
pkgver=2.3.0
pkgrel=4
pkgdesc='A Pythonic alternative to John MacFarlane’s pandocfilters'
arch=(any)
url="https://github.com/sergiocorreia/$_pyname"
license=(BSD-3-Clause)
_pydeps=(click
         yaml)
depends=(pandoc
         python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_pycheckdeps=(pandocfilters
              pytest
              pytest-cov)
checkdepends=("${_pycheckdeps[@]/#/python-}")
provides=("pandoc-$_pyname=$pkgver")
conflicts=("pandoc-$_pyname")
replaces=("pandoc-$_pyname")
_archive="$_pyname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('ea3183575998f7e675c16659587183d6ada03930230009c62b5b0ca6c303a702')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH="$PWD" pytest \
		--deselect tests/test_panfl.py::test_pandoc_call
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
