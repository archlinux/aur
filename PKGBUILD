# Maintainer: Andrew Salad <sl4shed@proton.me>
pkgname=sdl3_gfx-git
pkgver=r21.0bbee98
pkgrel=1
epoch=
pkgdesc="Graphics drawing primitives and other support functions wrapped up in an add-on, C-based library for the Simple Direct Media (SDL) cross-platform API layer. "
arch=(x86_64)
url="https://github.com/sabdul-khabir/SDL3_gfx"
license=('Zlib')
groups=()
depends=(sdl3)
makedepends=(git cmake)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://github.com/sabdul-khabir/SDL3_gfx.git"
        "cmake-module.patch::https://patch-diff.githubusercontent.com/raw/sabdul-khabir/SDL3_gfx/pull/22.patch")
noextract=()
sha256sums=('SKIP'
            'e0d3a84262a4892554277184429205b91e8e1f2f2d0fe31150504f9c5a427fc8')
validpgpkeys=()

pkgver() {
        cd "$srcdir/${pkgname%-git}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        cd "$srcdir/${pkgname%-git}"
        git apply "$srcdir/cmake-module.patch"
}

build() {
        cmake -S "$srcdir/${pkgname%-git}" -B build \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DCMAKE_BUILD_TYPE=Release

        cmake --build build
}

package() {
        DESTDIR="$pkgdir" cmake --install build
        install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname ${pkgname%-git}/COPYING
}
