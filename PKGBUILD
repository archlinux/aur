# Maintainer: crimist <aur at crim dot ist>

pkgname=beszel-agent-bin
pkgver=0.12.2
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
sha256sums_x86_64=('98ea49ae68200c5ea4cb6f2237c60d99ebe06cce4dd42469e4742aecf0871196')
sha256sums_aarch64=('cf0f8f0d486a391e2c2cc4c721d665b1835236f3ea1b05e71da7afc35498aac7')
sha256sums_armv7h=('d9c9be1f9d024ade7096347214cdebb5955ec9f7d1f88a01e4ef27f486d92959')
sha256sums_armv6h=('d9c9be1f9d024ade7096347214cdebb5955ec9f7d1f88a01e4ef27f486d92959')
sha256sums_mips64=('733b8feb34a81df78d5c69eeccad9088a48f4df3096bce9f38aec01fb9e43c0c')
sha256sums_riscv64=('298796d27d54dd17bb67ecb4dfd00a06332ee7557d2491e5e8931e43fdb73382')

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
