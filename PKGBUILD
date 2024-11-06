# Maintainer: Alex Grabowski <hurufu+aur@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Leonidas <marek@xivilization.net>

pkgname=yap
pkgver=7.6.0
pkgrel=1
pkgdesc='A high-performance Prolog compiler'
url='http://www.dcc.fc.up.pt/~vsc/yap/'
license=(LGPL-3.0-only)
arch=(i686 x86_64)
depends=('gmp' 'unixodbc' 'libmariadbclient')
makedepends=(
    texi2html
    texinfo
    jdk7-openjdk
    doxygen
    ninja
)
optdepends=(
    'python3: For using Python from YAP'
    'gecode: For contstraints solving'
    'cudd: For Problog'
    'java-runtime-headless: Java Interface Library JPL'
    'r: For R bindings'
    openmpi
    swig
)
source=(git+https://github.com/vscosta/yap.git#commit=d60153e2727ccfd21eaad1cdc10d1788b003b927)
sha256sums=(SKIP)

prepare() {
    # Unset executable bit on all sources, so yap-debug package will contain files with correct permissions
    find "$srcdir" \( -name '*.c' -o -name '*.h' -o -name '*.cc' \) -type f -exec chmod a-x '{}' '+'
}

build() {
    cd yap
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
    make
    python -m build --wheel --no-isolation packages/python/yap4py
}

package() {
    cd yap/build
    make DESTDIR="$pkgdir" install
    python -m installer --destdir="$pkgdir" packages/python/yap4py/dist/yap4py-$pkgver-*.whl
}
