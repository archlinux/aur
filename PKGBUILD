# Original AUR Contributor: Federico Quagliata (quaqo) <linux@quaqo.org>
# Uploaded to AUR4:	    GI_Jack <GI_Jack@hackermail.com>

pkgname=secure-delete
_pkgname=secure_delete
_pkgver="3.1-a"
pkgver=3.1a
pkgfile="secure_delete-$pkgver"
pkgrel=1
pkgdesc="Secure file, disk, swap, memory erasure utilities"
url="http://www.thc.org/"
depends=('glibc' 'sh')
conflicts=('srm')
license=('GPLv2')
arch=('i686' 'x86_64')
install=${pkgname}.install
source=(${pkgname}-${_pkgver}.tar.gz::https://github.com/GIJack/secure_delete/archive/${_pkgver}.tar.gz)

sha256sums=('2bb8d1f9dbfd2e14f194ee88c730ef8abb8737bf183f715f45b9ca17d59bcebf')

build()
{
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  sed -i -e 's/mktemp/mkstemp/g' sfill.c
  sed -i -e "s/sswap smem sdel-mod.o/sswap smem/" -e '/test.*sdel-mod/d' \
    -e "s/^srm: /srm: sdel-lib.o /" -e "s/^sfill: /sfill: sdel-lib.o /" \
    -e "s/^sswap: /sswap: sdel-lib.o /" -e "s/^smem: /smem: sdel-lib.o /" \
    Makefile
  make
}

package()
{
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make INSTALL_DIR="${pkgdir}/usr/bin" \
    MAN_DIR="${pkgdir}/usr/share/man" \
    DOC_DIR="${pkgdir}/usr/share/doc/secure_delete" \
    install
  # renamed due to naming conflicts
  mv "${pkgdir}/usr/bin/smem" "${pkgdir}/usr/bin/semem"
  mv "${pkgdir}/usr/share/man/man1/smem.1" "${pkgdir}/usr/share/man/man1/semem.1"
  sed -i s/smem/semem/g "${pkgdir}/usr/share/man/man1/semem.1"
  chmod a+r "${pkgdir}/usr/bin"/*
}

