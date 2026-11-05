# Maintainer: agony <27015 at riseup dot net>

pkgname=doltlite-bin
pkgver=0.51.9
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
sha256sums_x86_64=('f9e2797658437900677cb88618c6d1bd920023abae5e644392d06c0740fc9ce7'
                   '3ed03a19df5dffdfcbfb92ccb7a9917d1967f0d8f6c400de645892ca2862ee43')
sha256sums_aarch64=('b24e9d0aa6413e879432dfe8a78a19e179c70766b49677c4dd03b66d0dff7031'
                    '18bff89606205a9ba5f5d5a73b10ee5f21bd014c11376ec04c48edd5c7532f12')

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
