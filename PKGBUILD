# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=drawbot-skia
pkgver=0.5.1
pkgrel=1
pkgdesc='A Python package implementing a subset of the DrawBot API using Skia as a backend'
arch=(any)
url="https://github.com/justvanrossum/$pkgname"
license=(MIT)
_pydeps=(bidi
         blackrenderer
         fonttools
         skia
         skia-pathops
         uharfbuzz
         unicodedata2) # for fonttools[unicode]
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
optdepends=('python-pyffmpeg: for video features')
checkdepends=(python-pyffmpeg
              python-numpy
              python-pillow
              python-pytest
              python-six)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('5a59739466af144552af68dc41bbf2cd66bc216042edb434e7ec738d00f92403')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="$PWD/build/lib"
	local deselected=(
		test_saveImage_mp4_codec
		test_runner_app
	)
	pytest tests ${deselected[@]/#/--deselect }
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
