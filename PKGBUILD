# Author: mosra <mosra@centrum.cz>
pkgname=magnum-integration-git
pkgver=2019.10.r62.gd7a931b
_imgui_pkgver=1.76
pkgrel=1
pkgdesc="Integration libraries for the Magnum C++11/C++14 graphics engine (Git version)"
arch=('i686' 'x86_64')
url="https://magnum.graphics"
license=('MIT')
depends=('magnum-git' 'bullet' 'eigen' 'glm')
makedepends=('cmake' 'git' 'ninja')
provides=('magnum-integration')
conflicts=('magnum-integration')
source=("git+git://github.com/mosra/magnum-integration.git"
        "https://github.com/ocornut/imgui/archive/v${_imgui_pkgver}.tar.gz")
sha1sums=('SKIP'
          '6d5d7688197e8002d916da8ddee81bfdd471176d')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    # Bundle ImGui
    ln -sf $srcdir/imgui-${_imgui_pkgver}/ "$srcdir/${pkgname%-git}/src/MagnumExternal/ImGui"

    cmake "$srcdir/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_BULLET=ON \
        -DWITH_EIGEN=ON \
        -DWITH_GLM=ON \
        -DWITH_DART=OFF \
        -DWITH_IMGUI=ON \
        -G Ninja
    ninja
}

package() {
    cd "$srcdir/build"
    DESTDIR="$pkgdir/" ninja install
}
