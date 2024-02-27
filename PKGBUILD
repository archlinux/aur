# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-fontmake
_pyname=${pkgname#python-}
pkgver=3.8.1
pkgrel=1
pkgdesc='Compile fonts from sources (UFO, Glyphs) to binary (OpenType, TrueType)'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
_pydeps=(attrs
         fontmath
         fonttools
         fs # for fonttools[ufo]
         glyphslib
         lxml # for fonttools[lxml] and defcon[lxml]
         ttfautohint-py
         ufo2ft
         ufolib2
         unicodedata2) # for fonttools[unicode]
depends=(python
         "${_pydeps[@]/#/python-}")
checkdepends=(python-compreffor
              python-defcon
              python-mutatormath
              python-pytest
              python-skia-pathops)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
optdepends=(python-mutatormath
            python-skia-pathops)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('9b47112e6f496ea96c7fd37047b2e66b63596148f2e480c960ea2b55b74b0eec')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="$PWD/build/lib"
	pytest tests
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
