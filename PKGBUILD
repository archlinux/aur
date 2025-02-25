# Maintainer: Jörg Behrmann <behrmann@physik.fu-berlin.de>
pkgname=python-kwant-git
pkgver=v1.5.0.r3.g0d679b3e
pkgrel=1
pkgdesc="Python package for numerical calculations on tight-binding models with a strong focus on quantum transport"
arch=('any')
url="http://kwant-project.org/"
license=('BSD')
conflicts=('python-kwant')
provides=('python-kwant')
depends=(python python-numpy python-scipy lapack blas python-tinyarray-git)
makedepdens=(cython python-setuptools)
optdepends=(
    'python-qsymm: finding symmetries of Hamiltonians'
    'python-matplotlib: needed for plotting support and the tutorial'
    'python-plotly: additional plotting features'
    'python-sympy: needed for the kwant.continuum submodule'
    'mumps: a sparse linear algebra library for speed up and memory usage reduction'
)
checkdepends=(python-pytest)
source=('kwant::git+https://gitlab.kwant-project.org/kwant/kwant.git')
sha256sums=('SKIP')
validpgpkeys=('52299057FAD799653C4F088AC3F147F5980F3535')

pkgver() {
    cd "kwant"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# The prepare function should also stage a build.conf into
# $srcdir/kwant-$pkgver, since without mumps, kwant is far too slow, but there
# is no shared library version of mumps on the AUR
prepare() {
    cd "$srcdir/kwant"
    git -C "${srcdir}/kwant" clean -dfx
}

build() {
    cd "$srcdir/kwant"
    python setup.py build --cython
}

check() {
    # The tests cannot be run from the build directory, due to circular imports
    :
    # cd  "$srcdir/kwant-$pkgver"
    # local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    # PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package() {
    cd "$srcdir/kwant"
    python setup.py install --root="$pkgdir/" --optimize=1

    # Install license
    install -D -m644 "${srcdir}/kwant/LICENSE.rst" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst" || \
        return 1
}

