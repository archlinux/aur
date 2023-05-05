# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=drawbot-skia
pkgver=0.4.8
pkgrel=4
pkgdesc='A Python package implementing a subset of the DrawBot API using Skia as a backend'
arch=(any)
url="https://github.com/justvanrossum/$pkgname"
license=(MIT)
_pydeps=(bidi
         fonttools
         'skia>=87.2'
         'skia-pathops>=0.6.0.post2'
         'uharfbuzz>=0.16.1'
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
sha256sums=('61d4169b10fca6cea40f4d97898c36de0274c918923582ef0eef5767d6f7c161')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="$PWD/build/lib"
	pytest tests \
		-k 'not test_saveImage_mp4_codec and not test_runner_app'
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
