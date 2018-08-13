# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=crispy-doom
pkgdesc="Vanilla-compatible enhanced Doom engine"
pkgver=5.3
pkgrel=1
arch=('i686' 'x86_64')
url="http://fabiangreffrath.github.io/crispy-doom"
license=('GPL2')
depends=('libpng' 'libsamplerate' 'sdl2_mixer' 'sdl2_net')
makedepends=('python')
optdepends=('freedm: Free deathmatch game'
            'freedoom1: Free Ultimate Doom-compatible game'
            'freedoom2: Free Doom II/Final Doom-compatible game')
install=crispy-doom.install
source=(https://github.com/fabiangreffrath/$pkgname/archive/$pkgname-$pkgver.tar.gz
        fix-version-number.patch)
sha512sums=('dbd06cbfd2297d9665aeb689b533c9ea6433968a0b7ee2ea04827673332a59c5d87753a6e6a9c732531c97d77994c8458f1da5c18bf34ef2c9fe7cfd15fe8362'
            'e06e80233337fd9d2f9d1a36ee03ef7d9df206477fb6838392b799883339aac316df78f287592e44d037458727273939ae34f6ff7dc3cd1cdb91d52c87f7159e')

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
