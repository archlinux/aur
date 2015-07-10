# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=courier-maildrop
_srcname=maildrop
pkgver=2.8.3
pkgrel=1
pkgdesc="mail delivery agent - procmail like but nicer syntax"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://courier-mta.org/maildrop/"
depends=('courier-authlib>=0.66.3' 'gamin' 'pcre' 'gdbm' 'courier-unicode>=1.3')
conflicts=('courier-mta')
options=(!libtool)
source=(http://downloads.sourceforge.net/project/courier/${_srcname}/${pkgver}/${_srcname}-${pkgver}.tar.bz2)
sha512sums=('25168945764eda5c74641e205e3c784ca2ae27c15a5a6ddfe7a1c7b238cd6c3d5b0a3f7ce8b405b578d067f6f2aae5d7d6110da8bc89f91ac1c7fdc224ffd054')

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
