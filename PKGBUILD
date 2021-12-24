# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

_pyname=glyphsLib
pkgname=python-${_pyname,,}
pkgver=6.0.2
pkgrel=1
pkgdesc='A bridge from Glyphs source files (.glyphs) to UFOs'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
_pydeps=(fonttools
         fs # for fonttools[ufo]
         openstep-plist
         ufolib2
         unicodedata2) # for fonttools[unicode]
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-defcon
             python-setuptools-scm)
_pycheckdeps=(lxml # for fonttools[lxml]
              pytest
              ufo2ft
              ufonormalizer
              xmldiff)
checkdepends=("${_pycheckdeps[@]/#/python-}")
optdepends=(python-defcon
            python-ufonormalizer)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('ff27297edea7e727961edbc194063c93cacce6fbac4897ab6883b679f450ea1b')
_setup='from setuptools import setup; setup();'

build() {
	cd "$_archive"
	python -c "$_setup" build
}

check() {
	cd "$_archive"
	# skipped tests require ufo2ft, a circular dependency which might be on
	# older version than expected when this is built against Arch packages
	PYTHONPATH=Lib pytest tests \
		--deselect tests/builder/builder_test.py
}

package() {
	cd "$_archive"
	PYTHONPATH=Lib python -c "$_setup" install --root="$pkgdir" --optimize=1 --skip-build
}
