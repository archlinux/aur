# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=procmail
pkgver=3.22
pkgrel=10
pkgdesc="Highly configurable auto mail processing."
arch=('x86_64')
#url="http://www.procmail.org" # offline
url="http://pm-doc.sourceforge.net/"
license=('GPL' 'custom:Artistic')
depends=('glibc' 'sh')
makedepends=('smtp-server')
source=(#"http://www.procmail.org/${pkgname}-${pkgver}.tar.gz" # currently down
        "http://ftp.osuosl.org/pub/blfs/conglomeration/procmail/procmail-${pkgver}.tar.gz"
        procmail-3.22-getline.patch formisc.c.patch fix_memory_allocation_bug.diff)
sha256sums=('087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117'
            'aaa5ce562e5ef65f56a0225eedda3fcc7ab2938da6097ed4d9b11abf861929de'
            'b7d983e5eba1d1869871a6ebb97404c511d0705673b0e59646b5c074c6ba34d8'
            '0f0e68b4eeac1dd7d9b167ff68d29cc8608e5247f4e59cf7098b65c9f1fb66e3')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i "${srcdir}"/procmail-3.22-getline.patch
  # FS#56398 / https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=876511
  patch -p1 -i "${srcdir}"/formisc.c.patch
  patch -p1 -i "${srcdir}"/fix_memory_allocation_bug.diff
}

build() {
  cd $pkgname-$pkgver
  yes n | make CFLAGS0="${CFLAGS} ${LDFLAGS}" LOCKINGTEST="/tmp ."
}

package() {
  cd $pkgname-$pkgver
  make BASENAME="${pkgdir}"/usr MANDIR="${pkgdir}"/usr/share/man install
  install -D -m644 Artistic "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -d -m755 "${pkgdir}"/usr/share/doc/${pkgname}/examples
  install -m644 examples/* "${pkgdir}"/usr/share/doc/${pkgname}/examples/
}
