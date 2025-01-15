# Maintainer: buzz <buzz@users.noreply.github.com>
pkgname=dethrace
pkgver=0.8.0
pkgrel=1
pkgdesc="Reverse engineering the 1997 game \"Carmageddon\""
arch=('i686' 'x86_64')
url="https://github.com/dethrace-labs/dethrace"
license=("GPL3")
depends=("libgl" "sdl2")
makedepends=("cmake")
brender_commit="9c34086300f4f0bbb3a55206380f25b17dad6c12"
noextract=("BRender-${brender_commit}.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dethrace-labs/dethrace/archive/refs/tags/v${pkgver}.tar.gz"
        "BRender-${brender_commit}.tar.gz::https://github.com/dethrace-labs/BRender-v1.3.2/archive/${brender_commit}.tar.gz"
        "fix_install_dirs.patch")
install=$pkgname.install
sha256sums=("5e636da490e2c14594d5842a6b888218bd40c188744ad509ec87a65a384ad350"
            "48002c6b6779150490084d63649c1afb559c24683f32dc00a32be604f4b73ecb"
            "fea3f9d9c4847df201bef875ab68d9a8fa1ecbffb4155466646f329b85dbb1ce")

prepare() {
    tar -x --strip-components=1 -f BRender-${brender_commit}.tar.gz -C dethrace-${pkgver}/lib/BRender-v1.3.2
    patch -d $pkgname-$pkgver -Np1 -i ../fix_install_dirs.patch
}

build() {
    echo "$pkgver" > "$pkgname-$pkgver/VERSION"
    cmake -B build -S "$pkgname-$pkgver" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DCMAKE_INSTALL_BINDIR="bin" \
      -DCMAKE_INSTALL_DATAROOTDIR="share/licenses/dethrace" \
      -DDETHRACE_INSTALL=ON \
      -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
