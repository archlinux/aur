# Maintainer: buzz <buzz@users.noreply.github.com>
pkgname=dethrace
pkgver=0.10.1
pkgrel=1
pkgdesc="Reverse engineering the 1997 game \"Carmageddon\""
arch=('i686' 'x86_64')
url="https://github.com/dethrace-labs/dethrace"
license=("GPL3")
depends=("libgl" "sdl2")
makedepends=("cmake")
brender_commit="44d27ffa026a0a3ea4dc0642315913bf5bc27e25"
noextract=("BRender-${brender_commit}.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dethrace-labs/dethrace/archive/refs/tags/v${pkgver}.tar.gz"
        "BRender-${brender_commit}.tar.gz::https://github.com/dethrace-labs/BRender-v1.3.2/archive/${brender_commit}.tar.gz"
        "fix_install_dirs.patch"
        "buffer_overflow_fix.patch")
install=$pkgname.install
sha256sums=("05040a0e3b40b82ca0e2856648969816bca846880d4ea0cb02446d91a5a12985"
            "40f2291104a4503c4a6dea8db1c75c0101bdcc2545775f483a6ab38d64e592a4"
            "9f76f30245f2d48941f874258a2091c85bdd3966c749b6235da63426e545845e"
            "5c67d99583d194dcd201f73d3aa692ab3d5bedc9b9db0b0963e1a70bab8f95e9")

prepare() {
    tar -x --strip-components=1 -f BRender-${brender_commit}.tar.gz -C dethrace-${pkgver}/lib/BRender-v1.3.2
    # Use GNUInstallDirs in CMakeLists.txt (https://github.com/dethrace-labs/dethrace/pull/485)
    patch -d $pkgname-$pkgver -Np1 -i ../fix_install_dirs.patch
    # Fix buffer overflow in resolve_full_path (https://github.com/dethrace-labs/dethrace/pull/997)
    patch -d $pkgname-$pkgver -Np1 -i ../buffer_overflow_fix.patch
}

build() {
    echo "$pkgver" > "$pkgname-$pkgver/VERSION"
    cmake -B build -S "$pkgname-$pkgver" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DCMAKE_INSTALL_DOCDIR="share/licenses/$pkgname" \
      -DDETHRACE_PLATFORM_SDL1=OFF \
      -DDETHRACE_PLATFORM_SDL2=ON \
      -DDETHRACE_PLATFORM_SDL_DYNAMIC=ON \
      -DDETHRACE_INSTALL=ON \
      -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
