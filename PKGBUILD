# Maintainer: agony <27015 at riseup dot net>

pkgname=doltlite-bin
pkgver=0.51.13
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
sha256sums_x86_64=('0374d3f86cb4312bb0c3639d3ad27346268ea6aa896dc795fed0ffee793931e2'
                   'eda0eb617f045dd34aed4f9ba80a35c48e424955b0b2a038720ccf73889397ba')
sha256sums_aarch64=('ff0be7e201c8d84652f553fdcd3b309f9a9245ed2c80bd67438d5fb807ee83cd'
                    '516695946cdd976869c6337651df20eac23a60f6f67e3ba1389e534483fbc547')

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
