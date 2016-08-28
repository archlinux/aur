# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=courier-maildrop
_srcname=maildrop
pkgver=2.8.4
pkgrel=1
pkgdesc="mail delivery agent - procmail like but nicer syntax"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://courier-mta.org/maildrop/"
depends=('courier-authlib>=0.66.3' 'gamin' 'pcre' 'gdbm' 'courier-unicode>=1.3')
conflicts=('courier-mta')
options=(!libtool)
source=(http://downloads.sourceforge.net/project/courier/${_srcname}/${pkgver}/${_srcname}-${pkgver}.tar.bz2)
sha512sums=('11e821b56d0d6447ef15e3098c4b464bfae5fe25022aa8762f75d5db8573b2007ae74c1491ad49ccb036989d83629fa4b7335997410c3aea99b0aeb28d24f976')

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
