# Maintainer: John Lane < archlinux at jelmail dot com >

pkgname=mimegpg
_srcname=sqwebmail
_srcdirname=webmail
pkgver=5.8.3
pkgrel=1
pkgdesc="A command-line utility to sign, encrypt or decrypt MIME-formatted e-mail messages using GnuPG. (Extracted from Courier SqWebMail.)"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
url="http://courier-mta.org/sqwebmail/"
depends=('courier-unicode>=1.3')
options=(!libtool)
source=(http://downloads.sourceforge.net/project/courier/${_srcdirname}/${pkgver}/${_srcname}-${pkgver}.tar.bz2)
sha512sums=('313a8b860e1e55e2f1caded8984e8437b83ccb1e051735532a2d74295583f94be80461cdcaad79d9618b374249b5ef87807cd191c0462e4b18880dd6395d027e')

build() {
  for lib in numlib rfc822 rfc2045
  do
    cd ${srcdir}/${_srcname}-${pkgver}/libs/${lib}
    ./configure --prefix=/usr
    make LDFLAGS+=-lstdc++
  done

  cd ${srcdir}/${_srcname}-${pkgver}/libs/gpglib

  ./configure --prefix=/usr \
    --sysconfdir=/etc/courier \
    --localstatedir=/var \
    --mandir=/usr/share/man
  make LDFLAGS+=-lstdc++ gpg.h mimegpg
}

package() {
  cd ${srcdir}/${_srcname}-${pkgver}
  install -D libs/gpglib/mimegpg ${pkgdir}/usr/bin/mimegpg
  install -D libs/gpglib/mimegpg.1 ${pkgdir}/usr/share/man/man1/mimegpg.1
}
