# Maintainer: Jörg Behrmann <behrmann@physik.fu-berlin.de>
pkgname=python-kwant-git
pkgver=v1.3.0a0.r172.g3bb749e
pkgrel=1
pkgdesc="Python package for numerical calculations on tight-binding models with a strong focus on quantum transport"
arch=('any')
url="http://kwant-project.org/"
license=('BSD')
conflicts=('python-kwant')
provides=('python-kwant')
depends=(python python-scipy lapack blas python-tinyarray-git)
optdepends=(
	'python-matplotlib: needed for plotting support and the tutorial'
	'mumps: a sparse linear algebra library for speed up and memory usage reduction (use AUR mumps-seq-shared or any other built as shared library)'
)
checkdepends=(python-pytest)
source=('kwant::git+https://gitlab.kwant-project.org/kwant/kwant.git'
        'build.conf')
sha256sums=('SKIP'
            '32bef0aa0a6f329102c5244d856d4b50796c601b1d25e7c708e0e9bdf54425c7')
validpgpkeys=('52299057FAD799653C4F088AC3F147F5980F3535')

# Comment the prepare function if you want to build _without_ mumps support.
# This is discouraged because without the incurred performance penalty no
# serious calculations can be done in a reasonable time.
prepare() {
    cp "../build.conf" "$srcdir/kwant/build.conf"
}

build() {
    cd "$srcdir/kwant"
    python setup.py build
}

package() {
    cd "$srcdir/kwant"
    python setup.py install --skip-build --root="$pkgdir"

    # Install license
    install -D -m644 "${srcdir}/kwant/LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst" || return 1
}

check() {
    cd  "$srcdir/kwant"
    python setup.py test
}
