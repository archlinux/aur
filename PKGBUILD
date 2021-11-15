# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Giovanni Scafora <linuxmania at gmail dot com>
# Contributor: Andrew Sheng <science4sail at gmail dot com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=open-invaders
pkgver=0.3
pkgrel=3
pkgdesc="A clone of Space Invaders"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/open-invaders/"
license=('GPL2')
depends=('allegro4' 'gcc-libs' 'aldumb')
makedepends=('gendesk')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
        format_security.patch
        dumb_load.patch
        gcc6.patch
        ldflags.patch)
md5sums=('35c0d8ec3beacfc97389d38eef3555b2'
         '93d5721295c03aa3632bee734dd1b5fd'
         '1984c10ab5c0d660b8cacdc1672d3864'
         'c0661a336a74a8b92157ea2bfdb73c9f'
         'f6d1d0b87404d777c173163de3573cc7')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/format_security.patch"
  patch -p1 -i "${srcdir}/gcc6.patch"
  patch -p2 -i "${srcdir}/dumb_load.patch"
  patch -p2 -i "${srcdir}/ldflags.patch"
  gendesk -f -n --pkgname "${pkgname}" --name "Open Invaders" --pkgdesc "${pkgdesc}" --exec "${pkgname}" --categories "Game;ArcadeGame"
  convert data/oi_logo.pcx -resize 128 open-invaders.png
}


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=668815
  sed -i 's/ALLEGRO_LINUX/ALLEGRO_UNIX/' {headers/declare.h,src/collision.cc,src/init.cc,src/ending.cc,src/input.cc,src/interrupt.cc,src/intro.cc}
  sed -i '24i #include <sys/stat.h>' src/init.cc
  # http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=638376
  if [[ "$CARCH" == "x86_64" ]]; then
      sed -i 's/#define MASK_WORD_BITBITS 5/#define MASK_WORD_BITBITS 6/' headers/pmask.h
  fi
  ./configure --docdir=/usr/share/doc --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  # Move docs to the proper location
  mv "$pkgdir/usr/doc" "$pkgdir/usr/share/"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
