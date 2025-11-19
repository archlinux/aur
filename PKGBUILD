# Maintainer: John Mylchreest <jmylchreest@gmail.com>

pkgname='keylightd-bin'
pkgver=0.0.42
pkgrel=1
pkgdesc='Daemon and CLI tool for managing HTTP-based Key Lights, including Elgato models'
url='https://github.com/jmylchreest/keylightd'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('keylightd')
conflicts=('keylightd')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_arm64.tar.gz"
                 "${pkgname}_${pkgver}_aarch64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_arm64_sbom.spdx.json")
sha256sums_aarch64=('23046d73878879337e2ef818ebf38e3fc5c8ff1356c15a8d987f5bfee7fffb7c'
                    '81eab130cce050f90be1b7ba6117384c755e227e305b28b7b0fe2efcbcb2ffca')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_amd64.tar.gz"
               "${pkgname}_${pkgver}_x86_64_sbom.spdx.json::https://github.com/jmylchreest/keylightd/releases/download/v${pkgver}/keylightd_${pkgver}_linux_amd64_sbom.spdx.json")
sha256sums_x86_64=('f9d712e29d09c6eed61237473ea14c07ea9f1c9592336c7fb83aa7835d751258'
                   '7ad5b26cf5927be530cda7e63f49f5ea357ab3edd4ea5f6aeebe237500b85bec')

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
