# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupdate
pkgver=0.5
pkgrel=1
pkgdesc='Tools for using the ESRT and UpdateCapsule() to apply firmware updates'
arch=('i686' 'x86_64')
url='https://github.com/rhinstaller/fwupdate'
license=('GPL2')
depends=('efivar')
makedepends=('pesign' 'gnu-efi-libs')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('633cd81e5120857ca4ab94067a59e56a031bb3764584ce1fcfe4fdb9c71031d5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  make GNUEFIDIR=/usr/lib
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make LIBDIR=/usr/lib DESTDIR="${pkgdir}" libexecdir=/usr/lib/ install
  
  #don't install into /boot. copy files to /usr/lib/fwupdate for manual installation
  install -d ${pkgdir}/usr/lib/fwupdate
  mv ${pkgdir}/boot/efi/EFI ${pkgdir}/usr/lib/fwupdate/EFI
  rm -rf ${pkgdir}/boot
  rm -rf ${pkgdir}/usr/src
  rm -rf ${pkgdir}/usr/lib/debug
}
