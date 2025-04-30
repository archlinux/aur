# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
pkgname=libosmo-gprs-git
pkgver=0.2.0.r3.g341f26f
pkgrel=1
pkgdesc="Osmocom GPRS libraries"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/libosmo-gprs"
license=('GPL-2.0-or-later AND AGPL-3.0-or-later')
depends=('libosmocore-git')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}"
          'libosmo-csn1.so=1-64'
          'libosmo-gprs-gmm.so=1-64'
          'libosmo-gprs-llc.so=1-64'
          'libosmo-gprs-rlcmac.so=1-64'
          'libosmo-gprs-sm.so=1-64'
          'libosmo-gprs-sndcp.so=1-64')
source=("git+https://gitea.osmocom.org/osmocom/libosmo-gprs.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  autoreconf -i
  ./configure --prefix=/usr \
              --exec-prefix=/usr \
              --bindir=/usr/bin \
              --sbindir=/usr/bin \
              --datadir=/usr/share \
              --libexecdir=/usr/lib \
              --localstatedir=/var \
              --docdir=/usr/share/doc/libosmo-gprs \
              --libdir=/usr/lib/
  make
}

check() {
  cd "$srcdir/${pkgname%-git}"
  # FIXME: LTO breaks unit tests (-Wl,-wrap)
  # https://osmocom.org/issues/4123
  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88643
  #make check
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
