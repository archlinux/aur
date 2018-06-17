# Maintainer: John Lane < archlinux at jelmail dot com >

pkgname=mimegpg
_srcname=sqwebmail
_srcdirname=webmail
pkgver=5.9.2
pkgrel=1
pkgdesc="A command-line utility to sign, encrypt or decrypt MIME-formatted e-mail messages using GnuPG. (Extracted from Courier SqWebMail.)"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
url="http://courier-mta.org/sqwebmail/"
depends=('courier-unicode>=1.3')
options=(!libtool)
source=(http://downloads.sourceforge.net/project/courier/${_srcdirname}/${pkgver}/${_srcname}-${pkgver}.tar.bz2)
sha512sums=('604cc0021e7e84dcd3d0d7f50e7626cdac09e9d8358fba8ba6288d7e84a152218a461d4144f23c7859caa15f5464794804bd4689ab8b0e0f5bf256d780dc921c')

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
