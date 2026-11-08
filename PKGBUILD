# Maintainer: agony <27015 at riseup dot net>

pkgname=doltlite
pkgver=0.51.10
pkgrel=1
pkgdesc='SQLite fork with Git-style version control'
arch=('x86_64' 'aarch64')
url='https://github.com/dolthub/doltlite'
license=('Apache-2.0 AND blessing')
depends=('glibc' 'readline' 'zlib')
source=("${url}/releases/download/v${pkgver}/${pkgname}-autoconf-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-LICENSE.md::https://raw.githubusercontent.com/dolthub/doltlite/v${pkgver}/LICENSE.md")
sha256sums=('0763c478ac3a7b79a42c18259b05cc17e7ec9c72af9a3aaaa77dfc6baa10bdf0'
            '29665b418abe9d65f3bdd723ca27336a998477566e9426d436530ede0e65efcf')

build() {
  cd "${pkgname}-autoconf-${pkgver}"
  mkdir -p build
  cd build
  ../configure --prefix=/usr --enable-readline --disable-rpath
  make doltlite doltlite-remotesrv doltlite-lib
}

check() {
  cd "${pkgname}-autoconf-${pkgver}/build"
  [[ "$(./doltlite :memory: 'SELECT dolt_version();')" == "v${pkgver}" ]]
  [[ "$(./doltlite :memory: 'SELECT doltlite_engine();')" == 'prolly' ]]
}

package() {
  cd "${pkgname}-autoconf-${pkgver}/build"
  install -Dm755 doltlite doltlite-remotesrv -t "${pkgdir}/usr/bin"
  install -Dm644 doltlite.h ../src/doltlite_remotesrv.h -t "${pkgdir}/usr/include"
  install -Dm755 libdoltlite.so "${pkgdir}/usr/lib/libdoltlite.so.0"
  ln -s libdoltlite.so.0 "${pkgdir}/usr/lib/libdoltlite.so"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
