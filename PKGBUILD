# Maintainer: crimist <aur at crim dot ist>

pkgname=beszel-agent-bin
pkgver=0.12.3
pkgrel=1
pkgdesc="Beszel monitoring agent"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'mips64' 'riscv64')
url="https://github.com/henrygd/beszel"
license=('MIT')
optdepends=('rocm-smi-lib: AMD GPU usage, temperature, and power draw via rocm-smi')
provides=('beszel-agent')
conflicts=('beszel-agent')
backup=('etc/beszel-agent.conf')
source+=(
  'beszel-agent.service'
  'beszel-agent.sysusers'
  'beszel-agent.tmpfiles'
  'beszel-agent.conf.example'
)
sha256sums=('a6c4b7aa094a1399d4dbaebb001ff4dff0c9448b0a51bab9ce1822eabdc170d5'
            '03f82109a98648c49417c3e0dd3990ae56e6010b33c7fc9c8e0263c80f090f69'
            '823448a308c7329431ae713ab98a5c8cea2a00528177f3d31aa3f5eb6c4a751e'
            'fe5029ca8180e202e814de8061c3282db5482da326ebe3775312773789fec0f2')
sha256sums_x86_64=('c024f482fd07ed23918385146afc8e38f8d1534fe7f6f2f373eb5b371166c6ac')
sha256sums_aarch64=('2e145548aaf36dd8a8c32bd60a7f98ca1b7454857308c6b9a3c3757f7571f4e1')
sha256sums_armv7h=('d985bbefa352f4e96dd5414454cf13d6361a3e7480896b6a83553bd49d3a4bb3')
sha256sums_armv6h=('d985bbefa352f4e96dd5414454cf13d6361a3e7480896b6a83553bd49d3a4bb3')
sha256sums_mips64=('0b0952a1de3ea39bb173cf786e628ea1bbedde7172e4b51892db29fba267204b')
sha256sums_riscv64=('2b6c4edb3e9e38709ea6838970063f040ab4b4011212f0c7b2f70f8809e05e40')

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
  printf "\n\033[1;32m>>\033[0m Edit /etc/beszel-agent.conf (set KEY, PORT, etc.) then\n"
  printf "   sudo systemctl enable --now beszel-agent.service\n\n"
}
