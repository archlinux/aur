# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=openstep_plist
pkgname=python-${_pyname/_/-}
pkgver=0.3.1
pkgrel=1
pkgdesc='OpenStep plist parser and writer written in Cython'
arch=(x86_64)
url="https://github.com/fonttools/$_pyname"
license=(MIT)
depends=(python)
makedepends=(cython
             python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('02eead68efb9eceb2de2c95397073ce80fc89855d97ab65169bd92fc4368e4f2')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	export PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_pyver"
	python -m unittest discover
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
