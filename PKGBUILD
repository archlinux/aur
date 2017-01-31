# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=courier-maildrop
_srcname=maildrop
pkgver=2.8.5
pkgrel=1
pkgdesc="mail delivery agent - procmail like but nicer syntax"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://courier-mta.org/maildrop/"
depends=('courier-authlib>=0.67.0' 'gamin' 'pcre' 'gdbm' 'courier-unicode>=1.4')
conflicts=('courier-mta')
options=(!libtool)
source=(http://downloads.sourceforge.net/project/courier/${_srcname}/${pkgver}/${_srcname}-${pkgver}.tar.bz2)
sha512sums=('c04120af29ee8e72aeabd211301c5052fe4a2dc0f337074e1fa57b8adb9652512cd744e0bba3894a8b0e3b21a3511bbf4a4f045faec3536edb8be0f8bdc84cf5')

build() {
  cd ${srcdir}/${_srcname}-${pkgver}

  ./configure --prefix=/usr \
    --sysconfdir=/etc/courier \
    --localstatedir=/var \
    --mandir=/usr/share/man \
    --with-db=gdbm \
    --with-devel
  make LDFLAGS+=-lstdc++
}

package() {
  cd ${srcdir}/${_srcname}-${pkgver}

  make DESTDIR=${pkgdir} install
  chmod u+s ${pkgdir}/usr/bin/maildrop
  cd ${pkgdir}/usr/share/doc/maildrop/html
  for files in *; do
    install -Dm644 ${files} ${pkgdir}/usr/share/htmldoc/${files}
  done
  rm -rf ${pkgdir}/usr/share/maildrop

  # docs say we can remove .a files after make
  cd ${pkgdir}
  find ${pkgdir} -name '*\.a' -exec rm -f {} \;
}
