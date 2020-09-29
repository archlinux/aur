# Maintainer: dwuggh <dwuggh at gmail dot com>
# Contributor: dwuggh <dwuggh at gmail dot com>

################################################################################
# Possible value: "ON" and "OFF"


# query whether the system has cuda library. If does, compile along with it and a
# GPU backend could be used when performing quantum computation
FIND_CUDA=ON

# the chemistry simulation library
USE_CHEMIQ=ON

# pyqpanda library for python
USE_PYQPANDA=ON

# jobs for make
QPANDA_JOBS=12

################################################################################

pkgname="qpanda-2-git"
pkgdesc="QPanda 2 is an open source quantum computing framework developed by OriginQC that can be used to build, run, and optimize quantum algorithms."

pkgver=v2.1.4.r0.g1092d38
arch=('x86_64' )
url="https://github.com/OriginQ/qpanda-2"
license=('Apache2' )
pkgrel=1
depends=('python' )
optdepends=('cuda' )
makedepends=('git' 'cmake' 'python-setuptools' )
sha512sums=('SKIP' )

source=(
    'QPanda::git+https://github.com/OriginQ/qpanda-2'
)

pkgver() {
    cd "${srcdir}/QPanda"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/QPanda"
}

build() {
    cd "${srcdir}/QPanda"
    mkdir -p build && cd build
    cmake ..                                   \
        -DCMAKE_INSTALL_PREFIX='/usr'          \
	-DFIND_CUDA=${FIND_CUDA}               \
	-DUSE_CHEMIQ=${USE_CHEMIQ}             \
	-DUSE_PYQPANDA=${USE_PYQPANDA}
    make -j${QPANDA_JOBS}

    # pyQPanda
    cd "${srcdir}/QPanda/pyQPanda"
    python setup.py build
    # manual copy .so library
    cp ../build/lib/pyQPanda*.so ./build/lib/pyqpanda
}

package() {
    cd "${srcdir}/QPanda/build"
    # make DESTDIR=${pkgdir} install pyQPanda
    make DESTDIR=${pkgdir} install
    install -D -m644 ${srcdir}/QPanda/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    # pyQPanda
    cd "${srcdir}/QPanda/pyQPanda"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
