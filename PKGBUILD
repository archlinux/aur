# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=blackrenderer
pkgname=python-$_pyname
pkgver=0.8.2
pkgrel=1
pkgdesc='a Python-based renderer for OpenType COLR fonts, with multiple backends'
arch=(any)
url=https://github.com/BlackFoundryCom/black-renderer
license=(Apache-2.0)
_pydeps=(fonttools
         uharfbuzz)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
optdepends=('python-cairo: cairo backend'
            'python-numpy: skia backend'
            'python-skia: skia backend')
checkdepends=(python-cairo
              python-numpy
              python-skia
              python-pillow
              python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('13c97569c4b05c0e9f7c4e85af4f4a8ac9c3e76bd6a43e2c5307b4df25ac11c6')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	local deselected=(
		Tests/test_glyph_render.py # cairo based backend fails with floating point math problems
		Tests/test_mainprog.py # cli based tests fail because no entrypoint binary at this point
	)
	PYTHONPATH="$PWD/Lib" pytest ${deselected[@]/#/--deselect }
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
