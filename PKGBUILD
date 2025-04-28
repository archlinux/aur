# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nanoemoji
pkgver=0.15.3
pkgrel=1
pkgdesc='A wee tool to build color fonts'
arch=(any)
url="https://github.com/googlefonts/$_pkgname"
license=(Apache-2.0)
_pydeps=(cffsubr # optdepends of ufo2ft required for [cffsubr]
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
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
optdepends=('resvg: Support CBDT and sbix color fonts')
checkdepends=(python-pytest
              resvg)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('20ff54eacc4f5ddeaabfa67680fe60a30361b1d30ba6191cdded5cfce8837185')

prepare() {
	cd "$_archive"
	sed -i -e 's/^from ninja //' src/nanoemoji/ninja.py
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	# Skip tests that assume shell access to installed executable
	local deselected=(
		tests/extract_svgs_test.py
		tests/maximum_color_test.py
		tests/nanoemoji_test.py
	)
	PYTHONPATH=build/lib pytest ${deselected[@]/#/--deselect }
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
