# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=crispy-doom
pkgdesc="Vanilla-compatible enhanced Doom engine"
pkgver=7.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="http://fabiangreffrath.github.io/crispy-doom"
license=('GPL2')
depends=('fluidsynth' 'hicolor-icon-theme' 'libpng' 'libsamplerate' 'sdl2_mixer' 'sdl2_net')
makedepends=('python')
optdepends=('freedm: Free deathmatch game'
            'freedoom1: Free Ultimate Doom-compatible game'
            'freedoom2: Free Doom II-compatible game')
install=crispy-doom.install
source=(https://github.com/fabiangreffrath/$pkgname/archive/$pkgname-$pkgver.tar.gz)
b2sums=('307a2f98e37ac902e938433d9ee660e301ea38f1f0404354e1c0e3cb7d7c06c576da6711465f050ab7a25e2417edc8845db3ffb018b5eec588799d08084ff578')

prepare() {
  cd "$pkgname-$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgname-$pkgname-$pkgver"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr
  rm -rf share/man/man5/default.cfg.5              \
         share/man/man5/heretic.cfg.5              \
         share/man/man5/hexen.cfg.5                \
         share/man/man5/strife.cfg.5               \
         share/man/man6/chocolate-{server,setup}.6

  rm bin/crispy-{heretic,hexen,strife}-setup
  mv bin/crispy-doom-setup bin/crispy-setup
  for game in doom heretic hexen strife; do
    ln -s crispy-setup bin/crispy-${game}-setup
  done
}
