# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Leonardo Santana Vieira <leosanvieira at gmail dot com>

pkgname=imagescan
pkgver=3.61.0
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
sha256sums=('2fee01b65e43709a110db438b1b8d1ca70a193be6880d7118055c95a8d3fcbf5')
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
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  make
}

package() {
  cd utsushi-$_utsushiver
  make DESTDIR="$pkgdir" install
  install -Dm644 lib/devices.conf "$pkgdir"/etc/utsushi/utsushi.conf
}
