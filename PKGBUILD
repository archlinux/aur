# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=acmetool-bin
pkgver=0.0.67
pkgrel=3
pkgdesc="Command line tool for automatically acquiring certificates from ACME servers (official precompiled cgo binary)"
arch=('x86_64')
url="https://github.com/hlandau/acme"
license=('MIT')
provides=('acmetool')
conflicts=('acmetool' 'acmetool-git')
depends=(libcap)
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/hlandau/acme/releases/download/v${pkgver}/acmetool-v${pkgver}-linux_amd64_cgo.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/hlandau/rilts/master/licences/COPYING.MIT"
        "acmetool.conf"
        "acmetool.timer"
        "acmetool.service")
sha512sums=('6502616e9bc7ba8905774158b7a007a929ca67ceb6559bce27dbf162ceb38b23424d2c7ee2a89ca9b51575e292b1e4f157d72c48b4d8bd1039dabbd4ef313978'
            '68678af7dbe694b371171c8f19481670590c4fc659a367c8aabfcf8ecbcb9406ce2fa9ae3966bab21a5c447dd5663ee6162148e6dfac87707e0633c35782469e'
            '79133c499779c9610852e5b03e923d5d886cc56f274a73c91d6a27d0c52152975bdd95e3b3ccb4e7dd0e75d8072c1c1c4db54b5620f222297fed12a2fc223386'
            '60dc78a7404101606f6a3e1107c01ca84ab46e391b3085f98695ecdfe01470d38efabcda4c3b0e631d3ff82741c8c565f7f29cec3d40cad9c1eae090efeddfb9'
            'bc7d6750d115a0aa19bb73d50252fa4758ebb275bca466a513ddd5c857e9454b6c4c0c5cdaa285a316f81ad50f611ceb154afed81d9a76da737645ffe9129581')

package() {
  # add bin
  cd "${srcdir}/acmetool-v${pkgver}-linux_amd64_cgo"
  install -Dm755 -t "${pkgdir}/usr/bin" bin/acmetool

  # add documentation
  install -Dm644 -t "${pkgdir}/usr/share/man/man8" doc/acmetool.8
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md

  # add license
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"

  # copy systemd units (service and timer)
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" \
                     ${srcdir}/acmetool.service \
                     ${srcdir}/acmetool.timer

  # copy acmetool.tmpfiles
  install -Dm644 -t "${pkgdir}/usr/lib/tmpfiles.d/" ${srcdir}/acmetool.conf
}
