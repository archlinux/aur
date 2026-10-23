# Maintainer: crimist <aur at crim dot ist>

pkgname=beszel-agent-bin
pkgver=0.21.1
pkgrel=1
pkgdesc="Beszel monitoring agent"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'mips64' 'riscv64')
url="https://github.com/henrygd/beszel"
license=('MIT')
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
            'fe5029ca8180e202e814de8061c3282db5482da326ebe3775312773789fec0f2')
sha256sums_x86_64=('19d48bd31a129d0c2b08399690e9262d4533fda551a1d46d3246ae1422e4412f')
sha256sums_aarch64=('a6ea544976b9a74398ac88d5da5bb96813d9a2e353a37bbfdb6a903fa8ba1838')
sha256sums_armv7h=('3f917bb1bc1f3713f9478e7f054996d75ee0f414c39dfadb5ff9b2c4a06147bc')
sha256sums_armv6h=('3f917bb1bc1f3713f9478e7f054996d75ee0f414c39dfadb5ff9b2c4a06147bc')
sha256sums_mips64=('748f003e859bc448521843d63a7ec35b2c9509982d1d89dbe3b5e73b5239ed76')
sha256sums_riscv64=('4081791d6760df8222495dfa0fb10d641613687cfbedb507cf81daaf318f166c')

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

post_install() {
  printf "* Configuration can be set at /etc/beszel-agent.conf (KEY, PORT, etc.)\n"
  printf "\033[1;31m\!\033[0m Mobile NVIDIA GPUs may not be able to enter RTD3 which will reduce battery life. Consider setting NVML=true on such devices.\n"
}
