# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=libasn1c-git
pkgver=0.9.37.r0.gde520a4
pkgrel=2
pkgdesc="runtime library of Lev Walkin's asn1c split out as separate library"
url="https://cgit.osmocom.org/libasn1c"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('BSD-2-Clause')
depends=('talloc')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver}"
          'libasn1c.so=1-64')
conflicts=("${pkgname%-git}")
source=("git+https://gitea.osmocom.org/cellular-infrastructure/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  autoreconf -f -i
}

build() {
  cd "${pkgname%-git}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
