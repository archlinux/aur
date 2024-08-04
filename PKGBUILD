# Maintainer: buzz <buzz@users.noreply.github.com>
pkgname=dethrace
pkgver=0.7.1
pkgrel=1
pkgdesc="Reverse engineering the 1997 game \"Carmageddon\""
arch=('i686' 'x86_64')
url="https://github.com/dethrace-labs/dethrace"
license=("GPL3")
depends=("libgl" "sdl2")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dethrace-labs/dethrace/archive/refs/tags/v${pkgver}.tar.gz"
        "fix_install_dirs.patch")
install=$pkgname.install
sha256sums=("3bf5fba5e8847ae041e71a2c16364e71b5619e36e94a0873d707733dff694647"
            "ad1d8a4178fdc529c7b8f675ceb99d9245de674c80f20c1ff8378493b8ae258b")

prepare() {
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
