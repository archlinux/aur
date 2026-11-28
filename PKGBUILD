# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='keylightd-bin'
pkgver=0.2.2
pkgrel=1
pkgdesc='Daemon and CLI tool for managing HTTP-based Key Lights, including Elgato models'
url='https://github.com/jmylchreest/keylightd'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('keylightd')
conflicts=('keylightd')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_arm64.tar.gz"
                 "${pkgname}_${pkgver}_aarch64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_arm64_sbom.spdx.json")
sha256sums_aarch64=('f214443f3a306c79d4059398be316221b3aed8dfdee0f2d0c894086aa67c697f'
                    '4c0d62d1db7598f7a62d65235416604656062989bbecae78064152f3a2aef1df')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_amd64.tar.gz"
               "${pkgname}_${pkgver}_x86_64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_amd64_sbom.spdx.json")
sha256sums_x86_64=('3316373b63d9040dcacffcb2547435efc4a2961bca2ae134d5dfae0e42dc8a44'
                   'd9bae5e72ec1fc4d0d29f1e8125a9f212c3a20456253551cf04eca24e210a185')

package() {
  # binaries
  install -Dm755 "./keylightd" "${pkgdir}/usr/bin/keylightd"
  install -Dm755 "./keylightctl" "${pkgdir}/usr/bin/keylightctl"

  # systemd service
  install -Dm644 "./contrib/systemd/keylightd.service" "${pkgdir}/usr/lib/systemd/system/keylightd.service"

  # license
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/keylightd-bin/LICENSE"

  # documentation
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/keylightd-bin/README.md"

  # SBOM
  install -Dm644 "${srcdir}/${pkgname}_${pkgver}_${CARCH}_sbom.spdx.json" "${pkgdir}/usr/share/doc/keylightd-bin/sbom.spdx.json"

  # create keylightd user and group
  install -dm755 "${pkgdir}/usr/lib/sysusers.d"
  echo 'u keylightd - "Key Light Daemon" /var/lib/keylightd' > "${pkgdir}/usr/lib/sysusers.d/keylightd.conf"
  echo 'g keylightd -' >> "${pkgdir}/usr/lib/sysusers.d/keylightd.conf"
}
