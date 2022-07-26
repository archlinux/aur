# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=superdux-git
pkgver=0.1.0.r360.244c0f0+r1952.859ff795
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
conflicts=('superdux')

pkgver() {
    cd "$srcdir"/${pkgname%-git}
    printf -v _superduxver "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    cd "$srcdir"/SameBoy
    printf -v _sameboyver "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    printf "0.1.0.r%s+r%s" $_superduxver $_sameboyver
}

build() {
    cmake -S ${pkgname%-git} -B build -G Ninja \
        -DSAMEBOY_SOURCE_DIR="${srcdir}"/SameBoy \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"

    cmake --build build
}

package() {
	cmake --install build
}
