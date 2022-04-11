# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=blackrenderer
pkgname=python-$_pyname
pkgver=0.5.0
pkgrel=1
pkgdesc='a Python-based renderer for OpenType COLR fonts, with multiple backends'
arch=(any)
url=https://github.com/BlackFoundryCom/black-renderer
license=(Apache)
_pydeps=(fonttools
         uharfbuzz)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer}
             python-setuptools-scm
             python-wheel)
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
sha256sums=('ebded44c93b35d4109ed6067f5af21d6e74fd456b718fcef2a73a698ad46d2e4')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	# cairo based backend fails with floating point math problems
	# cli based tests fail because no entrypoint binary at this point
	PYTHONPATH="$PWD/Lib" pytest \
		--deselect Tests/test_glyph_render.py \
		--deselect Tests/test_mainprog.py
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
