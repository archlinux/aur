# Maintainer: Audrius <aur@kaud.eu>
pkgname=prusa-connect-bin
pkgver=0.1.0beta.2
pkgrel=4
pkgdesc='Self-hosted Prusa 3D printer management server with web UI (upstream binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/prusa3d/prusa-connect'
license=('LicenseRef-OCL-1.1-Micro-1-NoSaaS-1-SWAtt-1')
depends=('ca-certificates' 'systemd')
provides=("prusa-connect=${pkgver}")
conflicts=('prusa-connect-local' 'prusa-connect')
backup=('var/lib/prusa-connect/config/config.yaml')
options=('!strip' '!debug')
_upstream_version=0.1.0-beta.2
_release="${url}/releases/download/v${_upstream_version}"
source=(
  "prusa-connect-${_upstream_version}-LICENSE::https://raw.githubusercontent.com/prusa3d/prusa-connect/v${_upstream_version}/LICENSE"
  "prusa-connect-${_upstream_version}-config.yaml::${_release}/config.yaml"
  "prusa-connect-${_upstream_version}.service::https://raw.githubusercontent.com/prusa3d/prusa-connect/v${_upstream_version}/deploy/systemd/prusa-connect.service"
  '10-arch.conf'
  'prusa-connect.sysusers'
  'prusa-connect.tmpfiles'
  'config.yaml'
)
source_x86_64=("prusa-connect-${_upstream_version}-x86_64::${_release}/prusa_connect_amd64")
source_aarch64=("prusa-connect-${_upstream_version}-aarch64::${_release}/prusa_connect_aarch64")
sha256sums=('8f97e70668257c18db6f5086fdaa1569d92a674f487e0d2791ce2c0acdf6ab92'
            '6d9b5d9c9b52b64f1a97cb97c165f12878f6245087e1f96f73f5e76417fa99da'
            '9b76f1991a1073284f55368f45eb655b64ecc3811d7c3c520ed3110c5e4d5cb5'
            '58b90eb67107d1edaf88b590e61451680a0c2baa8b42288bd652d6560ce310c0'
            '8cc3a116eb3f2a592615e649847dfd8b12528612eacf310afdf11dbc5244ad15'
            'b131b13c953611a4d235bcc761cd14cac738b4c302988c515db4bfeb8b0df541'
            'c31c5498c45941ee6c80b6fd9d529dba4fbd23192d63ec49878f6498f65f0551')
sha256sums_x86_64=('e55093f1da8e4a6836f64d48562a92ed0a1401c382925007dd80913a996b677c')
sha256sums_aarch64=('a4370baf739508a1fa13e0be9f4ae6bad8d1a8aa4d9f117530f9cb2901294715')

package() {
  install -Dm755 "prusa-connect-${_upstream_version}-${CARCH}" "${pkgdir}/usr/bin/prusa-connect"
  install -Dm644 "prusa-connect-${_upstream_version}.service" "${pkgdir}/usr/lib/systemd/system/prusa-connect.service"
  install -Dm644 10-arch.conf "${pkgdir}/usr/lib/systemd/system/prusa-connect.service.d/10-arch.conf"
  install -Dm644 prusa-connect.sysusers "${pkgdir}/usr/lib/sysusers.d/prusa-connect.conf"
  install -Dm644 prusa-connect.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/prusa-connect.conf"
  # Upstream backup requires a regular config file next to the wizard state.
  install -d -m700 "${pkgdir}/var/lib/prusa-connect" "${pkgdir}/var/lib/prusa-connect/config"
  install -m644 config.yaml "${pkgdir}/var/lib/prusa-connect/config/config.yaml"
  install -d "${pkgdir}/etc/prusa-connect"
  ln -s /var/lib/prusa-connect/config/config.yaml "${pkgdir}/etc/prusa-connect/config.yaml"
  install -Dm644 "prusa-connect-${_upstream_version}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "prusa-connect-${_upstream_version}-config.yaml" "${pkgdir}/usr/share/doc/${pkgname}/config.example.yaml"
}
