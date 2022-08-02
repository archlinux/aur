# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Paul Nicholson <brenix@gmail.com>
# Contributor: Francesco Piccinno <stack.box@gmail.com>

pkgname=arpalert
pkgver=2.0.12
pkgrel=1
pkgdesc="Monitor ARP changes in ethernet networks"
arch=('i686' 'x86_64')
url="https://www.arpalert.org/"
license=('GPL')
depends=('libpcap')
source=("https://www.arpalert.org/src/${pkgname}-${pkgver}.tar.gz"
        "arpalert-flags.patch"
        "debian-fixes.patch")
sha256sums=('ca3ef80d89cbca64e5964cbbcdae8652dc69aa09e1a58f630f835a6349f489ab'
            '19d3f3c5e1ce4795aaea1ee625aa0098a2d331dc566f774a8dde395a058e354e'
            'f1604cdd991b0d363fd45f0b88d05e6ae5ddf09f343d63401a37e342f78e2e06')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/arpalert-flags.patch"
  patch -Np1 -i "${srcdir}/debian-fixes.patch"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/ --exec-prefix=/usr \
              --includedir=/usr/include \
              --datarootdir=/usr/share \
              --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # get rid of empty directories
  rm -rf "${pkgdir}/var/"{log,run}
}
