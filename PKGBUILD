# Maintainer: crimist <aur at crim dot ist>

pkgname=beszel-agent-bin
pkgver=0.18.3
pkgrel=1
pkgdesc="Beszel monitoring agent"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'mips64' 'riscv64')
url="https://github.com/henrygd/beszel"
license=('MIT')
optdepends=(
  'rocm-smi-lib: AMD GPU metrics via rocm-smi'
  'intel-gpu-tools: Intel GPU metrics via intel_gpu_top'
  'smartmontools: SMART metrics via smartctl')
provides=('beszel-agent')
conflicts=('beszel-agent')
backup=('etc/beszel-agent.conf')
source+=(
  'beszel-agent.service'
  'beszel-agent.sysusers'
  'beszel-agent.conf.example'
)
sha256sums=('5224235a819c4463ac7d7c468972fbb5ce73a0aaa6737a297ba8ef9395befbfd'
            '36386e355041676f72e55052ed02be90b1c307bfb5be9497b3e32d44e2982fac'
            'fe5029ca8180e202e814de8061c3282db5482da326ebe3775312773789fec0f2')
sha256sums_x86_64=('65b08fc27030f5f4a446b7f91b704fff680976063010d18244f7cdb795d6491f')
sha256sums_aarch64=('233e634349903c5deaed8244b28bd0953c14d0b57b47ea7f83c04d8cfce7dece')
sha256sums_armv7h=('01b4c76c776254b6b6d81c3171ce8989262cd8e4903f6cca2d50850752e5196f')
sha256sums_armv6h=('01b4c76c776254b6b6d81c3171ce8989262cd8e4903f6cca2d50850752e5196f')
sha256sums_mips64=('df4c6fdfdb7097ff94ad3a85f2c340ea6a50742feb91b13127ea1826b3ca6a98')
sha256sums_riscv64=('97186a79661649db17b3e8eff033f26c11533c29ef2db8d76036600c188ec98d')

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
