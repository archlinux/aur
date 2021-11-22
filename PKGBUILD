# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=sameboy-dx-git
pkgver=0.1.0.r265.caf23e8+r1667.02f55d12
pkgrel=1
pkgdesc="A Qt-based interface of SameBoy, a free Game Boy and Game Boy Color emulator (git build)"
depends=('qt6-base')
makedepends=('cmake' 'git' 'ninja' 'python' 'rgbds')
arch=('x86_64')
url="https://github.com/SnowyMouse/sameboy-dx"
license=('GPL3')
source=("git+https://github.com/SnowyMouse/${pkgname%-git}.git"
        "git+https://github.com/LIJI32/SameBoy.git")
sha256sums=('SKIP'
            'SKIP')
provides=('sameboy-dx')
conflicts=('sameboy-dx')

pkgver() {
    cd "$srcdir"/${pkgname%-git}
    printf -v _dxver "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    cd "$srcdir"/SameBoy
    printf -v _sameboyver "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    printf "0.1.0.r%s+r%s" $_dxver $_sameboyver
}

prepare() {
    mkdir -p build
}

build() {
    cd "$srcdir"/build
    cmake ../${pkgname%-git} -G Ninja \
        -DBUILD_QT5_VERSION=off \
        -DSAMEBOY_SOURCE_DIR="${srcdir}"/SameBoy \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    ninja
}

package() {
    cd "$srcdir"/build
    ninja install
}
