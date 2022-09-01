# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nanoemoji
pkgver=0.14.2
pkgrel=1
pkgdesc='A wee tool to build color fonts'
arch=(any)
url="https://github.com/googlefonts/$_pkgname"
license=(Apache)
_py_deps=(cffsubr # optdepends of ufo2ft required for [cffsubr]
          fonttools
          fs # optdepends of fonttols required for [ufo]
          lxml
          pillow
          regex
          toml
          ufo2ft
          ufolib2)
depends=(absl-py
         ninja
         picosvg
         python
         "${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer}
             python-setuptools-scm
             python-wheel)
optdepends=('resvg: Support CBDT and sbix color fonts')
checkdepends=(python-pytest
              resvg)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('8ede8854ecb2dac6d0dea69f9f047b6647a7fa66981f2f0fb72b5afa2e67880d')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	# Skip tests that assume shell access to installed executable
	PYTHONPATH=build/lib pytest \
		--deselect tests/extract_svgs_test.py \
		--deselect tests/maximum_color_test.py \
		--deselect tests/nanoemoji_test.py
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
