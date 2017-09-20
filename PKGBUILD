# Current Maintainer: Daniel Haß <aur@hass.onl>
# Maintainer: Marcel Hollerbach <mail@bu5hm4n.de>
# Maintainer: James Kittsmiller (AJSlye) <james@kittsmiller.com>
pkgname=anna
pkgdesc="Spawny with a efl greeter"
pkgver=0.2
pkgrel=1
url="http://github.com/marcelhollerbach/anna"
arch=('i686' 'x86_64')
license=('BSD')
depends=('efl' 'protobuf-c')
makedepends=('git' 'meson')
provides=("$pkgname=$pkgver")
source=("https://github.com/marcelhollerbach/anna/archive/v${pkgver}.tar.gz" 'spawny.sysusers' 'anna.install' 'spawny.tmpfiles')
install=${pkgname}.install
sha256sums=('5265f4dfae274c1f6cf0e0ee8fa223829a874f6e0a1ac4dc06fbd01d106f8130'
            'a4b1f5af59834422b83ed955f9062a838b234a14e58168b80061bd6fd66508a1'
	    '44e271ab0614ecff1077b22b51228056385729228f4112a33d7f3cd2a20b3478'
	    '01c36957bbd928aab112ee79b37c705c2f8a0e21a8394fd63fd7afae08644b56')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  rm -rf ./*
  meson --buildtype=release --prefix=/usr ..
  ninja all
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  ninja test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  DESTDIR="$pkgdir" ninja install
  install -D -m644 ${srcdir}/spawny.sysusers ${pkgdir}/usr/lib/sysusers.d/spawny.conf
  install -D -m644 ${srcdir}/spawny.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/spawny.conf
}
