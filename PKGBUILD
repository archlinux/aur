# Maintainer: loathingkernel <username at gmail dot com>

pkgname=python-pybcj
_pyname=${pkgname#python-}
pkgver=0.5.2
pkgrel=2
pkgdesc='BCJ(Branch-Call-Jump) filter for python'
arch=(x86_64)
url="https://github.com/miurahr/$_pyname"
license=(LGPL)
depends=(python)
makedepends=(python-{build,installer}
             python-setuptools-scm
             python-wheel)
checkdepends=(python-pytest
              python-hypothesis)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('050e7bf780b82b0c6ba4368c4a78953a1cf5922cef50e8b251fb8b87f0483ad7')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	local _pyver=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
	export PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_pyver"
	python -m pytest -rsx
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
