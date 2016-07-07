# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupdate
pkgver=0.5
pkgrel=2
pkgdesc='Tools for using the ESRT and UpdateCapsule() to apply firmware updates'
arch=('i686' 'x86_64')
url='https://github.com/rhinstaller/fwupdate'
license=('GPL2')
depends=('efivar')
makedepends=('pesign' 'gnu-efi-libs')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
	"0001-libfwup-better-bounds-checking-with-efivar-0.24-APIs.patch"
	"0001-Always-set-a-mode-with-efi_set_variable.patch")
sha256sums=('633cd81e5120857ca4ab94067a59e56a031bb3764584ce1fcfe4fdb9c71031d5'
            '76311cc35e262c8128c914d38f6fe2b3ea6083b090b13729f93033d7e3e65abd'
            '2845e3f1fb5db180e2b602ff0f359166d2fcfe80eaba0b95c4ce67abf5527c3e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/${source[1]}"
  patch -p1 < "${srcdir}/${source[2]}"
}

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
