# Maintainer: John Lane < archlinux at jelmail dot com >

pkgname=mimegpg
_srcname=sqwebmail
_srcdirname=webmail
pkgver=6.0.6
pkgrel=1
pkgdesc="A command-line utility to sign, encrypt or decrypt MIME-formatted e-mail messages using GnuPG. (Extracted from Courier SqWebMail.)"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
url="http://courier-mta.org/sqwebmail/"
depends=('courier-unicode>=1.3')
options=(!libtool)
source=(http://downloads.sourceforge.net/project/courier/${_srcdirname}/${pkgver}/${_srcname}-${pkgver}.tar.bz2)
sha512sums=('71b0b7fb2bea2af8247aa0f8872788a448de8d0708c143c2149abaaea5f795c9dec844270155143ba4d60fc4735800cbbce4936e8001cc991660c78b04d61901')

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
