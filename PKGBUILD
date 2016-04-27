# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

pkgname=ccid
pkgver=1.4.23
pkgrel=1
pkgdesc="A generic USB Chip/Smart Card Interface Devices driver"
arch=('i686' 'x86_64')
url="http://pcsclite.alioth.debian.org/ccid.html"
license=('LGPL' 'GPL')
depends=('pcsclite' 'libusb' 'flex')
makedepends=('pkg-config')
backup=(etc/reader.conf.d/libccidtwin)
source=("https://alioth.debian.org/frs/download.php/file/4169/${pkgname}-${pkgver}.tar.bz2")
md5sums=('b0bb7f9a663cd2891e49befa30d0f110')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-twinserial \
              --enable-serialconfdir=/etc/reader.conf.d
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  # move the configuration file in /etc and create a symbolic link
  mv "${pkgdir}/usr/lib/pcsc/drivers/ifd-ccid.bundle/Contents/Info.plist" "${pkgdir}/etc/libccid_Info.plist"
  ln -s /etc/libccid_Info.plist ${pkgdir}/usr/lib/pcsc/drivers/ifd-ccid.bundle/Contents/Info.plist
}
