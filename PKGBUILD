# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-fonttools-git
pkgver=4.50.0.r8.gac7e55b
pkgrel=1
pkgdesc='A library to manipulate font files from Python'
url='https://github.com/fonttools/fonttools'
license=(MIT)
arch=(x86_64)
depends=(python)
makedepends=(cython
             git
             python-{build,installer}
             python-setuptools
             python-wheel)
checkdepends=(python-brotli
              python-fs
              python-pytest
              python-skia-pathops
              python-ufolib2)
optdepends=('python-brotli: to compress/decompress WOFF 2.0 web fonts'
            'python-fs: to read/write UFO source files'
            'python-lxml: faster backend for XML files reading/writing'
            'python-lz4: for graphite type tables in ttLib/tables'
            'python-matplotlib: for visualizing DesignSpaceDocument and resulting VariationModel'
            'python-pyqt5: for drawing glyphs with Qt’s QPainterPath'
            'python-reportlab: to drawing glyphs as PNG images'
            'python-scipy: for finding wrong contour/component order between different masters'
            'python-sympy: for symbolic font statistics analysis'
            'python-uharfbuzz: to use the Harfbuzz Repacker for packing GSUB/GPOS tables'
            'python-unicodedata2: for displaying the Unicode character names when dumping the cmap table with ttx'
            'python-zopfli: faster backend fom WOFF 1.0 web fonts compression')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 HEAD |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	python -m build -wn
}

check() {
	cd "$pkgname"
	PYTHONPATH=Lib pytest
}

package() {
	cd "$pkgname"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0755 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
