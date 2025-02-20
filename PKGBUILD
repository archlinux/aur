# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-ggsn-git
pkgver=1.13.0.r0.gba3d890
pkgrel=1
pkgdesc="Open Source implementation of a GGSN (Gateway GPRS Support Node)"
url="https://osmocom.org/projects/openggsn"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-only AND LGPL-2.1-or-later AND MIT')
depends=('libosmocore-git' 'talloc')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver}"
          'libgtp.so=11-64')
conflicts=("${pkgname%-git}")
backup=('etc/osmocom/osmo-ggsn.cfg')
source=("git+https://gitea.osmocom.org/cellular-infrastructure/${pkgname%-git}.git"
        'LICENSE-MIT')
sha256sums=('SKIP'
            '323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f')

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

check() {
  cd "${pkgname%-git}"
  make check
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=${pkgdir} install

  # /usr/bin/gtp-echo-responder is licensed under the MIT
  install -Dm644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

# vim:set ts=2 sw=2 et:
