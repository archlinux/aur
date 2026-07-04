# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='keylightd-bin'
pkgver=0.1.8
pkgrel=1
pkgdesc='Daemon and CLI tool for managing HTTP-based Key Lights, including Elgato models'
url='https://github.com/jmylchreest/keylightd'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('keylightd')
conflicts=('keylightd')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_arm64.tar.gz"
                 "${pkgname}_${pkgver}_aarch64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_arm64_sbom.spdx.json")
sha256sums_aarch64=('6f12f4cb329c914aa7ba21395e94512ea1c5babe4d6d926ecc049e7bf938c7bd'
                    'cf45dc0dbd995f88eed5caeac40666f6dc76f4c3684582621213a94dfab53086')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_amd64.tar.gz"
               "${pkgname}_${pkgver}_x86_64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_amd64_sbom.spdx.json")
sha256sums_x86_64=('c59e6036e1f94b5db6b00bb8a0318e03ad429525cd8d775fb70735b0b5c02270'
                   '8b707f14fd9b355ad1d880070144cdf0fa7fd511ae10c22d15cf2b53422cac91')

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
