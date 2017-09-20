# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=crispy-doom
pkgdesc="Vanilla-compatible enhanced Doom engine"
pkgver=4.3
pkgrel=1
arch=('i686' 'x86_64')
url="http://fabiangreffrath.github.io/crispy-doom"
license=('GPL2')
depends=('libpng' 'libsamplerate' 'sdl_mixer' 'sdl_net')
makedepends=('python')
optdepends=('freedm: Free deathmatch game'
            'freedoom1: Free Ultimate Doom-compatible game'
            'freedoom2: Free Doom II/Final Doom-compatible game')
install=crispy-doom.install
source=(https://github.com/fabiangreffrath/$pkgname/archive/$pkgname-$pkgver.tar.gz)
sha512sums=('e47f090ad969da0b71d3068c198287278f2f10f3c1909aedf96723b283e815810fdee3168d390b935024f932034c9c01374c62395d45f912f35391f0b7965ccc')

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
