# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=libretro-mgba-git
pkgver=0.10.0.r7169.b5e94b0ab
pkgrel=1
pkgdesc='A Nintendo Gameboy Advance Emulator - Libretro Core'
arch=('x86_64')
url="https://mgba.io/"
license=('custom:MPL2')
groups=('libretro-unstable')
depends=('libretro-core-info')
makedepends=('git' 'cmake' 'mesa' 'ninja')
conflicts=('libretro-mgba')
provides=('libretro-mgba')
source=("git+https://github.com/mgba-emu/mgba.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir"/mgba
    for v in LIB_VERSION_MAJOR \
             LIB_VERSION_MINOR \
             LIB_VERSION_PATCH; do
        ver=$(grep -m 1 $v version.cmake | grep -o '[0-9]' | tr -d '\n')
        printf -v "$v" "%s" "$ver"
    done

    printf "%s.%s.%s.r%s.%s" \
        $LIB_VERSION_MAJOR \
        $LIB_VERSION_MINOR \
        $LIB_VERSION_PATCH \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake "$srcdir"/mgba -G Ninja \
        -DBUILD_LIBRETRO=ON \
        -DBUILD_QT=OFF \
        -DBUILD_SDL=OFF \
        -DBUILD_SHARED=OFF \
        -DBUILD_STATIC=ON
    ninja
}

package() {
    install -Dm644 "$srcdir"/build/mgba_libretro.so "$pkgdir"/usr/lib/libretro/mgba_libretro.so
    install -Dm644 "$srcdir"/mgba/LICENSE "$pkgdir"/usr/share/licenses/libretro-mgba/LICENSE
}
