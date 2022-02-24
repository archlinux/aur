# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=superdux-git
pkgver=0.1.0.r357.b5fa7ef+r1798.8073e3d3
pkgrel=1
pkgdesc="A Qt-based interface of SameBoy, An accuracy-focused Game Boy/Game Boy Color emulator (git build)"
depends=('qt6-base')
makedepends=('cmake' 'git' 'ninja' 'python' 'rgbds')
arch=('x86_64')
url="https://github.com/SnowyMouse/superdux"
license=('GPL3')
source=("git+https://github.com/SnowyMouse/${pkgname%-git}.git"
        "git+https://github.com/LIJI32/SameBoy.git")
sha256sums=('SKIP'
            'SKIP')
provides=('superdux')
conflicts=('kamonegi' 'superdux')

pkgver() {
    cd "$srcdir"/${pkgname%-git}
    printf -v _superduxver "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    cd "$srcdir"/SameBoy
    printf -v _sameboyver "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    printf "0.1.0.r%s+r%s" $_superduxver $_sameboyver
}

prepare() {
    mkdir -p build
}

build() {
    cd "$srcdir"/build
    cmake ../${pkgname%-git} -G Ninja \
        -DSAMEBOY_SOURCE_DIR="${srcdir}"/SameBoy \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    ninja
}

package() {
    cd "$srcdir"/build
    ninja install
}
