# Maintainer: Jörg Behrmann <behrmann@physik.fu-berlin.de>
# Contributor: Max Schlemmer <max.schlemmer@gmail.com>
pkgname=python-kwant
pkgver=1.5.0
pkgrel=1
pkgdesc="Python package for numerical calculations on tight-binding models with a strong focus on quantum transport"
arch=('any')
url="http://kwant-project.org/"
license=('BSD')
depends=(python python-numpy python-scipy lapack blas python-tinyarray)
makedepdens=(cython python-setuptools)
optdepends=(
    'python-qsymm: finding symmetries of Hamiltonians'
    'python-matplotlib: needed for plotting support and the tutorial'
    'python-plotly: additional plotting features'
    'python-sympy: needed for the kwant.continuum submodule'
    'mumps: a sparse linear algebra library for speed up and memory usage reduction'
)
checkdepends=(python-pytest)
source=(http://downloads.kwant-project.org/kwant/kwant-$pkgver.tar.gz)
sha256sums=('9859451d0e20364ce30777a5dd7ecb7a06956822612935a408ed4d81e5c8321b')

# The prepare function should also stage a build.conf into
# $srcdir/kwant-$pkgver, since without mumps, kwant is far too slow, but there
# is no shared library version of mumps on the AUR
prepare() {
    cd "$srcdir/kwant-$pkgver"
    # The bundled cythonized files may be incompatible with the current Python version
    find . -name \*.c -delete
}

build() {
    cd "$srcdir/kwant-$pkgver"
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
    cd "$srcdir/kwant-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1

    # Install license
    install -D -m644 "${srcdir}/kwant-${pkgver}/LICENSE.rst" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst" || \
        return 1
}
