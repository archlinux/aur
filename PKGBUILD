# Maintainer: Leonardo Santana Vieira <leosanvieira at gmail dot com>

pkgname=imagescan
_pkgname=utsushi
pkgver=3.47.0
_pkgver=0.47.0
pkgrel=2
_fedrel=28
pkgdesc="EPSON Image Scan v3 front-end for scanners and all-in-ones"
arch=("i686" "x86_64")
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=("GPL3")
depends=("sane" "gtkmm" "graphicsmagick" "libtiff")
makedepends=("boost")
optdepends=("tesseract: OCR support")
source=("http://support.epson.net/linux/src/scanner/imagescanv3/fedora/${pkgname}-${pkgver}-1epson4fedora${_fedrel}.src.rpm"
        "utsushi-scan-gtkmm.desktop"
        "utsushi.conf")
md5sums=('4c505416fc7e8707ced2a002dde5f2ae'
         '34907cc33aa800c54ff83abb0eac3fc4'
         '65872f825a1787db89faa0a68611ed81')
backup=("etc/utsushi/utsushi.conf")

prepare() {
  cd $srcdir
  bsdtar -xf ${_pkgname}-${_pkgver}.tar.gz
  cd ${_pkgname}-${_pkgver}
  sed -i -e 's/FATAL/DEBUG/' -e 's/NOTHING/ALL/' lib/log.cpp
  sed -i 's/ACTION!="add"/ACTION!="add|bind"/g' drivers/esci/utsushi-esci.rules
  sed -i 's/libusb_set_debug (ctx_, 3)/libusb_set_option (ctx_, LIBUSB_OPTION_LOG_LEVEL, 3)/g' connexions/usb.cpp
}

build() {
  cd $srcdir/${_pkgname}-${_pkgver}
  ./configure CFLAGS="${CFLAGS} -Wno-error" CXXFLAGS="${CXXFLAGS} -Wno-error" \
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
  cd $srcdir/${_pkgname}-${_pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/utsushi-scan-gtkmm.desktop $pkgdir/usr/share/applications/utsushi-scan-gtkmm.desktop
  install -Dm644 ${srcdir}/utsushi.conf $pkgdir/etc/utsushi/utsushi.conf
}
