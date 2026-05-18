# Maintainer: Kherim Willems <aur@kher.im>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=apbs
pkgver=3.4.1
pkgrel=3
pkgdesc="Software for biomolecular electrostatics and solvation calculations"
arch=(x86_64)
url="http://www.poissonboltzmann.org/"
license=(custom)
depends=(python blas suitesparse lapack arpack eigen boost boost-libs metis superlu gtest)
makedepends=('cmake>=3.12' make git wget)
provides=(apbs)
conflicts=(apbs-bin)
source=("https://github.com/Electrostatics/apbs/archive/refs/tags/v${pkgver}.tar.gz"
        "vfetk-u_t-signature.patch")
sha256sums=('644e6246fd37c9dd4172fc7be1763337082ab8584dbcd53e738c831b62c89bb2'
            'SKIP')
options=(!makeflags !buildflags)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/vfetk-u_t-signature.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Create empty build directory
    mkdir -p build
    cd build
    rm -rf *

    # APBS compilation flags
    APBS_STATIC_BUILD=OFF
    BLA_VENDOR="OpenBLAS"
    BUILD_DOC=ON
    BUILD_TOOLS=ON
    INSTALL_DIR=/usr
    RELEASE_TYPE=Debug
    ENABLE_PYGBE=ON
    ENABLE_BEM=ON
    ENABLE_GEOFLOW=OFF
#    FETK_VERSION=57195e55351e04ce6ee0ef56a143c996a9aee7e2
    FETK_VERSION=main
    ENABLE_iAPBS=ON
    ENABLE_OPENMP=OFF
    ENABLE_PBAM=OFF
    ENABLE_PBSAM=OFF
    ENABLE_PYTHON=OFF
    ENABLE_TESTS=ON
    GET_NanoShaper=ON
    PYTHON_VERSION="3.14"

    # Configure and compile

    # Note: FETK compilation requires C17
    
    cmake \
        -DCMAKE_C_STANDARD=17 \
        -DCMAKE_C_STANDARD_REQUIRED=ON \
        -DCMAKE_C_EXTENSIONS=ON \
        -DCMAKE_C_FLAGS="${CFLAGS} -Wno-error=implicit-int -Wno-error=implicit-function-declaration" \
        -DCMAKE_INSTALL_INCLUDEDIR="include" \
        -DBUILD_DOC=${BUILD_DOC} \
        -DAPBS_STATIC_BUILD=${APBS_STATIC_BUILD}  \
        -DBUILD_TOOLS=${BUILD_TOOLS} \
        -DCMAKE_BUILD_TYPE=$RELEASE_TYPE \
        -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
        -DENABLE_PYGBE=${ENABLE_PYGBE} \
        -DENABLE_BEM=${ENABLE_BEM} \
        -DENABLE_iAPBS=${ENABLE_iAPBS} \
        -DENABLE_GEOFLOW=${ENABLE_GEOFLOW} \
        -DENABLE_OPENMP=${ENABLE_OPENMP} \
        -DENABLE_PBAM=${ENABLE_PBAM} \
        -DENABLE_PBSAM=${ENABLE_PBSAM} \
        -DENABLE_PYTHON=${ENABLE_PYTHON} \
        -DENABLE_TESTS=${ENABLE_TESTS} \
        -DFETK_VERSION=${FETK_VERSION} \
        -DGET_NanoShaper=${GET_NanoShaper} \
        -DPYTHON_VERSION="${PYTHON_VERSION}" \
        ..

    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    # install base components
    make DESTDIR="$pkgdir" install

    # install license
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # cleanup conflicting symlinks
    cd "${pkgdir}/usr/lib"

    rm -f libamd.so libblas.so libsuperlu.so libumfpack.so

    # Remove conflicting gtest headers
    cd "${pkgdir}/usr/include"
    rm -rf gmock gtest
    cd "${pkgdir}/usr/lib"
    rm -rf cmake pkgconfig
    rm -rf libgmock.so libgmock_main.so libgtest.so libgtest_main.so
}
