# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(chocolate-{doom,heretic,hexen,strife,common})
pkgbase=${pkgname[0]}
pkgdesc="Historically-accurate Doom, Heretic, Hexen, and Strife ports."
pkgver=3.0.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.chocolate-doom.org/"
license=('GPL2')
depends=('libpng' 'libsamplerate' 'sdl2_mixer' 'sdl2_net')
makedepends=('python')
source=(http://chocolate-doom.org/downloads/${pkgver}/${pkgbase}-${pkgver}.tar.gz{,.asc})
sha512sums=('41f235c0d84ef21070636ad0610e97898dfd366fae7f9244bd2aebf8974db98dcf55f70bcab2f93589b9bf31dd421db32e8af88e0f8e0a655d2b9f1d4ead2afd'
            'SKIP')
validpgpkeys=('6D2C117E0310664497AA9546F6C2EE9C23354344')

prepare() {
  cd "${pkgbase}-${pkgver}"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "${pkgbase}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package_chocolate-common() {
  pkgdesc="Files shared in common with Chocolate Doom-based games."
  install=chocolate-doom.install

  cd "${pkgbase}-${pkgver}"
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

package_chocolate-doom() {
  pkgdesc="Doom port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'chocolate-common')
  optdepends=('freedm: Free deathmatch game'
              'freedoom1: Free Ultimate Doom-compatible game (not vanilla compatible, but useful for mods)'
              'freedoom2: Free Doom II/Final Doom-compatible game (not vanilla compatible, but useful for mods)')

  cd "${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f chocolate-{heretic,hexen,strife,server} chocolate*setup
  ln -s chocolate{,-doom}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/chocolate-{heretic,hexen,strife}
  rm -rf applications/chocolate-{setup,heretic,hexen,strife}.desktop icons
  rm -f appdata/chocolate-{heretic,hexen,strife}.appdata.xml
  rm -f bash-completion/completions/chocolate-{heretic,hexen,strife}
  rm -f man/man?/chocolate-{heretic,hexen,strife,setup,server}* \
     man/man5/{heretic,hexen,strife}.cfg*
}

package_chocolate-heretic() {
  pkgdesc="Heretic port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'chocolate-common')
  optdepends=('blasphemer: Free Heretic-compatible game')

  cd "${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f chocolate-{doom,hexen,strife,server} chocolate*setup
  ln -s chocolate{,-heretic}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/chocolate-{doom,hexen,strife}
  rm -rf applications/chocolate-{setup,doom,hexen,strife}.desktop \
     applications/screensavers icons
  rm -f appdata/chocolate-{doom,hexen,strife}.appdata.xml
  rm -f bash-completion/completions/chocolate-{doom,hexen,strife}
  rm -f man/man?/chocolate-{doom,hexen,strife,setup,server}* \
     man/man5/{default,hexen,strife}.cfg*
}

package_chocolate-hexen() {
  pkgdesc="Hexen port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'chocolate-common')

  cd "${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f chocolate-{doom,heretic,strife,server} chocolate*setup
  ln -s chocolate{,-hexen}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/chocolate-{doom,heretic,strife}
  rm -rf applications/chocolate-{setup,doom,heretic,strife}.desktop \
     applications/screensavers icons
  rm -f appdata/chocolate-{doom,heretic,strife}.appdata.xml
  rm -f bash-completion/completions/chocolate-{doom,heretic,strife}
  rm -f man/man?/chocolate-{doom,heretic,strife,setup,server}* \
     man/man5/{default,heretic,strife}.cfg*
}

package_chocolate-strife() {
  pkgdesc="Strife port accurately reproducing the original DOS EXEs."
  depends=(${depends[@]} 'chocolate-common')

  cd "${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}"/usr/bin
  rm -f chocolate-{doom,heretic,hexen,server} chocolate*setup
  ln -s chocolate{,-strife}-setup

  cd "${pkgdir}"/usr/share
  rm -rf doc/chocolate-{doom,heretic,hexen}
  rm -rf applications/chocolate-{setup,doom,heretic,hexen}.desktop \
     applications/screensavers icons
  rm -f appdata/chocolate-{doom,heretic,hexen}.appdata.xml
  rm -f bash-completion/completions/chocolate-{doom,heretic,hexen}
  rm -f man/man?/chocolate-{doom,heretic,hexen,setup,server}* \
     man/man5/{default,heretic,hexen}.cfg*
}
