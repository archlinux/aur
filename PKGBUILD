# Maintainer: Caleb Maclennan <caleb@aleque.com>

pkgname=flowify
pkgver=0.1.0
pkgrel=3
pkgdesc='Turn a font into a flow font'
arch=(any)
url="https://github.com/googlefonts/$pkgname"
license=(Apache-2.0)
_pydeps=(fontfeatures
         inflect
         numpy
         ufo2ft
         ufolib2)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-poetry-core)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('d884e5132b319b0f67fc86c4555e07a3a93351c95c8b37b52bfd4cecdaf297be')

prepare() {
	cd "$_archive"
	mv flowify/{__main__,main}.py
	sed -i \
		-e '/poetry/s/>=0.12/-core/' \
		-e '/build-backend/s/masonry/core.masonry/' \
		pyproject.toml
}

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
