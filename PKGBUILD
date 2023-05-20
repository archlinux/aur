# Maintainer: Caleb Maclennan <caleb@alerque.com>

BUILDENV+=(!check)

pkgname=python-dvc-render
_pkgname=${pkgname#python-}
pkgver=0.5.3
pkgrel=1
pkgdesc='Library for rendering DVC plots'
arch=(any)
license=(Apache)
url="https://github.com/iterative/$_pkgname"
_pydeps=(funcy
         tabulate)
depends=(python
        "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(mypy
              python-pytest
              python-pytest-sugar
              python-pytest-mock
              python-pylint)
_archive=("$_pkgname-$pkgver")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('009dc09db44e416285c719324d8e101f675a58d7d846822a9faef307df22c7f2')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	local _pyver=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
	PYTHONPATH="$PWD:$PWD/build/lib.linux-$CARCH-${_pyver}"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
