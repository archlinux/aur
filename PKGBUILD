# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=mcsema
pkgver=3.0.12
pkgrel=2
pkgdesc="Framework for lifting program binaries to LLVM bitcode"
arch=('x86_64')
url="https://github.com/lifting-bits/mcsema"
license=('AGPL3')
depends=('cxx-common=0.0.14' 'remill' 'anvill' 'python' 'python-protobuf'
         'ncurses' 'libunwind' 'zlib')
makedepends=('python-setuptools')
source=("https://github.com/lifting-bits/mcsema/archive/v${pkgver}.tar.gz")
sha256sums=('41ff3a44c2361101408244b47a23605e34b8f94cb3315b73260aa647ef44a516')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i tools/setup_launcher_py{2,3}.sh \
        -e "s|\(setup\.py install.*--prefix=[^ ]*\)|\1 --root='$pkgdir' --optimize=1|"
}

build() {
    export TRAILOFBITS_LIBRARIES="/opt/cxx-common/libraries"
    export PATH="${TRAILOFBITS_LIBRARIES}/cmake/bin:${TRAILOFBITS_LIBRARIES}/llvm/bin:${PATH}"

    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build && cd build
    "${TRAILOFBITS_LIBRARIES}/cmake/bin/cmake" \
        -DCMAKE_C_COMPILER="${TRAILOFBITS_LIBRARIES}/llvm/bin/clang" \
        -DCMAKE_CXX_COMPILER="${TRAILOFBITS_LIBRARIES}/llvm/bin/clang++" \
        -DMCSEMA_INSTALL_PYTHON2_LIBS=OFF \
        -DMCSEMA_INSTALL_PYTHON3_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_VERBOSE_MAKEFILE=True \
        "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="${pkgdir}" install
}

# vim: set sw=4 ts=4 et:
