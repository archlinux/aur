# Maintainer: Luke Labrie-Cleary <luke.cleary@copenhagenatomics.com>
pkgname=python-pymoab
pkgver=5.5.1.r643.g84f4f69e0
pkgrel=1
pkgdesc="python bindings for the MOAB mesh-oriented database"
arch=('x86_64')
url="https://bitbucket.org/fathomteam/moab/src/master/"
license=('BSD')

depends=(
   python
   moab-git
   python-numpy
)

optdepends=(
  python-pytest
)

makedepends=(
	git
	python
	python-build
	python-installer
	python-wheel
  python-scikit-build-core
)

_name="pymoab"
provides=("${_name%-pkgver}")
source=("pymoab::git+https://bitbucket.org/fathomteam/moab.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_name}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_name}"
    python \
      -m build \
      --wheel \
      --no-isolation
  }

package() {
    cd "$srcdir/${_name}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # make git repo available in opt 
    cd "$srcdir"
    mkdir $pkgdir/opt
    cp -r "$_name" $pkgdir/opt
}

