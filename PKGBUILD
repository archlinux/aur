# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupdate
pkgver=9
pkgrel=1
pkgdesc='Tools for using the ESRT and UpdateCapsule() to apply firmware updates'
arch=('i686' 'x86_64')
url='https://github.com/rhinstaller/fwupdate'
license=('GPL2')
depends=('efivar' 'libsmbios' 'bash')
makedepends=('pesign' 'gnu-efi-libs')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
	"0001-Fix-uninitialized-variable.patch")
sha256sums=('e926a7b33a58f5dbf029a5a687375e88b18a41f0742ba871aff7d1d82d075c87'
            '56d27c36b7f1178c818c37153e3dbdd0a26036366b3dc935cd169b0c716cb610')
install=fwupdate.install

_efidir=arch

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/${source[1]}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  make EFIDIR="${_efidir}" GNUEFIDIR=/usr/lib
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make LIBDIR=/usr/lib EFIDIR="${_efidir}" DESTDIR="${pkgdir}" libexecdir=/usr/lib/ install
  
  #don't install into /boot. copy files to /usr/lib/fwupdate for manual installation
  install -d ${pkgdir}/usr/lib/fwupdate
  mv ${pkgdir}/boot/efi/EFI ${pkgdir}/usr/lib/fwupdate/EFI
  rm -rf ${pkgdir}/boot
  rm -rf ${pkgdir}/usr/src
  rm -rf ${pkgdir}/usr/lib/debug
  rmdir  ${pkgdir}/usr/share/fwupdate
}
