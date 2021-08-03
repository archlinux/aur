# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-ufo2ft
_pyname=${pkgname#python-}
pkgver=2.24.0
pkgrel=1
pkgdesc='A bridge from UFOs to FontTools objects'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(MIT)
_pydeps=(booleanoperations
         cffsubr
         cu2qu
         defcon
         'fonttools>=4.26.1'
         fs) # for fonttools[ufo]
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-setuptools-scm)
checkdepends=(python-compreffor
              python-pytest
              python-skia-pathops)
optdepends=(python-compreffor
            'python-lxml: enables faster UFO parsing'
            python-skia-pathops)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('50ae2ab94329aa7749a29521cfb128a685291ada7b7038e5e0b4649bb2617c1e')

build() {
	cd "$_archive"
	export PYTHONHASHSEED=0
	python setup.py build
}

check() {
	cd "$_archive"
	PYTHONPATH=Lib pytest tests
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
