# Maintainer: Konrad Tegtmeier <konrad.tegtmeier+aur@gmail.com>
# Contributor: Wojtek Gawroński <afronski@gmail.com>

pkgname=nomad-bin
pkgver=0.9.4
pkgrel=1
pkgdesc='A distributed, highly available, datacenter-aware scheduler'
arch=('x86_64')
url="https://nomadproject.io/"
license=('MPL2')
optdepends=('docker: enables docker driver'
            'java-runtime: enables java driver'
            'qemu-headless: enables qemu driver'
            'rkt: enables rkt driver')
provides=('nomad')
conflicts=('nomad')
backup=(etc/nomad/{server,client}.conf)
source=("https://releases.hashicorp.com/nomad/${pkgver}/nomad_${pkgver}_linux_amd64.zip"
        nomad-{server,client}.{service,hcl})
sha256sums=('e0cdd0d787bb925910151f9e38fd6daa9590f1bf08d0c6703b7f544875b58c11'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
  # binary
  install -Dm0755 nomad "${pkgdir}/usr/bin/nomad"

  # data
  install -Ddm750 -o root -g root "${pkgdir}/var/lib/nomad"

  # configs & services
  install -Ddm750 "${pkgdir}/etc/nomad"
  for type in server client; do
    install -Dm644 "nomad-${type}.hcl" "${pkgdir}/etc/nomad/${type}.conf"
    install -Dm644 "nomad-${type}.service" \
            "${pkgdir}/usr/lib/systemd/system/nomad-${type}.service"
  done
}
