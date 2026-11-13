# Maintainer: crimist <aur at crim dot ist>

pkgname=beszel-agent-bin
pkgver=0.21.2
pkgrel=1
pkgdesc="Beszel monitoring agent"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'mips64' 'riscv64')
url="https://github.com/henrygd/beszel"
license=('MIT')
depends_x86_64=('glibc')
optdepends=(
  'rocm-smi-lib: AMD GPU metrics via rocm-smi'
  'intel-gpu-tools: Intel i915 driver GPU metrics via intel_gpu_top'
  'smartmontools: SMART metrics via smartctl'
  'nvtop: Generic and Intel xe driver GPU metrics via nvtop'
  'zfs-utils: ZFS pool and dataset metrics'
  'pacman-contrib: Pending package update counts via checkupdates')
provides=('beszel-agent')
conflicts=('beszel-agent')
backup=('etc/beszel-agent.conf')
source+=(
  'beszel-agent.service'
  'beszel-agent.sysusers'
  'beszel-agent.conf.example'
)
sha256sums=('4fbe92f62dbc1832371d69abd522ab609cb45c62a18ff48331cec60823fb3dda'
            '36386e355041676f72e55052ed02be90b1c307bfb5be9497b3e32d44e2982fac'
            '6e992c72a857fe49f562a6dc58a6b6c62d991bf122b43b80ae1c5ae6636ae7ce')
sha256sums_x86_64=('55e2b860b681bbabb647b34c415580c95365e76db05ab70832ce0abd8a89f788')
sha256sums_aarch64=('4f5dcea27c3f9e2ba30218e7d7039f4df548ded1c470df9eefe00975722aad13')
sha256sums_armv7h=('57075d4ae419a50d5d378a23dbc40fef12cf9dedaa4fd2f3fce23620d6ca0a3f')
sha256sums_armv6h=('57075d4ae419a50d5d378a23dbc40fef12cf9dedaa4fd2f3fce23620d6ca0a3f')
sha256sums_mips64=('275c5c8e328e52cc1fb756ee14f0265e4b2134ebf75401b4789457dec36442ba')
sha256sums_riscv64=('3e33574939a96f6f5a0000af4bc106c00ac8cb86febb47d3b0de3b4f89193999')

source_x86_64=("beszel-agent_linux_amd64_glibc-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel-agent_linux_amd64_glibc.tar.gz")
source_aarch64=("beszel-agent_linux_arm64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel-agent_linux_arm64.tar.gz")
source_armv7h=("beszel-agent_linux_arm-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel-agent_linux_arm.tar.gz")
source_armv6h=("${source_armv7h[@]}")
source_mips64=("beszel-agent_linux_mips64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel-agent_linux_mips64.tar.gz")
source_riscv64=("beszel-agent_linux_riscv64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel-agent_linux_riscv64.tar.gz")

package() {
  cd "$srcdir"

  install -d "$pkgdir/opt/beszel-agent"
  tar -xz -C "$pkgdir/opt/beszel-agent" -f beszel-agent_linux_* --strip-components=0
  chown -R root:root "$pkgdir/opt/beszel-agent"
  chmod 0755 "$pkgdir/opt/beszel-agent/beszel-agent"
  install -Dm644 "$pkgdir/opt/beszel-agent/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/beszel-agent/beszel-agent "$pkgdir/usr/bin/beszel-agent"

  install -Dm644 beszel-agent.service "$pkgdir/usr/lib/systemd/system/beszel-agent.service"

  install -Dm644 beszel-agent.sysusers "$pkgdir/usr/lib/sysusers.d/beszel-agent.conf"

  install -Dm640 beszel-agent.conf.example "$pkgdir/etc/beszel-agent.conf"
  install -Dm644 beszel-agent.conf.example "$pkgdir/usr/share/doc/${pkgname}/beszel-agent.conf.example"
}
