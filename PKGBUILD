# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Leonardo Santana Vieira <leosanvieira at gmail dot com>

pkgname=imagescan
pkgver=3.59.2
_utsushiver=${pkgver/3./0.}
pkgrel=2
pkgdesc="EPSON Image Scan v3 front-end for scanners and all-in-ones"
arch=(x86_64)
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=(GPL3)
depends=(sane gtkmm graphicsmagick boost-libs)
makedepends=(boost)
optdepends=('tesseract: OCR support')
source=(https://support.epson.net/linux/src/scanner/imagescanv3/common/imagescan_$pkgver.orig.tar.gz)
sha256sums=('b8e53fafbaf411e46f6ab1057741b3d9c7a49a158fc925609ef94a7f2b08dad6')
backup=('etc/utsushi/utsushi.conf')

prepare() {
  cd utsushi-$_utsushiver
  sed -e 's|-Werror||g' -i configure.ac
  autoreconf -vif
}

build() {
  cd utsushi-$_utsushiver
  ./configure \
    --with-boost-libdir=/usr/lib/ \
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
