# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-fontmake-git
pkgver=3.7.1.r13.gdae37e6
pkgrel=1
pkgdesc='Compile fonts from sources (UFO, Glyphs) to binary (OpenType, TrueType)'
url='https://github.com/googlefonts/fontmake'
license=(MIT)
arch=(x86_64)
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
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-compreffor
              python-defcon
              python-mutatormath
              python-pytest
              python-skia-pathops)
optdepends=(python-mutatormath
            python-skia-pathops)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	python -m build -wn
}

check() {
	cd "$pkgname"
	export PYTHONPATH="$PWD/build/lib"
	pytest tests
}

package() {
	cd "$pkgname"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm755 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
