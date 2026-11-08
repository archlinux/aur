# Maintainer: agony <27015 at riseup dot net>

pkgname=doltlite-bin
pkgver=0.51.10
pkgrel=1
pkgdesc='SQLite fork with Git-style version control (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/dolthub/doltlite'
license=('Apache-2.0 AND blessing')
depends=('glibc' 'zlib')
makedepends=('patchelf')
provides=("doltlite=${pkgver}")
conflicts=('doltlite')
_release="${url}/releases/download/v${pkgver}"
source=("doltlite-${pkgver}-LICENSE.md::https://raw.githubusercontent.com/dolthub/doltlite/v${pkgver}/LICENSE.md")
source_x86_64=("${_release}/doltlite-tools-linux-x64-${pkgver}.zip"
               "${_release}/doltlite-lib-linux-x64-${pkgver}.zip")
source_aarch64=("${_release}/doltlite-tools-linux-arm64-${pkgver}.zip"
                "${_release}/doltlite-lib-linux-arm64-${pkgver}.zip")
sha256sums=('29665b418abe9d65f3bdd723ca27336a998477566e9426d436530ede0e65efcf')
sha256sums_x86_64=('489e8a5daa12c21656a1248b595611ea5f373df3c0b48b43d8e6394219fade94'
                   '9b46e75464ccf65ff2c8e86da1e1f09d26305130ead14cf12ffa94f3a253f427')
sha256sums_aarch64=('573238dcfe68eaade4325706e6341e2880822988f757a86fa831d867de662f03'
                    'ab6e19342d92cfc2dba01e268a417c56e79627f7171f514a104ceec99b56647e')

package() {
  cd doltlite-tools-linux-*-"${pkgver}"
  install -Dm755 doltlite doltlite-remotesrv -t "${pkgdir}/usr/bin"
  cd ../doltlite-lib-linux-*-"${pkgver}"
  install -Dm644 doltlite.h doltlite_remotesrv.h -t "${pkgdir}/usr/include"
  install -Dm755 libdoltlite.so "${pkgdir}/usr/lib/libdoltlite.so.0"
  ln -s libdoltlite.so.0 "${pkgdir}/usr/lib/libdoltlite.so"
  install -Dm644 "${srcdir}/doltlite-${pkgver}-LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  patchelf --remove-rpath "${pkgdir}"/usr/bin/doltlite{,-remotesrv} "${pkgdir}/usr/lib/libdoltlite.so.0"
}
