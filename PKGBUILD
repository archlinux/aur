# Maintainer: Jörg Behrmann <behrmann@physik.fu-berlin.de>
# Contributor: Max Schlemmer <max.schlemmer@gmail.com>
pkgname=python-tinyarray
pkgver=1.2.4
pkgrel=1
pkgdesc="Similar to NumPy arrays, but optimized for small sizes"
arch=('any')
url="http://git.kwant-project.org/tinyarray/about/"
license=('BSD')
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-numpy)
source=(http://downloads.kwant-project.org/tinyarray/tinyarray-$pkgver.tar.gz
		http://downloads.kwant-project.org/tinyarray/tinyarray-$pkgver.tar.gz.asc)
sha256sums=('ecd3428fd8a48b61fc5f0a413ede03e27db3a1dd53fcd49e24a36d11a8a29aba'
            'SKIP')
validpgpkeys=('52299057FAD799653C4F088AC3F147F5980F3535')

build() {
    cd "$srcdir/tinyarray-$pkgver"
    python setup.py build
}

check() {
    cd "$srcdir/tinyarray-$pkgver"
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package() {
    cd "$srcdir/tinyarray-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    # Install license
    install -D -m644 "${srcdir}/tinyarray-${pkgver}/LICENSE.rst" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst" || \
        return 1
}
