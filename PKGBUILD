# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=meterbridge
pkgver=0.9.2
pkgrel=3
pkgdesc="Collection of Audio meters for the JACK audio server"
arch=('x86_64')
url="http://plugin.org.uk/meterbridge/"
license=('GPL')
groups=('pro-audio')
depends=('jack' 'sdl_image')
source=("http://plugin.org.uk/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'c99-inline-fix.patch')
sha512sums=('dec68307430649f3281528b31f20f501df07c4c9841776bac9c532d16a309bc701d39a5f577dc55eccb0edebc514d2eeca45c057a81a5c6c57bd61faae7deff0'
            '4e76dcb966daa5080ebf85274739e6ac0ef5baf15ef42d4c9d9918f2ed03ce4dae954323f1fc3081360f175d24692f4d8612d39b3def11a480ac10d466f31da6')

prepare() {
  cd "${pkgname}-${pkgver}"

  # gcc 4.x fix
  sed -i "s/ buf_rect.*,//" src/main.h

  # iec scale fix
  # http://lists.linuxaudio.org/pipermail/linux-audio-dev/2012-June/032475.html
  sed -i 's/ 5.0/ 2.5/' src/dpm_meters.c

  # fix the changed evaluation of inline functions
  patch -Np0 -i "${srcdir}/c99-inline-fix.patch"

  autoreconf -vi
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
