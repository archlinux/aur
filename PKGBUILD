# Maintainer: Jörg Behrmann <behrmann@physik.fu-berlin.de>
pkgname=python-tinyarray-git
pkgver=v1.2.4.r1.g247181d
pkgrel=1
pkgdesc="Similar to NumPy arrays, but optimized for small sizes"
arch=('any')
url="http://git.kwant-project.org/tinyarray/about/"
license=('BSD')
conflicts=('python-tinyarray')
provides=('python-tinyarray')
depends=(python)
makedepends=(python-setuptools git)
checkdepends=(python-pytest python-numpy)
source=('tinyarray::git+https://gitlab.kwant-project.org/kwant/tinyarray.git')
sha256sums=('SKIP')

prepare() {
    git -C "${srcdir}/tinyarray" clean -dfx
}

pkgver() {
    cd "tinyarray"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/tinyarray"
    python setup.py build
}

check() {
    cd "$srcdir/tinyarray"
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package() {
    cd "$srcdir/tinyarray"
    python setup.py install --root="$pkgdir/" --optimize=1

    # Install license
    install -D -m644 "${srcdir}/tinyarray/LICENSE.rst" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst" || \
        return 1
}

