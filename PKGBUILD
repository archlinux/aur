# Maintainer: Jens Adam <jra@byte.cx>

pkgname=zmap
pkgver=1.2.1
pkgrel=2
pkgdesc='Fast network scanner designed for Internet-wide network surveys'
url='https://zmap.io/'
license=('Apache')
arch=('i686' 'x86_64')
depends=('gmp' 'hiredis' 'json-c' 'libpcap')
makedepends=('byacc-noconflict' 'cmake' 'gengetopt')
backup=('etc/zmap/blacklist.conf' 'etc/zmap/zmap.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zmap/zmap/archive/v${pkgver}.tar.gz")
md5sums=('3e740b54c88c29bb03494b986f440b51')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  cmake -DWITH_JSON=ON -DWITH_REDIS=ON
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}/src
  install -D zmap "${pkgdir}"/usr/bin/zmap
  install -Dm644 zmap.1 "${pkgdir}"/usr/share/man/man1/zmap.1
  install -d "${pkgdir}"/etc/zmap
  install -m644 ../conf/* "${pkgdir}"/etc/zmap
  cd ..
  for F in AUTHORS CHANGELOG INSTALL README; do
    install -Dm644 ${F} "${pkgdir}"/usr/share/doc/zmap/${F}
  done
  cp -a examples "${pkgdir}"/usr/share/doc/zmap
}
