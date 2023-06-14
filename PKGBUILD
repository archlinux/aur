pkgname=fheroes2
pkgver=1.0.5
pkgrel=1
pkgdesc="Recreation of the Heroes of Might and Magic II game engine"
arch=('i686' 'x86_64' 'armv7h')
url="https://ihhub.github.io/fheroes2/"
license=('GPL2')
depends=('hicolor-icon-theme' 'sdl2_image' 'sdl2_mixer')
makedepends=('cmake' 'gettext' 'ninja')
optdepends=(
  'curl: download demo version files'
  'innoextract: extract game resources from installer package'
  'python: extract animation resources from GOG CD image'
  'wget: download demo version files'
  'unzip: unpack demo version files'
)
conflicts=('fheroes2-git')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/ihhub/$pkgname/archive/$pkgver.tar.gz"
)
sha256sums=('53d889bb712cede9ad85d9fbaa09338b06c6948b247221464dd5b767a95f12c6')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -B build -G Ninja -S . \
        -DCMAKE_BUILD_TYPE=None \
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
