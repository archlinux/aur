# Maintainer: George Cave <gcave@stablecoder.ca>

pkgname=('newton-dynamics-git')
pkgver=3.13a.r224.g897a23cb6
pkgrel=1
pkgdesc="A 3D physics library"
arch=('x86_64')
url="http://newtondynamics.com"
license=('custom:zlib')
makedepends=('cmake')
conflicts=('newton-dynamics')
license=('zlib')
source=("git+https://github.com/MADEAPPS/newton-dynamics.git")
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
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=ON \
        -DNEWTON_BUILD_SHARED_LIBS=ON \
        -DNEWTON_BUILD_SANDBOX_DEMOS=OFF

    make
}

package() {
    cd newton-dynamics/build

    # install it
    make DESTDIR="${pkgdir}" install

    # install license
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}