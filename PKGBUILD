# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

_pyname=glyphsLib
pkgname=python-${_pyname,,}
pkgver=5.3.2
pkgrel=2
pkgdesc='A bridge from Glyphs source files (.glyphs) to UFOs'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
_pydeps=(fonttools
         fs # for fonttools[ufo]
         ufolib2
         unicodedata2) # for fonttools[unicode]
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-setuptools-scm)
_pycheckdeps=(defcon
              lxml # for fonttools[lxml]
              pytest
              ufonormalizer
              xmldiff)
checkdepends=("${_pycheckdeps[@]/#/python-}")
optdepends=(python-defcon
            python-ufonormalizer)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('f0a4247c23c96c5d40a14970f651b402b8e23e517cf1a974bb8682e02d5cd3f9')

prepare() {
	cd "$_archive"
	# Upstream Issue: https://github.com/googlefonts/glyphsLib/issues/701
	sed -i -e '/wheel$/d' setup.cfg
}

build() {
	cd "$_archive"
	export PYTHONHASHSEED=0
	python setup.py build
}

check() {
	cd "$_archive"
	PYTHONPATH=Lib pytest tests
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
