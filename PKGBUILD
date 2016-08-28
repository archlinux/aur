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
sha512sums=('0242ac978a7c88697403eacac6f26c12ff2015558256c3c729c86a8dedda2fcc5e1c17e89ea31623c81df6b615e77dd6980f6f5004b3bf231e06b61b15a26d6d')

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
