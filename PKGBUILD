# Contributor: Leonardo Santana Vieira <leosanvieira at gmail dot com>

pkgname=imagescan
_pkgname=utsushi
pkgver=3.50.0
_pkgver=0.50.0
pkgrel=1
_fedrel=29
pkgdesc="EPSON Image Scan v3 front-end for scanners and all-in-ones"
arch=("x86_64")
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=("GPL3")
depends=("sane" "gtkmm" "graphicsmagick" "libtiff" "boost-libs")
makedepends=("boost")
optdepends=("tesseract: OCR support")
source=("http://support.epson.net/linux/src/scanner/imagescanv3/fedora/${pkgname}-${pkgver}-1epson4fedora${_fedrel}.src.rpm"
        "utsushi.desktop"
        "utsushi.conf")
sha256sums=('bae4652367e0c759ce4ee1b59a2020eaf1092cc62cec52688dbfb6342570cd30'
            '3d5f75594e29f4b077da1b890523cd263accf9a5dad2e78fea969026ea63f796'
            '0ab6b133215ced70a673d708c5bf08f956b8077c5fc97296f0dca92be9b7765b')
backup=("etc/utsushi/utsushi.conf")

prepare() {
  cd $srcdir
  bsdtar -xf ${_pkgname}-${_pkgver}.tar.gz
  cd ${_pkgname}-${_pkgver}
  sed -i -e 's/FATAL/DEBUG/' -e 's/NOTHING/ALL/' lib/log.cpp
  sed -i 's/ACTION!="add"/ACTION!="add|bind"/g' drivers/esci/utsushi-esci.rules
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
  install -Dm644 ${srcdir}/utsushi.desktop $pkgdir/usr/share/applications/utsushi.desktop
  install -Dm644 ${srcdir}/utsushi.conf $pkgdir/etc/utsushi/utsushi.conf
}
