# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=courier-maildrop
_srcname=maildrop
pkgver=3.0.9
pkgrel=1
pkgdesc="mail delivery agent - procmail like but nicer syntax"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://courier-mta.org/maildrop/"
depends=('courier-authlib>=0.71.0' 'gamin' 'pcre2' 'gdbm' 'courier-unicode>=2.1' 'libidn')
conflicts=('courier-mta')
options=('!libtool' '!staticlibs')
source=(http://downloads.sourceforge.net/project/courier/${_srcname}/${pkgver}/${_srcname}-${pkgver}.tar.bz2)
sha512sums=('8ce61151b000d14947ba51722a981b1dc2d14ff488f1cdd555eebb7c925e5f9b8b4bea8be5ff3fa621a2c75306f5393f245c49b4758e4419cca8b252deea6be6')

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  ./configure --prefix=/usr \
    --sysconfdir=/etc/courier \
    --localstatedir=/var \
    --mandir=/usr/share/man \
    --with-db=gdbm \
    --with-devel \
    --enable-dovecotauth
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
