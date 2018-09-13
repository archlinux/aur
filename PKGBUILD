# Original AUR Contributor: Federico Quagliata (quaqo) <linux@quaqo.org>
# Uploaded to AUR4:	    GI_Jack <iamjacksemail@hackermail.com>

pkgname=secure-delete
pkgver=3.1
pkgfile="secure_delete-$pkgver"
pkgrel=9
pkgdesc="Secure file, disk, swap, memory erasure utilities"
url="http://www.thc.org/"
depends=('glibc' 'sh')
conflicts=('srm')
license=('GPL')
arch=('i686' 'x86_64')
install=${pkgname}.install
source=(https://github.com/vanhauser-thc/THC-Archive/blob/master/Tools/secure_delete-${pkgver}.tar.gz)
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

  # Finally doing this after all these years. I am removing the words "law
  # enforcement" from the manpages of secure-delete. This was written in another
  # era. The program is old as dirt, but still widely used for legitimate
  # purposes.(example, back end for nautilus-wipe). The terms "law enforcement"
  # essentially amounts to a presumption of guilt, as well as a presumption of
  # someone's threat model. There is no good reason to ever list law enforcement
  # as a threat in the manpages, even if it you live in some part of the world
  # where the regime and police are a serious threat to Freedom. For users in
  # a Free part of the world. you've implicated them with criminal intent when
  # they otherwise have none: i.e. protecting against identity theft, by far
  # the most common cyber-crime, now have the presumption of being
  # cybercriminals themselves
  #
  # Secure Delete, I say again, has use as a legitimate defensive security tool.
  #
  # There is no good reason to ever list "Law Enforcement", or any part of a
  # regime security apparatus as a threat in software documentation. Ever.
  #
  # Van Hausen, if you ever read this, pls fix this upstream.
  
  sed -i 's/thiefs, law enforcement or other threats/an adversary/g' "${pkgdir}/usr/share/man/man1/srm.1"
  sed -i 's/thiefs, law enforcement/an adversary./g' "${pkgdir}/usr/share/man/man1/sswap.1"
  sed -i 's/or other threats.//g' "${pkgdir}/usr/share/man/man1/sswap.1"
  sed -i 's/thiefs, law enforcement/an adversary./g' "${pkgdir}/usr/share/man/man1/semem.1"
  sed -i 's/or other threats.//g' "${pkgdir}/usr/share/man/man1/semem.1"
  sed -i 's/thiefs, law enforcement/an adversary./g' "${pkgdir}/usr/share/man/man1/sfill.1"
  sed -i 's/or other threats.//g' "${pkgdir}/usr/share/man/man1/sfill.1"

}

