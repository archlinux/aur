# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

pkgname=ccid
pkgver=1.5.2
pkgrel=1
pkgdesc='A generic USB Chip/Smart Card Interface Devices driver'
arch=('x86_64')
url='https://ccid.apdu.fr/'
license=('LGPL' 'GPL')
depends=('pcsclite' 'libusb' 'flex')
backup=('etc/reader.conf.d/libccidtwin')
validpgpkeys=('F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E') # Ludovic Rousseau <ludovic.rousseau@free.fr>
source=("https://ccid.apdu.fr/files/${pkgname}-${pkgver}.tar.bz2"{,.asc})
sha256sums=('13934487e6f8b48f699a16d367cc7a1af7a3ca874de721ac6e9633beb86e7219'
            'SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    LEXLIB='' \
    --prefix=/usr \
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
  ln -s /etc/libccid_Info.plist "${pkgdir}/usr/lib/pcsc/drivers/ifd-ccid.bundle/Contents/Info.plist"

  install -Dm644 src/92_pcscd_ccid.rules "${pkgdir}/usr/lib/udev/rules.d/92_pcscd_ccid.rules"
}
