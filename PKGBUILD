# Maintainer: agony <27015 at riseup dot net>

pkgname=doltlite-bin
pkgver=0.51.12
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
sha256sums_x86_64=('a196362987ddaf1b8c2e26893fd421b6d9a37fa1979232e82ed02e214bcb475c'
                   '44a01087ca843a2460da22c4109c7a59c22f9248abfc05e147fb86375f29d87d')
sha256sums_aarch64=('c3a983aff3b9cdd9861b75005bab32793c5d0ea51b9b0b968ba9d2cea25237d6'
                    'cf367be70f1beadb462801bbf19f866a943c86ffd18a28e056e1fa6049d77740')

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
