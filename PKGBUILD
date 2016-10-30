# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupdate
pkgver=8
pkgrel=1
pkgdesc='Tools for using the ESRT and UpdateCapsule() to apply firmware updates'
arch=('i686' 'x86_64')
url='https://github.com/rhinstaller/fwupdate'
license=('GPL2')
depends=('efivar' 'libsmbios' 'bash')
makedepends=('pesign' 'gnu-efi-libs')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('c8120f6ff0378d0f070373b6d46bfcaee18deeaf5a50c65d596c6df866980883')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  make EFIDIR=/usr/lib GNUEFIDIR=/usr/lib
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make LIBDIR=/usr/lib EFIDIR=/usr/lib DESTDIR="${pkgdir}" libexecdir=/usr/lib/ install
  
  #don't install into /boot. copy files to /usr/lib/fwupdate for manual installation
  install -d ${pkgdir}/usr/lib/fwupdate
  mv ${pkgdir}/boot/efi/EFI ${pkgdir}/usr/lib/fwupdate/EFI
  rm -rf ${pkgdir}/boot
  rm -rf ${pkgdir}/usr/src
  rm -rf ${pkgdir}/usr/lib/debug
}
