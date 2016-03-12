# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(crispy-{doom,heretic,hexen,strife,common})
pkgbase=${pkgname[0]}
pkgdesc="Vanilla-compatible enhanced Doom, Heretic, Hexen, Strife engine"
pkgver=3.3
pkgrel=1
arch=('i686' 'x86_64')
url="http://fabiangreffrath.github.io/crispy-doom"
license=('GPL2')
depends=('libsamplerate' 'sdl_mixer' 'sdl_net')
makedepends=('python')
source=(https://github.com/fabiangreffrath/${pkgbase}/archive/${pkgbase}-${pkgver}.tar.gz)
sha256sums=('c85a1493c0d4b8c6f53888dffe4d758e9aabe52c965b1d6378382f7008dbed92')

prepare() {
  # GitHub's generated archive prefix kind of sucks.
  mv "${pkgbase}-${pkgbase}-${pkgver}" "${pkgbase}-${pkgver}"
  cd "${pkgbase}-${pkgver}"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  # Change binary dir from /usr/games to /usr/bin
  sed 's|/games|/bin|g' -i src{,/setup}/Makefile.am
}

build() {
  cd "${pkgbase}-${pkgver}"

  ./autogen.sh --prefix=/usr
  make
}

package_crispy-common() {
  pkgdesc="Files shared in common with Crispy Doom-based games."
  depends=('sdl_net')
  install=crispy-doom.install

  cd "${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -dm 755 "${pkgdir}"/usr/share/games/doom

  cd "${pkgdir}"/usr/bin
  mv crispy-doom-setup crispy-setup
  rm -f crispy-{doom,heretic,hexen,strife}{,-setup}

  cd "${pkgdir}"/usr/share
  rm -rf appdata bash-completion doc man/man5
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
  optdepends=('freedm: Free deathmatch game'
    'freedoom1: Free Ultimate Doom-compatible game (not vanilla compatible, but useful for mods)'
    'freedoom2: Free Doom II/Final Doom-compatible game (not vanilla compatible, but useful for mods)')

  cd "${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f crispy-{heretic,hexen,strife,server} crispy*setup
  ln -s crispy{,-doom}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/crispy-{heretic,hexen,strife}
  rm -f appdata/crispy-{heretic,hexen,strife}.appdata.xml
  rm -rf applications/crispy-{setup,heretic,hexen,strife}.desktop icons
  rm -f bash-completion/completions/crispy-{heretic,hexen,strife}
  rm -rf man/man5
  rm -f man/man?/crispy-{heretic,hexen,strife,setup,server}* \
    man/man6/chocolate* man/man6/*-setup.6
}

package_crispy-heretic() {
  pkgdesc="Heretic port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'crispy-common')
  optdepends=('blasphemer: Free Heretic-compatible game')

  cd "${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f crispy-{doom,hexen,strife,server} crispy*setup
  ln -s crispy{,-heretic}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/crispy-{doom,hexen,strife}
  rm -f appdata/crispy-{doom,hexen,strife}.appdata.xml
  rm -rf applications/crispy-{setup,doom,hexen,strife}.desktop \
    applications/screensavers icons
  rm -f bash-completion/completions/crispy-{doom,hexen,strife}
  rm -rf man/man5
  rm -f man/man?/crispy-{doom,hexen,strife,setup,server}* \
    man/man6/chocolate* man/man6/*-setup.6
}

package_crispy-hexen() {
  pkgdesc="Hexen port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'crispy-common')

  cd "${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f crispy-{doom,heretic,strife,server} crispy*setup
  ln -s crispy{,-hexen}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/crispy-{doom,heretic,strife}
  rm -f appdata/crispy-{doom,heretic,strife}.appdata.xml
  rm -rf applications/crispy-{setup,doom,heretic,strife}.desktop \
    applications/screensavers icons
  rm -f bash-completion/completions/crispy-{doom,heretic,strife}
  rm -rf man/man5
  rm -f man/man?/crispy-{doom,heretic,strife,setup,server}* \
    man/man6/chocolate* man/man6/*-setup.6
}

package_crispy-strife() {
  pkgdesc="Strife port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'crispy-common')

  cd "${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f crispy-{doom,heretic,hexen,server} crispy*setup
  ln -s crispy{,-strife}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/crispy-{doom,heretic,hexen}
  rm -f appdata/crispy-{doom,heretic,hexen}.appdata.xml
  rm -rf applications/crispy-{setup,doom,heretic,hexen}.desktop \
    applications/screensavers icons
  rm -f bash-completion/completions/crispy-{doom,heretic,hexen}
  rm -rf man/man5
  rm -f man/man?/crispy-{doom,heretic,hexen,setup,server}* \
    man/man6/chocolate* man/man6/*-setup.6
}
