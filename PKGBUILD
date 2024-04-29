# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Michael M. Tung <mtung at mat dot upv dot es>

_pyname=panflute
pkgname=python-$_pyname-git
pkgver=v2.3.0.r0.g1c5447d
pkgrel=1
pkgdesc='A Pythonic alternative to John MacFarlane’s pandocfilters'
arch=(any)
url="https://github.com/sergiocorreia/$_pyname"
license=(BSD-3-Clause)
_pydeps=(click
         yaml)
depends=(pandoc
         python
         "${_pydeps[@]/#/python-}")
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools)
_pycheckdeps=(pandocfilters
              pytest
              pytest-cov)
checkdepends=("${_pycheckdeps[@]/#/python-}")
provides=("${pkgname%-git}=$pkgver" "pandoc-$_pyname=$pkgver")
conflicts=("${pkgname%-git}" "pandoc-$_pyname")
replaces=("pandoc-$_pyname-git")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --always --tags --abbrev=7 HEAD |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	python -m build -wn
}

check() {
	cd "$pkgname"
	PYTHONPATH="$PWD" pytest \
		--deselect tests/test_panfl.py::test_pandoc_call
}

package() {
	cd "$pkgname"
	python -m installer -d "$pkgdir" dist/*.whl
}
