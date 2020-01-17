# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Leonardo Santana Vieira <leosanvieira at gmail dot com>

pkgname=imagescan
pkgver=3.62.0
_utsushiver=${pkgver/3./0.}
pkgrel=1
pkgdesc="EPSON Image Scan v3 front-end for scanners and all-in-ones"
arch=(x86_64)
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=(GPL3)
depends=(sane gtkmm graphicsmagick boost-libs)
makedepends=(boost)
optdepends=('tesseract: OCR support')
source=(https://support.epson.net/linux/src/scanner/imagescanv3/common/imagescan_$pkgver.orig.tar.gz)
sha256sums=('683204986061c8833a30482b1ec7cd183aac079f464bd7d0a591ca0f97067e32')
backup=('etc/utsushi/utsushi.conf')

prepare() {
  cd utsushi-$_utsushiver
  sed -e 's|-Werror||g' -i configure.ac
  rm -r upstream/boost # Remove vendored libraries
  autoreconf -vif
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
  install -Dm644 lib/devices.conf "$pkgdir"/etc/utsushi/utsushi.conf
}
