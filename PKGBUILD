pkgname=fheroes2
pkgver=1.0.1
pkgrel=1
pkgdesc="Recreation of the Heroes of Might and Magic II game engine"
arch=('i686' 'x86_64' 'armv7h')
url="https://ihhub.github.io/fheroes2/"
license=('GPL2')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer')
optdepends=(
  'curl: download demo version files'
  'innoextract: extract game resources from installer package'
  'python: extract animation resources from GOG CD image'
  'wget: download demo version files'
  'unzip: unpack demo version files'
)
makedepends=('cmake' 'gettext' 'ninja')
conflicts=('fheroes2-git')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/ihhub/$pkgname/archive/$pkgver.tar.gz"
)
sha256sums=('1e913cffec5cd29671b0aecdb55f1792887ec315f45978abfe8b0c1a1b0b642b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -B build -G Ninja -S . \
        -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build

  # build man page
  make -C docs
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  DESTDIR="$pkgdir" cmake --install build

  install -dm755 "$pkgdir/usr/share/fheroes2/maps"

  install -Dm644 docs/fheroes2.6 "$pkgdir/usr/share/man/man6/fheroes2.6"
}

# vim:set ts=2 sw=2 et:
