# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=osmo-gapk-git
pkgver=v0.4.r97.2d5fbe4
pkgrel=2
pkgdesc="Osmocom GSM Audio Pocket Knife"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/gapk"
license=('GPL')
depends=('libosmocore' 'talloc' 'alsa-lib' 'gsm' 'opencore-amr')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
source=("${pkgname%-git}::git+https://gitea.osmocom.org/osmocom/gapk.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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
              --libdir=/usr/lib/
#             --enable-gsmhr (makedepends += python)
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR=$pkgdir install
}
