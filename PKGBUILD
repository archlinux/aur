# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

pkgname=ccid
pkgver=1.4.28
pkgrel=1
_magic_dl_id=4230
pkgdesc="A generic USB Chip/Smart Card Interface Devices driver"
arch=('x86_64')
url="http://pcsclite.alioth.debian.org/ccid.html"
license=('LGPL' 'GPL')
depends=('pcsclite' 'libusb' 'flex')
backup=(etc/reader.conf.d/libccidtwin)
validpgpkeys=(F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E) # Ludovic Rousseau <ludovic.rousseau@free.fr>
source=("https://alioth.debian.org/frs/download.php/file/${_magic_dl_id}/${pkgname}-${pkgver}.tar.bz2"
        "https://alioth.debian.org/frs/download.php/file/$((_magic_dl_id+1))/${pkgname}-${pkgver}.tar.bz2.asc")
sha256sums=('875836ac5d9d952b40dc1a253a726e74361671864d81337285a3260268f8ade0'
            'SKIP')

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

  install -Dm644 src/92_pcscd_ccid.rules "${pkgdir}/usr/lib/udev/rules.d/92_pcscd_ccid.rules"
}
