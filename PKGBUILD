# Maintainer: crimist <aur at crim dot ist>

pkgname=beszel-agent-bin
pkgver=0.11.1
pkgrel=2
pkgdesc="Beszel monitoring agent"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'mips64' 'riscv64')
url="https://github.com/henrygd/beszel"
license=('MIT')
depends=()
optdepends=('rocm-smi-lib: AMD GPU usage, temperature, and power draw via rocm-smi')
makedepends=('curl' 'tar')
provides=('beszel-agent')
conflicts=('beszel-agent')
backup=('etc/beszel-agent.conf')
source+=(
  'beszel-agent.service'
  'beszel-agent.sysusers'
  'beszel-agent.tmpfiles'
  'beszel-agent.conf.example'
)
sha256sums=('8fb68253d5ec6aeaf6750d3fedd77b031ad181af79cc490edb0977da8adf8280'
            '03f82109a98648c49417c3e0dd3990ae56e6010b33c7fc9c8e0263c80f090f69'
            '823448a308c7329431ae713ab98a5c8cea2a00528177f3d31aa3f5eb6c4a751e'
            '4b3c437ac2d8d61622ad23cd69977c23f3e7b9c74613c5dcabd96a37e7cc5b3a')
sha256sums_x86_64=('b9b2cae9def36d19b4e280821b0eba25a15f05d9e7d73d7e90a49c595002315f')
sha256sums_aarch64=('6d98267117dc1bc3c5da44d088b721365c2d041fdae7f35e89b14498be979a92')
sha256sums_armv7h=('1c96352f80194cddc054d29f51b49c0773e57834d4387407bb5490f5d5b2844e')
sha256sums_armv6h=('1c96352f80194cddc054d29f51b49c0773e57834d4387407bb5490f5d5b2844e')
sha256sums_mips64=('70ff49599a815d1f64abbfdcbce8244f4cce17f7c758e83a8e488b29e0f2c4f5')
sha256sums_riscv64=('23eedaeab747819733e345572967c8497129a4249fb31a3827613d26e63209b6')

source_x86_64=("beszel-agent_linux_amd64.tar.gz::${url}/releases/download/v${pkgver}/beszel-agent_linux_amd64.tar.gz")
source_aarch64=("beszel-agent_linux_arm64.tar.gz::${url}/releases/download/v${pkgver}/beszel-agent_linux_arm64.tar.gz")
source_armv7h=("beszel-agent_linux_arm.tar.gz::${url}/releases/download/v${pkgver}/beszel-agent_linux_arm.tar.gz")
source_armv6h=("${source_armv7h[@]}")
source_mips64=("beszel-agent_linux_mips64.tar.gz::${url}/releases/download/v${pkgver}/beszel-agent_linux_mips64.tar.gz")
source_riscv64=("beszel-agent_linux_riscv64.tar.gz::${url}/releases/download/v${pkgver}/beszel-agent_linux_riscv64.tar.gz")


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
