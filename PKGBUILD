# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(crispy-{doom,heretic,hexen,strife,common})
_pkgname=${pkgname[0]}
pkgdesc="Chocolate Doom with vanilla-compatible enhancements"
pkgver=1.5
pkgrel=1
arch=('i686' 'x86_64')
url="http://fabiangreffrath.github.io/crispy-doom"
license=('GPL2')
depends=('libsamplerate' 'sdl_mixer' 'sdl_net')
makedepends=('autoconf' 'python')
install=crispy-doom.install
source=(https://github.com/fabiangreffrath/${_pkgname}/archive/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('43f3f58266b1744a361df8678cf97a83839952a8dc0f5ecbfd68345abc90313a')

build() {
  # GitHub's generated archive prefix kind of sucks.
  mv "${_pkgname}-${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}"
  cd "${_pkgname}-${pkgver}"

  # Change binary dir from /usr/games to /usr/bin
  sed 's|/games|/bin|g' -i src{,/setup}/Makefile.am

  ./autogen.sh --prefix=/usr
  make
}

package_crispy-common() {
  pkgdesc="Files shared in common with Crispy Doom-based games."
  depends=('sdl_net')

  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -dm 755 "${pkgdir}"/usr/share/games/doom

  cd "${pkgdir}"/usr/bin
  mv crispy-doom-setup crispy-setup
  rm -f crispy-{doom,heretic,hexen,strife}{,-setup}

  cd "${pkgdir}"/usr/share
  rm -rf doc man/man5
  rm -rf applications/crispy-{doom,heretic,hexen,strife}.desktop \
    applications/screensavers
  cd man/man6
  rm -f crispy-{doom,heretic,hexen,strife}{,-setup}.6
  mv {chocolate,crispy}-server.6
  mv {chocolate,crispy}-setup.6
}

package_crispy-doom() {
  pkgdesc="Doom port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'crispy-common')

  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f crispy-{heretic,hexen,strife,server} crispy*setup
  ln -s crispy{,-doom}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/crispy-{heretic,hexen,strife}
  rm -rf applications/crispy-{setup,heretic,hexen,strife}.desktop icons
  rm -rf man/man5
  rm -f man/man?/crispy-{heretic,hexen,strife,setup,server}* \
    man/man6/chocolate* man/man6/*-setup.6
}

package_crispy-heretic() {
  pkgdesc="Heretic port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'crispy-common')

  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f crispy-{doom,hexen,strife,server} crispy*setup
  ln -s crispy{,-heretic}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/crispy-{doom,hexen,strife}
  rm -rf applications/crispy-{setup,doom,hexen,strife}.desktop \
    applications/screensavers icons
  rm -rf man/man5
  rm -f man/man?/crispy-{doom,hexen,strife,setup,server}* \
    man/man6/chocolate* man/man6/*-setup.6
}

package_crispy-hexen() {
  pkgdesc="Hexen port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'crispy-common')

  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f crispy-{doom,heretic,strife,server} crispy*setup
  ln -s crispy{,-hexen}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/crispy-{doom,heretic,strife}
  rm -rf applications/crispy-{setup,doom,heretic,strife}.desktop \
    applications/screensavers icons
  rm -rf man/man5
  rm -f man/man?/crispy-{doom,heretic,strife,setup,server}* \
    man/man6/chocolate* man/man6/*-setup.6
}

package_crispy-strife() {
  pkgdesc="Strife port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'crispy-common')

  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f crispy-{doom,heretic,hexen,server} crispy*setup
  ln -s crispy{,-strife}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/crispy-{doom,heretic,hexen}
  rm -rf applications/crispy-{setup,doom,heretic,hexen}.desktop \
    applications/screensavers icons
  rm -rf man/man5
  rm -f man/man?/crispy-{doom,heretic,hexen,setup,server}* \
    man/man6/chocolate* man/man6/*-setup.6
}
