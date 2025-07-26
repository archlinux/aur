# Maintainer: crimist <aur at crim dot ist>

pkgname=beszel-agent-bin
pkgver=0.12.1
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
            '4b3c437ac2d8d61622ad23cd69977c23f3e7b9c74613c5dcabd96a37e7cc5b3a')
sha256sums_x86_64=('b89a0e79b151838183c66aa01977f3c03bdc50b2296e9ee43cea381b0aad4d1f')
sha256sums_aarch64=('4e463ba308506a3f020c89977f2a00e6f8f01bb0caf2b7a7ed5941224ad356a7')
sha256sums_armv7h=('dde4e5d820fe5cc0abaed5f46a0e41aa2585b676049620c94ab095562518926d')
sha256sums_armv6h=('dde4e5d820fe5cc0abaed5f46a0e41aa2585b676049620c94ab095562518926d')
sha256sums_mips64=('f1205208408051415b215bf020d567bfc2c7a76ec8c3737a9cfd973ed790ebc2')
sha256sums_riscv64=('84e5783b5aed3fb807cb5bcf50a48fc50a7445566bd8907402f23986e3ca5e85')

source_x86_64=("${url}/releases/download/v${pkgver}/beszel-agent_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/beszel-agent_linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/beszel-agent_linux_arm.tar.gz")
source_armv6h=("${source_armv7h[@]}")
source_mips64=("${url}/releases/download/v${pkgver}/beszel-agent_linux_mips64.tar.gz")
source_riscv64=("${url}/releases/download/v${pkgver}/beszel-agent_linux_riscv64.tar.gz")


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
