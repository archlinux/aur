# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(chocolate-{doom,heretic,hexen,strife,common}-git)
_pkgname=${pkgname[0]/-git/}
pkgver=2.0.0.189.ga2c75d2
pkgrel=1
pkgdesc="Historically-accurate Doom, Heretic, Hexen, and Strife ports."
arch=('i686' 'x86_64')
url="http://www.chocolate-doom.org/"
license=('GPL2')
depends=('libsamplerate' 'sdl_mixer' 'sdl_net')
makedepends=('git' 'autoconf' 'python')
install=${_pkgname}.install
source=(git+https://github.com/chocolate-doom/chocolate-doom.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  local version=$(git describe)
  local version=${version/chocolate-doom-/}
  local version=${version//-/.}
  echo $version
}

build() {
  cd "${_pkgname}"

  # Change binary dir from /usr/games to /usr/bin
  sed 's|/games|/bin|g' -i src{,/setup}/Makefile.am

  ./autogen.sh --prefix=/usr
  make
}

package_chocolate-common-git() {
  pkgdesc="Files shared in common with Chocolate Doom-based games."
  depends=('sdl_net')
  conflicts=(chocolate-common)

  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -dm 755 "${pkgdir}"/usr/share/games/doom

  cd "${pkgdir}"/usr/bin
  mv chocolate-doom-setup chocolate-setup
  rm -f chocolate-{doom,heretic,hexen,strife}{,-setup}

  cd "${pkgdir}"/usr/share
  rm -rf doc man/man5
  rm -rf applications/chocolate-{doom,heretic,hexen,strife}.desktop \
    applications/screensavers
  cd man/man6
  rm -f chocolate-{doom,heretic,hexen,strife}{,-setup}.6
}

package_chocolate-doom-git() {
  pkgdesc="Doom port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'chocolate-common-git')
  conflicts=(chocolate-doom)

  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f chocolate-{heretic,hexen,strife,server} chocolate*setup
  ln -s chocolate{,-doom}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/chocolate-{heretic,hexen,strife}
  rm -rf applications/chocolate-{setup,heretic,hexen,strife}.desktop icons
  rm -f man/man?/chocolate-{heretic,hexen,strife,setup,server}* \
    man/man5/{heretic,hexen,strife}.cfg*
}

package_chocolate-heretic-git() {
  pkgdesc="Heretic port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'chocolate-common-git')
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
  rm -f man/man?/chocolate-{doom,heretic,hexen,setup,server}* \
    man/man5/{default,heretic,hexen}.cfg*
}
