# Author: mosra <mosra@centrum.cz>
pkgname=magnum-integration-git
pkgver=2020.06.r435.g915a1af
_imgui_pkgver=1.91.0
pkgrel=1
pkgdesc="Integration libraries for the Magnum C++11 graphics engine (Git version)"
arch=('i686' 'x86_64')
url="https://magnum.graphics"
license=('MIT')
depends=('magnum-git' 'magnum-extras-git' 'bullet' 'eigen' 'glm' 'yoga')
makedepends=('cmake' 'git' 'ninja')
provides=('magnum-integration')
conflicts=('magnum-integration')
source=("git+https://github.com/mosra/magnum-integration.git"
        "https://github.com/ocornut/imgui/archive/v${_imgui_pkgver}.tar.gz")
sha1sums=('SKIP'
          'be49bebb7967b23a9001ac39b05752db9b55d9db')

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
        -DMAGNUM_WITH_BULLETINTEGRATION=ON \
        -DMAGNUM_WITH_EIGENINTEGRATION=ON \
        -DMAGNUM_WITH_GLMINTEGRATION=ON \
        -DMAGNUM_WITH_DARTINTEGRATION=OFF \
        -DMAGNUM_WITH_IMGUIINTEGRATION=ON \
        -DMAGNUM_WITH_YOGAINTEGRATION=ON \
        -G Ninja
    ninja
}

package() {
    cd "$srcdir/build"
    DESTDIR="$pkgdir/" ninja install
}
