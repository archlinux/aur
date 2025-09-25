# Maintainer: buzz <buzz@users.noreply.github.com>
pkgname=dethrace
pkgver=0.9.0
pkgrel=1
pkgdesc="Reverse engineering the 1997 game \"Carmageddon\""
arch=('i686' 'x86_64')
url="https://github.com/dethrace-labs/dethrace"
license=("GPL3")
depends=("libgl" "sdl2")
makedepends=("cmake")
brender_commit="fa8b5a90dff141f6e7e1f4f146ac593779fe6cea"
noextract=("BRender-${brender_commit}.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dethrace-labs/dethrace/archive/refs/tags/v${pkgver}.tar.gz"
        "BRender-${brender_commit}.tar.gz::https://github.com/dethrace-labs/BRender-v1.3.2/archive/${brender_commit}.tar.gz"
        "fix_install_dirs.patch")
install=$pkgname.install
sha256sums=("3814ba5ba6735f4679544923782292806bf2c15e84067adeeb221c1a519630b3"
            "4b75d4d15b111de228d368d3da99a0164648bd0b9ed0c26c66d486e6160f0459"
            "9f76f30245f2d48941f874258a2091c85bdd3966c749b6235da63426e545845e")

prepare() {
    tar -x --strip-components=1 -f BRender-${brender_commit}.tar.gz -C dethrace-${pkgver}/lib/BRender-v1.3.2
    patch -d $pkgname-$pkgver -Np1 -i ../fix_install_dirs.patch
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
      -DBRENDER_DISABLE_INSTALL=ON \
      -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
