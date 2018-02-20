# Maintainer: Leonardo Santana Vieira <leosanvieira at gmail dot com>

pkgname=imagescan
_pkgname=utsushi
pkgver=3.36.0
_pkgver=0.36.0
pkgrel=1
_fedrel=27
pkgdesc="EPSON Image Scan v3 front-end for scanners and all-in-ones"
arch=("i686" "x86_64")
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=("GPL3")
depends=("sane" "gtkmm" "imagemagick6" "libtiff")
makedepends=("boost")
optdepends=("tesseract: OCR support")
conflicts=("libmagick")
source=("http://support.epson.net/linux/src/scanner/imagescanv3/fedora/${pkgname}-${pkgver}-1epson4fedora${_fedrel}.src.rpm"
        "utsushi-scan-gtkmm.desktop"
        "utsushi.conf")
md5sums=('7040bda0cc86e9e8d7bbc2b42017f15a'
         '34907cc33aa800c54ff83abb0eac3fc4'
         '65872f825a1787db89faa0a68611ed81')
backup=("etc/utsushi/utsushi.conf")

prepare() {
  cd $srcdir
  bsdtar -xf ${_pkgname}-${_pkgver}.tar.gz
}

build() {
  cd $srcdir/${_pkgname}-${_pkgver}
  ./configure --with-boost-libdir=/usr/lib/ \
  --prefix=/usr/ \
  --libexecdir=/usr/lib/ \
  --sysconfdir=/etc/ \
  --enable-sane-config \
  --enable-udev-config \
  --with-gtkmm \
  --with-jpeg \
  --with-magick \
  --with-sane \
  --with-tiff
  make
}

package() {
  cd $srcdir/${_pkgname}-${_pkgver}
  make DESTDIR=${pkgdir} install
  sed -i 's/ACTION!="add"/ACTION!="add|bind"/g' $pkgdir/etc/udev/rules.d/utsushi-esci.rules
  install -Dm644 ${srcdir}/utsushi-scan-gtkmm.desktop $pkgdir/usr/share/applications/utsushi-scan-gtkmm.desktop
  install -Dm644 ${srcdir}/utsushi.conf $pkgdir/etc/utsushi/utsushi.conf
}
