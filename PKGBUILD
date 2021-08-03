# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: William Turner <willtur.will@gmail.com>

_pyname=booleanOperations
pkgname=python-${_pyname,,}
pkgver=0.9.0
pkgrel=2
pkgdesc='Boolean operations on paths'
arch=(any)
url="https://github.com/typemytype/$_pyname"
license=(MIT)
_pydeps=(pyclipper
         fonttools)
depends=(python
         "${_pydeps[@]/#/python-}")
checkdepends=(python-defcon
              python-fontpens
              python-pytest)
makedepends=(python-setuptools-scm)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('8cfa821c32ad374fa120d6b2e0b444ebeac57c91e6631528645fa19ac2a281b8')

prepare() {
	cd "$_archive"
    # Upstream PR: https://github.com/typemytype/booleanOperations/pull/63
    sed -i -e '/wheel$/d' setup.cfg
}

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
