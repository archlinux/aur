# Maintainer: Mirco Tischler <mt-ml at gmx dot de>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=fwupdate
pkgver=12
pkgrel=2
pkgdesc='Tools for using the ESRT and UpdateCapsule() to apply firmware updates'
arch=('i686' 'x86_64')
url='https://github.com/rhinstaller/fwupdate'
license=('GPL2')
depends=('efivar' 'libsmbios' 'bash')
conflicts=('fwupd')
makedepends=('pesign' 'gnu-efi-libs')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
	"0001-Fix-uninitialized-variable.patch")
sha256sums=('4167d569f14e00ecf620c369ab34709e4bb1574ed588ef2e2398667e9e968703'
            '56d27c36b7f1178c818c37153e3dbdd0a26036366b3dc935cd169b0c716cb610')
install=fwupdate.install

_efidir=arch

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #patch -p1 < "${srcdir}/${source[1]}"
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
  #rm -rf ${pkgdir}/usr/src
  rm -rf ${pkgdir}/usr/lib/debug
  #rmdir  ${pkgdir}/usr/share/fwupdate
}
