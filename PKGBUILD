# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=courier-maildrop
_srcname=maildrop
pkgver=3.1.5
pkgrel=1
pkgdesc="mail delivery agent - procmail like but nicer syntax"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://courier-mta.org/maildrop/"
depends=('courier-authlib>=0.71.0' 'gamin' 'pcre2' 'gdbm' 'courier-unicode>=2.1' 'libidn')
conflicts=('courier-mta')
options=('!libtool' '!staticlibs')
source=(http://downloads.sourceforge.net/project/courier/${_srcname}/${pkgver}/${_srcname}-${pkgver}.tar.bz2)
sha512sums=('f722cbdf9aeb628ff68dcd280de5d7d37a3fae3692b7de5483cf0563631ff9b2eba9ef9baf3b3e3f6108d40e19b55dabddacaa3a064e6b71210b18f200bc67b7')

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
