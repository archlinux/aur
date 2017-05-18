# vim:set ts=2 sw=2 et:
# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=csync2-git
_pkgname=csync2
pkgver=2.0.r8.g175a01c
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Asynchronous cluster syncronisation tool based on librsync and inspired by Unison"
url="http://oss.linbit.com/csync2/"
license=('GPL')
makedepends=('texlive-bin' 'sqlite' 'git')
depends=('librsync' 'gnutls')
optdepends=('sqlite: for sqlite backend')
source=("$pkgname::git://git.linbit.com/csync2.git"
        'csync2.socket'
        'csync2@.service'
        'csync2-rm-ssl-cert')
md5sums=('SKIP'
         '276efe22ab32b540fbdd6ada3479f154'
         '0b5c64016805a451ca440b679b3674b6'
         'abadf30dbc4695a1686814937e2cd829')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed -E 's/^csync2-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  sed -r 's,AC_PROG_CC$,AC_PROG_CC\nAC_PROG_CPP,' -i configure.ac
  autoreconf -fiv
}

build() {
  cd ${pkgname}

  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/csync2 \
    --localstatedir=/var
  make V=0
}

package() {
  cd ${pkgname}

  make DESTDIR="${pkgdir}" install
  install -Dm644 ../'csync2.socket' "$pkgdir/usr/lib/systemd/system/csync2.socket"
  install -Dm644 ../'csync2@.service' "$pkgdir/usr/lib/systemd/system/csync2@.service"
  install -Dm755 ../'csync2-rm-ssl-cert' "$pkgdir/usr/bin/csync2-rm-ssl-cert"
}
