pkgname=doom64ex-git
pkgver=0.r287.03a5e6a
pkgrel=1
pkgdesc="Engine recreation of Doom 64, requires N64 ROM (not included)."
arch=('i686' 'x86_64')
url="https://github.com/svkaiser/Doom64EX"
license=('GPL2')
depends=('fluidsynth' 'libpng' 'sdl2' 'sdl2_net' 'zlib')
makedepends=('cmake' 'git')
install=doom64ex.install
source=("${pkgname}::git+${url}"
        doom64ex.desktop)
sha512sums=('SKIP'
            'ae87f565d150400bc95a38841aa39bd5e851f16d7ea6f5090e39a42811700bcdeef567f0ee6966a81911561e6de6c422c66072ddb62ba52940e314e367a1a826')

pkgver() {
  cd "$srcdir/$pkgname"

  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir "$srcdir/$pkgname/build"
  cd "$srcdir/$pkgname/build"

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DENABLE_SYSTEM_FLUIDSYNTH=ON
  make
}

package() {
  cd "$srcdir/$pkgname/build"

  make DESTDIR="$pkgdir" install

  cd ..
  install -Dm644 distrib/doom64ex.png "$pkgdir/usr/share/icons/doom64ex.png"
  install -Dm644 ../doom64ex.desktop "$pkgdir/usr/share/applications/doom64ex.desktop"
}
