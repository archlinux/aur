# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=crispy-doom
pkgdesc="Vanilla-compatible enhanced Doom engine"
pkgver=3.4
pkgrel=1
arch=('i686' 'x86_64')
url="http://fabiangreffrath.github.io/crispy-doom"
license=('GPL2')
depends=('libsamplerate' 'sdl_mixer' 'sdl_net')
makedepends=('python')
optdepends=('freedm: Free deathmatch game'
            'freedoom1: Free Ultimate Doom-compatible game (not vanilla compatible, but useful for mods)'
            'freedoom2: Free Doom II/Final Doom-compatible game (not vanilla compatible, but useful for mods)')
install=crispy-doom.install
source=(https://github.com/fabiangreffrath/$pkgname/archive/$pkgname-$pkgver.tar.gz)
sha256sums=('06b815c6e5cd5630682ca8797f2c1521f8aac5ba7c5677a04c5f3b27399e37ef')

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
  ln -s crispy-doom-setup bin/crispy-setup
  ln -s crispy-doom-setup.6 share/man/man6/crispy-setup.6
  rm -f share/appdata/crispy-{heretic,hexen,strife}.appdata.xml         \
        share/applications/crispy-{heretic,hexen,strife}.desktop        \
        share/bash-completion/completions/crispy-{heretic,hexen,strife} \
        share/man/man5/crispy-{heretic,hexen,strife}.cfg.5              \
        share/man/man5/{default,heretic,hexen,strife}.cfg.5             \
        share/man/man6/chocolate-{server,setup}.6                       \
        share/man/man6/crispy-{heretic,hexen,strife}{,-setup}.6
  rm -rf share/doc/crispy-{heretic,hexen,strife}
}
