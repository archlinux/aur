# Maintainer: loathingkernel <username at gmail dot com>

pkgname=python-pybcj
_pyname=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
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
sha256sums=('9013522cc4a51a966bd7f430df9bf23693a5235bb36c7916cbe13f76aca62a0f')

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
