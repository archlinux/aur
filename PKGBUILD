# Maintainer: Fabian Köhler <fkoehler@googlemail.com>
pkgname=evernus
pkgver=1.46
pkgrel=1
pkgdesc="EVE Online next generation trade and market helper"
arch=("any")
url="http://evernus.com"
license=("GPL3" "LGPL3" "Boost")
groups=()
depends=("boost" "boost-libs" "qt5-base" "qt5-multimedia" "qt5-webengine" "qt5-xmlpatterns")
makedepends=("cmake" "clang")
provides=("evernus")

source=(
    "${pkgname}-${pkgver}.tar.bz2::https://bitbucket.org/krojew/evernus/get/${pkgver}-release.tar.bz2"
    CMakeLists.patch
)
sha512sums=(
    "4d1319cc250294da11650f10af3117168a342bb20891133168b70187da60ce75ff7f7d3687a1ee8930339d3fef2c28f74d6b7d31df53627c5594ff2e4346d147"
    "2ae432f394bf1bc95aee86929b91b7c08504d3f7e3e5c1a68b98fa78ae31aae0a1f2328465956ac059046d14fdf9e941c525af61c8c666a677f22f93946abb66"
)

prepare() {
    pwd
    patch -uN krojew-evernus-*/CMakeLists.txt ../CMakeLists.patch
}

build() {
    mkdir build
    cd build
    cmake ../krojew-evernus-*        \
        -DCMAKE_BUILD_TYPE=Release   \
        -DCMAKE_INSTALL_PREFIX=/usr  \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_C_COMPILER=clang
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install

    install -Dm644 ../krojew-evernus-*/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
