# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

BUILDENV+=(!check)

pkgname=python-compreffor
_pyname=${pkgname#python-}
pkgver=0.5.5
pkgrel=1
pkgdesc='A CFF table suroutinizer for FontTools'
arch=(x86_64)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
depends=(python
         python-fonttools)
makedepends=(cython
             python-{build,installer,wheel}
             python-setuptools-git-ls-files
             python-setuptools-scm)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('f4d3262090bc4388510bf1f64bb3ab82859243d49120f1f11ef6693eb3c2bc7a')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive/src/python"
	local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	export PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_pyver"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
