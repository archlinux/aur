# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=chocolate-doom
pkgdesc="Historically-accurate Doom, Heretic, Hexen, and Strife ports."
pkgver=3.1.0
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
source=(https://github.com/${pkgname}/${pkgname}/archive/refs/tags/${pkgname}-${pkgver}.tar.gz
        0001-man-docgen-Use-raw-string-literals-for-regular-expre.patch)
b2sums=('4e311985e1c20d2d5bf0cc6ef3e860c78a0d1e413ca398800bcdcf86f43727e48f1306e7e9c8878e3313e9ca2e7ba3d48eddd220ef5def06230caf32fe0890fb'
        '32382739724d1fead2c25af21821193326f2f85af8138005a3dccfd9fc65057430ce26063526472ff3d72aa2cd7cac044544859c5aff3fae66a4d76dc96f1c08')

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
