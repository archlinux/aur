# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(chocolate-{doom,heretic,hexen,strife,common}-git)
_pkgname=${pkgname[0]/-git/}
pkgdesc="Historically-accurate Doom, Heretic, Hexen, and Strife ports."
pkgver=3.0.0.r0.8777b99c
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.chocolate-doom.org/"
license=('GPL2')
depends=('libpng' 'libsamplerate' 'sdl2_mixer' 'sdl2_net')
makedepends=('git' 'python')
source=(git+https://github.com/chocolate-doom/chocolate-doom.git)
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  local version="$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
  printf %s "${version##chocolate.doom.}"
}

build() {
  cd "${_pkgname}"

  ./autogen.sh --prefix=/usr
  make
}

package_chocolate-common-git() {
  pkgdesc="Files shared in common with Chocolate Doom-based games."
  conflicts=(chocolate-common)
  install=chocolate-doom.install

  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -dm 755 "${pkgdir}"/usr/share/games/doom

  cd "${pkgdir}"/usr/bin
  mv chocolate-doom-setup chocolate-setup
  rm -f chocolate-{doom,heretic,hexen,strife}{,-setup}

  cd "${pkgdir}"/usr/share
  rm -rf bash-completion doc man/man5
  rm -rf applications/chocolate-{doom,heretic,hexen,strife}.desktop \
     applications/screensavers
  rm -rf appdata
  cd man/man6
  rm -f chocolate-{doom,heretic,hexen,strife}{,-setup}.6
}

package_chocolate-doom-git() {
  pkgdesc="Doom port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'chocolate-common-git')
  optdepends=('freedm: Free deathmatch game'
              'freedoom1: Free Ultimate Doom-compatible game (not vanilla compatible, but useful for mods)'
              'freedoom2: Free Doom II/Final Doom-compatible game (not vanilla compatible, but useful for mods)')
  conflicts=(chocolate-doom)

  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f chocolate-{heretic,hexen,strife,server} chocolate*setup
  ln -s chocolate{,-doom}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/chocolate-{heretic,hexen,strife}
  rm -rf applications/chocolate-{setup,heretic,hexen,strife}.desktop icons
  rm -f appdata/chocolate-{heretic,hexen,strife}.appdata.xml \
     bash-completion/completions/chocolate-{heretic,hexen,strife}
  rm -f man/man?/chocolate-{heretic,hexen,strife,setup,server}* \
     man/man5/{heretic,hexen,strife}.cfg*
}

package_chocolate-heretic-git() {
  pkgdesc="Heretic port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'chocolate-common-git')
  optdepends=('blasphemer: Free Heretic-compatible game')
  conflicts=(chocolate-heretic)

  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f chocolate-{doom,hexen,strife,server} chocolate*setup
  ln -s chocolate{,-heretic}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/chocolate-{doom,hexen,strife}
  rm -rf applications/chocolate-{setup,doom,hexen,strife}.desktop \
     applications/screensavers icons
  rm -f appdata/chocolate-{doom,hexen,strife}.appdata.xml \
     bash-completion/completions/chocolate-{doom,hexen,strife}
  rm -f man/man?/chocolate-{doom,hexen,strife,setup,server}* \
     man/man5/{default,hexen,strife}.cfg*
}

package_chocolate-hexen-git() {
  pkgdesc="Hexen port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'chocolate-common-git')
  conflicts=(chocolate-hexen)

  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f chocolate-{doom,heretic,strife,server} chocolate*setup
  ln -s chocolate{,-hexen}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/chocolate-{doom,heretic,strife}
  rm -rf applications/chocolate-{setup,doom,heretic,strife}.desktop \
     applications/screensavers icons
  rm -f appdata/chocolate-{doom,heretic,strife}.appdata.xml \
     bash-completion/completions/chocolate-{doom,heretic,strife}
  rm -f man/man?/chocolate-{doom,heretic,strife,setup,server}* \
     man/man5/{default,heretic,strife}.cfg*
}

package_chocolate-strife-git() {
  pkgdesc="Strife port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'chocolate-common-git')
  conflicts=(chocolate-strife)

  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f chocolate-{doom,heretic,hexen,server} chocolate*setup
  ln -s chocolate{,-strife}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/chocolate-{doom,heretic,hexen}
  rm -rf applications/chocolate-{setup,doom,heretic,hexen}.desktop \
     applications/screensavers icons
  rm -f appdata/chocolate-{doom,heretic,hexen}.appdata.xml \
     bash-completion/completions/chocolate-{doom,heretic,hexen}
  rm -f man/man?/chocolate-{doom,heretic,hexen,setup,server}* \
     man/man5/{default,heretic,hexen}.cfg*
}
