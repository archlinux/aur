# Original AUR Contributor: Federico Quagliata (quaqo) <linux@quaqo.org>
# Uploaded to AUR4:	    GI_Jack <iamjacksemail@hackermail.com>

pkgname=secure-delete
pkgver=3.1
pkgfile="secure_delete-$pkgver"
pkgrel=8
pkgdesc="Secure file, disk, swap, memory erasure utilities"
url="http://www.thc.org/"
depends=('glibc' 'sh')
conflicts=('srm')
license=('GPL')
arch=('i686' 'x86_64')
install=${pkgname}.install
source=(https://zerocount.net/hosted/secure_delete-${pkgver}.tar.gz)
sha256sums=('a9d846d1dce3f1bdf13bbb306e8596bc1f263198a086f6beecd90ccf7bddf8d5')

build()
{
  cd "${srcdir}/${pkgfile}"
  sed -i -e 's/mktemp/mkstemp/g' sfill.c
  sed -i -e "s/sswap smem sdel-mod.o/sswap smem/" -e '/test.*sdel-mod/d' \
    -e "s/^srm: /srm: sdel-lib.o /" -e "s/^sfill: /sfill: sdel-lib.o /" \
    -e "s/^sswap: /sswap: sdel-lib.o /" -e "s/^smem: /smem: sdel-lib.o /" \
    Makefile
  make
}

package()
{
  cd "${srcdir}/${pkgfile}"
  make INSTALL_DIR="${pkgdir}/usr/bin" \
    MAN_DIR="${pkgdir}/usr/share/man" \
    DOC_DIR="${pkgdir}/usr/share/doc/secure_delete" \
    install
  # renamed due to naming conflicts
  mv "${pkgdir}/usr/bin/smem" "${pkgdir}/usr/bin/semem"
  mv "${pkgdir}/usr/share/man/man1/smem.1" "${pkgdir}/usr/share/man/man1/semem.1"
  sed -i 's/smem/semem/g' "${pkgdir}/usr/bin/the_cleaner.sh"
  sed -i 's/smem/semem/g' "${pkgdir}/usr/share/man/man1/semem.1"
  sed -i 's/SMEM/SEMEM/g' "${pkgdir}/usr/share/man/man1/semem.1"
  chmod a+r "${pkgdir}/usr/bin"/*
}

