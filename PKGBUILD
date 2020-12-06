# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Leonardo Santana Vieira <leosanvieira at gmail dot com>

pkgname=imagescan
pkgver=3.63.0
_utsushiver=${pkgver/3./0.}
pkgrel=2
pkgdesc="EPSON Image Scan v3 front-end for scanners and all-in-ones"
arch=(x86_64)
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=(GPL3)
depends=(sane gtkmm graphicsmagick boost-libs)
makedepends=(boost systemd)
optdepends=('tesseract: OCR support')
source=(https://support.epson.net/linux/src/scanner/imagescanv3/common/imagescan_$pkgver.orig.tar.gz
        imagescan-gcc10.patch boost-1.74.patch)
sha256sums=('439fb18054293b6e743b168739d85f2ceba66498d68590cfa68dbbc7ad971a94'
            'de64458187846d40e0c5dd06fa0c32962a22863803929d7ae61419153a5272bf'
            'e7da445c970a4a99b476b3bb994d0d18f327e0cd166cd87ba24fcd16abee7d49')
backup=('etc/utsushi/utsushi.conf')

prepare() {
  cd utsushi-$_utsushiver

  patch -p1 -i ../imagescan-gcc10.patch # Fix build with GCC 10
  patch -Np1 -i ${srcdir}/boost-1.74.patch # Fix build with boost 1.74
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
