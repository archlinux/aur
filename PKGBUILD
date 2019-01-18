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
        "arpalert-flags.patch")
sha256sums=('ca3ef80d89cbca64e5964cbbcdae8652dc69aa09e1a58f630f835a6349f489ab'
            'c4166a3e74478ccda7603c15f729640b0a3afb16b0d4c0c7854e5ccb675f46b4')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/arpalert-flags.patch"
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
