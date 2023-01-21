# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Leonardo Santana Vieira <leosanvieira at gmail dot com>

pkgname=imagescan
pkgver=3.65.0
_utsushiver=${pkgver/3./0.}
pkgrel=9
pkgdesc='EPSON Image Scan v3 front-end for scanners and all-in-ones'
arch=(x86_64)
url='http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX'
license=(GPL3)
depends=(sane gtkmm graphicsmagick boost-libs)
makedepends=(boost systemd)
optdepends=('tesseract: OCR support')
source=(https://sources.archlinux.org/other/community/imagescan/imagescan_$pkgver.orig.tar.gz
        boost-1.74.patch)
sha256sums=('e83704398c51a3166fd62c25b89e95cf6262e52f3dc6e627db3e7556e2220d64'
            'e7da445c970a4a99b476b3bb994d0d18f327e0cd166cd87ba24fcd16abee7d49')

prepare() {
  cd utsushi-$_utsushiver

  patch -Np1 -i ${srcdir}/boost-1.74.patch # Fix build with boost 1.74
  rm -r upstream/boost # Remove vendored libraries
  sed -e 's|&& (SANE_MINOR == 0)||' -i sane/version.hpp # Fix build with sane 1.1
}

build() {
  cd utsushi-$_utsushiver
  ./configure \
    --prefix=/usr/ \
    --libexecdir=/usr/lib/ \
    --sysconfdir=/etc/ \
    --enable-sane-config \
    --enable-udev-config \
    --with-gtkmm \
    --with-jpeg \
    --with-magick \
    --with-magick-pp \
    --with-sane \
    --with-tiff
#  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # This breaks some scanners, https://bugs.archlinux.org/task/63491
  make
}

package() {
  cd utsushi-$_utsushiver
  make DESTDIR="$pkgdir" install
  install -Dm644 lib/devices.conf "$pkgdir"/etc/utsushi/utsushi.conf.sample
}
