# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=courier-maildrop
_srcname=maildrop
pkgver=2.8.2
pkgrel=1
pkgdesc="mail delivery agent - procmail like but nicer syntax"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://courier-mta.org/maildrop/"
depends=('courier-authlib>=0.66.2' 'gamin' 'pcre' 'gdbm' 'courier-unicode>=1.2')
conflicts=('courier-mta')
options=(!libtool)
source=(http://downloads.sourceforge.net/project/courier/${_srcname}/${pkgver}/${_srcname}-${pkgver}.tar.bz2)
sha512sums=('332a64bd3bdfa6dc0a516d78ea669e6acb15420819e728d52502356970ba1407a277676ba211fc9c5bc2965d9a2dcd4149b0b2a5732776896bc3107b2b6a271e')

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
