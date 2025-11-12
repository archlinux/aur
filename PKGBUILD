# Maintainer: crimist <aur at crim dot ist>

pkgname=beszel-agent-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Beszel monitoring agent"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'mips64' 'riscv64')
url="https://github.com/henrygd/beszel"
license=('MIT')
optdepends=(
  'rocm-smi-lib: AMD GPU metrics via rocm-smi'
  'intel-gpu-tools: Intel GPU metrics via intel_gpu_top')
provides=('beszel-agent')
conflicts=('beszel-agent')
backup=('etc/beszel-agent.conf')
source+=(
  'beszel-agent.service'
  'beszel-agent.sysusers'
  'beszel-agent.tmpfiles'
  'beszel-agent.conf.example'
)
sha256sums=('e9642e11a04ee6953bff30a2ea212015bfcf1ebc7aff4bf033bfb13200a43aca'
            '03f82109a98648c49417c3e0dd3990ae56e6010b33c7fc9c8e0263c80f090f69'
            '823448a308c7329431ae713ab98a5c8cea2a00528177f3d31aa3f5eb6c4a751e'
            'fe5029ca8180e202e814de8061c3282db5482da326ebe3775312773789fec0f2')
sha256sums_x86_64=('d4a2a6dc77a3944ecdf2d69827d84c1a1ecfb17747a55ec56cbcaa94275f974a')
sha256sums_aarch64=('08f9a53f047b1e7543e0ad888824ef81028174632d569328d41b39d708f43423')
sha256sums_armv7h=('caa77f28886aa6dc6effdb24ad15c5d811bba2a7170b8522725dbfe651ea1a03')
sha256sums_armv6h=('caa77f28886aa6dc6effdb24ad15c5d811bba2a7170b8522725dbfe651ea1a03')
sha256sums_mips64=('82d7f02c4a5c641f9923f9cdc459db4f9bcd12674fb355af26dde1cab001451d')
sha256sums_riscv64=('ad332fe236e54a493641c4b9e6848ba06b5a7fb424d590549e52a1c976898dae')

source_x86_64=("beszel-agent_linux_amd64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel-agent_linux_amd64.tar.gz")
source_aarch64=("beszel-agent_linux_arm64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel-agent_linux_arm64.tar.gz")
source_armv7h=("beszel-agent_linux_arm-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel-agent_linux_arm.tar.gz")
source_armv6h=("${source_armv7h[@]}")
source_mips64=("beszel-agent_linux_mips64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel-agent_linux_mips64.tar.gz")
source_riscv64=("beszel-agent_linux_riscv64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/beszel-agent_linux_riscv64.tar.gz")

package() {
  cd "$srcdir"

  install -d "$pkgdir/opt/beszel-agent"
  tar -xz -C "$pkgdir/opt/beszel-agent" -f beszel-agent_linux_* --strip-components=0
  chmod 0755 "$pkgdir/opt/beszel-agent/beszel-agent"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/beszel-agent/beszel-agent "$pkgdir/usr/bin/beszel-agent"

  install -Dm644 beszel-agent.service "$pkgdir/usr/lib/systemd/system/beszel-agent.service"

  install -Dm644 beszel-agent.sysusers "$pkgdir/usr/lib/sysusers.d/beszel-agent.conf"
  install -Dm644 beszel-agent.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/beszel-agent.conf"

  install -Dm640 beszel-agent.conf.example "$pkgdir/etc/beszel-agent.conf"
  install -Dm644 beszel-agent.conf.example "$pkgdir/usr/share/doc/${pkgname}/beszel-agent.conf.example"
}

post_install() {
  printf "\033[1;32m>>\033[0m Edit /etc/beszel-agent.conf (set KEY, PORT, etc.) then:\n"
  printf "   sudo systemctl enable --now beszel-agent.service\n"
  printf "\033[1;32m>>\033[0m To enable Intel GPU metrics, allow intel_gpu_top to be run without root:\n"
  printf "   sudo setcap cap_perfmon=ep /usr/bin/intel_gpu_top\n"
}
