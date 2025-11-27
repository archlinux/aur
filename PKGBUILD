# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='keylightd-bin'
pkgver=0.0.47
pkgrel=1
pkgdesc='Daemon and CLI tool for managing HTTP-based Key Lights, including Elgato models'
url='https://github.com/jmylchreest/keylightd'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('keylightd')
conflicts=('keylightd')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_arm64.tar.gz"
                 "${pkgname}_${pkgver}_aarch64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_arm64_sbom.spdx.json")
sha256sums_aarch64=('b24a3146c83d27550607428f2f326454bdcd516424ac74858e7cd529d2a4c89e'
                    '748b28f71384d836822ad8f88ec26ec588dabd6f5d67652de1e7db050545a39b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_amd64.tar.gz"
               "${pkgname}_${pkgver}_x86_64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_amd64_sbom.spdx.json")
sha256sums_x86_64=('8e2b79cbe608a54b5cede0f482ed14bd6f321feec090f9c6b80f5dea33815440'
                   '6045a7330ffc3ad9b8b1b2969cefe136b15220b7f311ddaed4d7db4d3bcc58a2')

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
