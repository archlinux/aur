# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Leonardo Santana Vieira <leosanvieira at gmail dot com>

pkgname=imagescan
pkgver=3.50.0
pkgrel=2
pkgdesc="EPSON Image Scan v3 front-end for scanners and all-in-ones"
arch=(x86_64)
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=(GPL3)
depends=(sane gtkmm graphicsmagick boost-libs)
makedepends=(boost)
optdepends=('tesseract: OCR support')
source=(https://gitlab.com/utsushi/imagescan/-/archive/$pkgver/imagescan-$pkgver.tar.gz)
sha256sums=('78cf7862b18327d498b79e7f8636bd4a563d66672405b20b2de4b87198508718')
backup=('etc/utsushi/utsushi.conf')

prepare() {
  cd $pkgname-$pkgver
  sed -e 's|-Werror||g' -i configure.ac
  autoreconf -vif
}

build() {
  cd $pkgname-$pkgver
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
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 lib/devices.conf "$pkgdir"/etc/utsushi/utsushi.conf
}
