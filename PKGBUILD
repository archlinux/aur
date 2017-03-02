# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=crispy-doom
pkgdesc="Vanilla-compatible enhanced Doom engine"
pkgver=3.5
pkgrel=4
arch=('i686' 'x86_64')
url="http://fabiangreffrath.github.io/crispy-doom"
license=('GPL2')
depends=('libpng' 'libsamplerate' 'sdl_mixer' 'sdl_net')
makedepends=('python')
optdepends=('freedm: Free deathmatch game'
            'freedoom1: Free Ultimate Doom-compatible game (not vanilla compatible, but useful for mods)'
            'freedoom2: Free Doom II/Final Doom-compatible game (not vanilla compatible, but useful for mods)')
install=crispy-doom.install
source=(https://github.com/fabiangreffrath/$pkgname/archive/$pkgname-$pkgver.tar.gz
        0001-man-docgen-simplecpp-Force-UTF-8-reading-and-writing.patch)
sha512sums=('cc664ec85d8c376075223c8a92e7e70274972fd97a8007abc5936cd020f1555794398676e58231cb19786a2f9bb6b1f01f5152efc4563d3d3f8f62fcb31f3961'
            'e2702dc1fb684f31abfc443f10bd99409f01ac9540fcecb2dbdd9ff738e50f283314f998bae8569aad7f720a60a12ada4fad443c60ae3320c60ca5638e68361c')

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
         share/man/man6/chocolate-{server,setup}.6 \
         share/bash-completion
}
