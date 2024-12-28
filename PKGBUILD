# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=openstep_plist
pkgname=python-${_pyname/_/-}
pkgver=0.4.0
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
sha256sums=('453a56cdf534c6f42d24934d2ed7f95bc77c3d1a8acbc1881a4aa061a7d601a2')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	export PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_pyver"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
