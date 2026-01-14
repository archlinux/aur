# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=chocolate-doom
pkgdesc="Historically-accurate Doom, Heretic, Hexen, and Strife ports."
pkgver=3.1.1
pkgrel=1
arch=('x86_64' 'aarch64')
url="http://www.chocolate-doom.org/"
license=('GPL2')
install=chocolate-doom.install
depends=('libpng' 'libsamplerate' 'sdl2_mixer' 'sdl2_net')
makedepends=('python')
optdepends=('freedm: Free deathmatch game'
            'freedoom1: Free Ultimate Doom-compatible game'
            'freedoom2: Free Doom II-compatible game')
conflicts=(chocolate-common
           chocolate-heretic
           chocolate-hexen
           chocolate-strife)
replaces=(${conflicts[@]})
source=(https://github.com/${pkgname}/${pkgname}/archive/refs/tags/${pkgname}-${pkgver}.tar.gz)
b2sums=('df95d149eb33dd2f0cec53e4d1cb854941a9cbedd5e4ecc7b88022a358729734bce68f5c015ab6ef1929825976d1be1d1da200aa57383fa7ff776c7a8064385e')

prepare() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  autoreconf -fi
}

build() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgname}-${pkgver}"

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
