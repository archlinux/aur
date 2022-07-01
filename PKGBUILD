# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=superdux-git
pkgver=0.1.0.r359.d1cadf5+r1875.1b38e8c9
pkgrel=1
pkgdesc="A Qt-based interface of SameBoy, An accuracy-focused Game Boy/Game Boy Color emulator (git build)"
depends=('qt6-base')
makedepends=('cmake' 'git' 'ninja' 'python' 'rgbds')
arch=('x86_64')
url="https://github.com/SnowyMouse/superdux"
license=('GPL3')
source=("git+https://github.com/SnowyMouse/${pkgname%-git}.git"
        "git+https://github.com/LIJI32/SameBoy.git"
        'fix_on_vblank_args.patch')
sha256sums=('SKIP'
            'SKIP'
            'bc7795e263452d7e215986fd11e6aa47f967cdb7acce5b9e2c7de5e5e66e553a')
provides=('superdux')
conflicts=('superdux')

pkgver() {
    cd "$srcdir"/${pkgname%-git}
    printf -v _superduxver "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    cd "$srcdir"/SameBoy
    printf -v _sameboyver "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    printf "0.1.0.r%s+r%s" $_superduxver $_sameboyver
}

prepare() {
    mkdir -p build
    cd ${pkgname%-git}
    patch -Np1 <../fix_on_vblank_args.patch
}

build() {
    cd "$srcdir"/build
    cmake ../${pkgname%-git} -G Ninja \
        -DSAMEBOY_SOURCE_DIR="${srcdir}"/SameBoy \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
    ninja
}

package() {
    cd "${srcdir}"/build
    ninja install
}
