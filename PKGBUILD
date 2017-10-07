# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=courier-maildrop
_srcname=maildrop
pkgver=2.9.2
pkgrel=1
pkgdesc="mail delivery agent - procmail like but nicer syntax"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://courier-mta.org/maildrop/"
depends=('courier-authlib>=0.68.0' 'gamin' 'pcre' 'gdbm' 'courier-unicode>=2.0')
conflicts=('courier-mta')
options=('!libtool' '!staticlibs')
source=(http://downloads.sourceforge.net/project/courier/${_srcname}/${pkgver}/${_srcname}-${pkgver}.tar.bz2)
sha512sums=('135fd00821fa74954c919526165c1198c80945c82df6b26f44608051c40ab0d9b5b0bf629241866c55e3391f274b4c5f5206d8c6fdf682402c3517a09e689d25')

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  ./configure --prefix=/usr \
    --sysconfdir=/etc/courier \
    --localstatedir=/var \
    --mandir=/usr/share/man \
    --with-db=gdbm \
    --with-devel
  make LDFLAGS+=-lstdc++
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  chmod u+s "${pkgdir}/usr/bin/maildrop"
  cd "${pkgdir}/usr/share/doc/maildrop/html"
  for _files in *; do
    install -Dm644 "${_files}" "${pkgdir}/usr/share/htmldoc/${_files}"
  done
  rm -rf "${pkgdir}/usr/share/maildrop"
}
