# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='keylightd-bin'
pkgver=0.1.4
pkgrel=1
pkgdesc='Daemon and CLI tool for managing HTTP-based Key Lights, including Elgato models'
url='https://github.com/jmylchreest/keylightd'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('keylightd')
conflicts=('keylightd')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_arm64.tar.gz"
                 "${pkgname}_${pkgver}_aarch64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_arm64_sbom.spdx.json")
sha256sums_aarch64=('9b69a1c489ea9427eec0b160daddc1bf8befc50ef6dccf5e08b3803177779b5e'
                    'f761e41f10d8120d49b213f7c9c5ee5fabc8b403cf729e41287360b6a5533a0d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_amd64.tar.gz"
               "${pkgname}_${pkgver}_x86_64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_amd64_sbom.spdx.json")
sha256sums_x86_64=('c2b6f19f1f6bb9a5dee9de81c733197332cd51fe2413abe458967d7b67301701'
                   '100bfba19abf09842df5dddebb51ec20cf3e399327ac0dc421226bb0a7400e28')

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
