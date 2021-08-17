# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Eric Bélanger <eric@archlinux.org>
# AUR Maintainer: Joaquin "ShyanJMC" Crespo <joaquincrespo96@gmail.com>

pkgname=links-minimal
pkgver=2.23
pkgrel=1
pkgdesc="A text WWW browser, similar to Lynx. This version is very minimal with the lowest features as possible."
arch=('x86_64')
url="http://links.twibright.com/"
license=('GPL')
depends=('bzip2' 'gpm' 'libevent' 'pcre' 'xz')
makedepends=('libtiff' 'libxt')
source=("http://links.twibright.com/download/links-${pkgver}.tar.bz2")
sha256sums=('6660d202f521fd18bf5184c3f1732d1fa7426a103374277ad1cdb8e57ce6ac45')

configure_options=(
  --prefix=/usr
  --mandir=/usr/share/man
  --disable-javascript
)

prepare() {
  cd links-${pkgver}
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" configure
}

build() {
  cd links-${pkgver}
  (cd intl; ./gen-intl; ./synclang)

  ./configure \
    "${configure_options[@]}" \
    --disable-graphics \
    --without-x \
    --without-fb \
    --without-librsvg \
    --without-libjpeg \
    --without-grx \
    --without-haiku \
    --without-atheos \
    --without-windows \
    --without-pmshell \
    --without-directfb \
    --without-svgalib \
    --without-openmp \
    --without-lzip \
    --without-lzma \
    --without-bzip2 \
    --without-zstd \
    --without-brotli \
    --without-zlib \
    --without-gpm

  make
}

package() {
  cd links-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/usr/share/pixmaps"
  install -m0644 links_16x16_1.xpm links_16x16_2.xpm links_32x32.xpm links-48x48.xpm "${pkgdir}/usr/share/pixmaps/"

  install -d "${pkgdir}/usr/share/doc/links/calibration"
  install -m0644 doc/links_cal/* "${pkgdir}/usr/share/doc/links/calibration/"
}
