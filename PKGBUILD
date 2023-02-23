# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

# Upstream test suite has a circular dependency (it uses fontparts which in
# turn depends on this library) and thus cannot be run by default without
# blocking installation until first building without tests.
BUILDENV+=(!check)

_pyname=fontPens
pkgname=python-${_pyname,,}
pkgver=0.2.4
pkgrel=4
pkgdesc='A collection of classes implementing the pen protocol for manipulating glyphs'
arch=(any)
url="https://github.com/robotools/$_pyname"
license=(BSD)
depends=(python-fonttools)
makedepends=(python-{build,installer,wheel}
            python-setuptools)
checkdepends=(python-fontparts
              python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('a6d9a14573b3450f3313d69523f9006028c21fc7aef5d35333b87aab7f2b41fd')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH=Lib pytest Lib
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}

