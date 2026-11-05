# Maintainer: agony <27015 at riseup dot net>

pkgname=doltlite-bin
pkgver=0.51.8
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
sha256sums_x86_64=('9cb16ab4d8d8f010381835cd8c27e5bafb2c3f41e0e1ceaa9330bd442ede2e7a'
                   '442e8e69e45dac83937833e08b9e5023e19b050fb1975c8d8335b3df8d0f6064')
sha256sums_aarch64=('a7abee81a028df10d23e982d19d2d6efb3b03480db39612574648cd5fe4c6e4e'
                    '54428384e675d4740c2f064385bde71d6973229eed2cc3ce668fa3d7226cae09')

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
