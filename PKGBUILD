# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=chocolate-doom-git
pkgdesc="Historically-accurate Doom, Heretic, Hexen, and Strife ports."
pkgver=3.0.0.r822.ee9fc21f
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.chocolate-doom.org/"
license=('GPL2')
install=chocolate-doom.install
depends=('libpng' 'libsamplerate' 'sdl2_mixer' 'sdl2_net')
makedepends=('git' 'python')
optdepends=('freedm: Free deathmatch game'
            'freedoom1: Free Ultimate Doom-compatible game'
            'freedoom2: Free Doom II-compatible game')
conflicts=(chocolate-common
          chocolate-doom
          chocolate-heretic
          chocolate-hexen
          chocolate-strife)
replaces=(chocolate-common-git
          chocolate-heretic-git
          chocolate-hexen-git
          chocolate-strife-git)
source=(git+https://github.com/chocolate-doom/chocolate-doom.git)
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname/-git//}"
  local version="$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
  printf %s "${version##chocolate.doom.}"
}

build() {
  cd "${pkgname/-git//}"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${pkgname/-git//}"

  make DESTDIR="${pkgdir}" install
  install -dm 755 "${pkgdir}"/usr/share/games/doom

  # dedup all the *setup programs, make desktop file work
  rm "${pkgdir}"/usr/bin/chocolate-{heretic,hexen,strife}-setup
  mv "${pkgdir}"/usr/bin/chocolate-doom-setup "${pkgdir}"/usr/bin/chocolate-setup
  ln -s chocolate-setup "${pkgdir}"/usr/bin/chocolate-doom-setup
  ln -s chocolate-setup "${pkgdir}"/usr/bin/chocolate-heretic-setup
  ln -s chocolate-setup "${pkgdir}"/usr/bin/chocolate-hexen-setup
  ln -s chocolate-setup "${pkgdir}"/usr/bin/chocolate-strife-setup
}
