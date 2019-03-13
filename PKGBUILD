# Maintainer: George Cave <gcave@stablecoder.ca>

pkgname=('newton-dynamics-git')
pkgver=3.13a.r303.gfb4c291c1
pkgrel=2
pkgdesc='A 3D physics library'
arch=('x86_64')
url='http://newtondynamics.com'
license=('custom:zlib')
makedepends=('clang' 'cmake')
conflicts=('newton-dynamics')
source=('git+https://github.com/MADEAPPS/newton-dynamics.git')
md5sums=('SKIP')

pkgver() {
    cd newton-dynamics
    git describe --long --tags | sed 's/newton-//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd newton-dynamics

    [[ -d build ]] && rm -rf build
    mkdir build && cd build

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_BUILD_TYPE=Release \
        -DNEWTON_BUILD_SHARED_LIBS=ON \
        -DNEWTON_BUILD_SANDBOX_DEMOS=OFF \
        -DNEWTON_WITH_AVX_PLUGIN=ON \
        -DNEWTON_WITH_AVX2_PLUGIN=ON \
        -DNEWTON_WITH_SSE4_PLUGIN=ON

    make
}

package() {
    cd newton-dynamics/build

    # install it
    make DESTDIR="${pkgdir}" install

    # install license
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}