# Maintainer: George Cave <gcave@stablecoder.ca>

pkgname=('newton-dynamics-git')
pkgver=v3.14c.r777.g2ed113b84
pkgrel=1
pkgdesc='A 3D physics library'
arch=('x86_64')
url='http://newtondynamics.com'
license=('custom:zlib')
makedepends=('cmake' 'git')
conflicts=('newton-dynamics')
source=('git+https://github.com/MADEAPPS/newton-dynamics.git')
md5sums=('SKIP')

pkgver() {
    cd newton-dynamics
    git describe --long --tags | sed 's/newton-//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake newton-dynamics/newton-3.14 -Bnewton-dynamics/newton-3.14/build \
        -DCMAKE_BUILD_TYPE=Release \
        -DNEWTON_BUILD_SHARED_LIBS=ON \
        -DNEWTON_BUILD_SANDBOX_DEMOS=OFF \
        -DNEWTON_WITH_AVX_PLUGIN=ON \
        -DNEWTON_WITH_AVX2_PLUGIN=ON \
        -DNEWTON_WITH_SSE4_PLUGIN=ON

    make -C newton-dynamics/newton-3.14/build
}

package() {
    # install it
    make -C newton-dynamics/newton-3.14/build DESTDIR="${pkgdir}" install

    # install license
    install -Dm644 newton-dynamics/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
