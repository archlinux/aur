# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=crispy-doom
pkgdesc="Vanilla-compatible enhanced Doom engine"
pkgver=3.4
pkgrel=2
arch=('i686' 'x86_64')
url="http://fabiangreffrath.github.io/crispy-doom"
license=('GPL2')
depends=('libsamplerate' 'sdl_mixer' 'sdl_net')
makedepends=('python')
optdepends=('freedm: Free deathmatch game'
            'freedoom1: Free Ultimate Doom-compatible game (not vanilla compatible, but useful for mods)'
            'freedoom2: Free Doom II/Final Doom-compatible game (not vanilla compatible, but useful for mods)')
install=crispy-doom.install
source=(https://github.com/fabiangreffrath/$pkgname/archive/$pkgname-$pkgver.tar.gz
        0001-setup.desktop.patch
        0002-do-not-install-non-binary-files-for-non-Doom-games.patch)
sha256sums=('06b815c6e5cd5630682ca8797f2c1521f8aac5ba7c5677a04c5f3b27399e37ef'
            'af9ea0b75e5be2f91e62adb1ee6626f9fda7c1a4ace200f626f008a86cd9b043'
            '22ab3e9f3de4ee8001d873dd81813133352309f0304f1e7a272e2ff350903962')

prepare() {
  # GitHub's generated archive prefix kind of sucks.
  mv "$pkgname-$pkgname-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgname-$pkgver"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr
  rm -rf share/man/man5/default.cfg.5              \
         share/man/man6/chocolate-{server,setup}.6
}
