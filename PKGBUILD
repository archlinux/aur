# Maintainer: Timo Sarawinski <timo@it-kraut.net>

pkgname=mcproxy
pkgver=1.1.1
pkgrel=2
pkgdesc="Multicast Proxy for IGMP/MLD"
arch=('any')
url=http://mcproxy.realmv6.org
license=('GPL')
depends=('qt5-base')
makedepends=('doxygen')
provides=('mcproxy')
source=('https://github.com/mcproxy/mcproxy/archive/v1.1.1.tar.gz'
        'mcproxy.conf'
        'mcproxy.service'
        'fix-checksum-calculation.patch')
sha256sums=('07f09ce2726e2300b5df6a053a5cc62613932183bbab7b503feec60cea65897a'
            '7c0c8b43104a3136a2628196e6914a1aefa413a6b0e43c5eb88f986206f2eb10'
            '6699a93e60b5b33ec412c9cc94fd3755b1e479546eb5787475fc96c4b5823c93'
            'c5006fe4f708ac10337e145b72417d3b51218324ba24346cb8959d01af4a5de3')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
  sed -i 's/target.path = \/usr\/local\/bin/target.path = \/usr\/bin/g' mcproxy.pro
  patch -p1 -i ../../fix-checksum-calculation.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
  qmake 
  make doc 
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
  make check
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
  local _pkg_dir=${pkgdir}/
  INSTALL_ROOT=${_pkg_dir} make install
  install -Dm644 ${srcdir}/mcproxy.conf ${pkgdir}/etc/mcproxy/mcproxy.conf
  install -Dm644 ${srcdir}/mcproxy.service "${pkgdir}/usr/lib/systemd/system/mcproxy.service"
}

