# Maintainer: Caleb Maclennan <caleb@alerque.com>

BUILDENV+=(!check)

pkgname=python-dvc-render
_pkgname=${pkgname#python-}
pkgver=0.3.0
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
sha256sums=('dc13ab3c3e7dc225019e60fb2d3b2501ff3f402ec64b66b99f2dbc95306aa4c8')

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
