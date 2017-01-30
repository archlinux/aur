# Maintainer: Jörg Behrmann <behrmann@physik.fu-berlin.de>
# Contributor: Max Schlemmer <max.schlemmer@gmail.com>
pkgname=python-kwant
pkgver=1.2.2
pkgrel=3
pkgdesc="Python package for numerical calculations on tight-binding models with a strong focus on quantum transport"
arch=('any')
url="http://kwant-project.org/"
license=('BSD')
depends=(python python-scipy lapack blas python-tinyarray)
optdepends=(
	'python-matplotlib: needed for plotting support and the tutorial'
	'mumps: a sparse linear algebra library for speed up and memory usage reduction (use AUR mumps-seq-shared or any other built as shared library)'
)
checkdepends=(python-nose)
source=(
	http://downloads.kwant-project.org/kwant/kwant-$pkgver.tar.gz
	http://downloads.kwant-project.org/kwant/kwant-$pkgver.tar.gz.asc
)
sha1sums=('7a2aa07492c3aee8930fd7de402e62fea84f3eca'
          'SKIP')
validpgpkeys=('52299057FAD799653C4F088AC3F147F5980F3535')

# Comment the prepare function if you want to build _without_ mumps support.
# This is discouraged because without the incurred performance penalty no
# serious calculations can be done in a reasonable time.
prepare() {
    cp "../build.conf" "$srcdir/kwant-$pkgver/build.conf"
    cp "../setup.py" "$srcdir/kwant-$pkgver/setup.py"
}

build() {
    cd "$srcdir/kwant-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/kwant-$pkgver"
    python setup.py install --skip-build -O1 --root="$pkgdir" --optimize=1

    # Install license
    install -D -m644 "${srcdir}/kwant-${pkgver}/LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst" || return 1
}

check() {
    cd  "$srcdir/kwant-$pkgver"
    python setup.py test
}
