# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=dagu-bin
pkgver=2.7.4
pkgrel=1
pkgdesc="Lightweight workflow orchestration engine with web UI"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/dagucloud/dagu"
license=('GPL-3.0-or-later')
depends=('glibc')
optdepends=(
  'docker: Docker step executor'
  'openssh: SSH step executor'
  'git: Git sync and Git operations'
)
provides=(dagu)
conflicts=(dagu)
options=('!strip')
backup=('etc/dagu/environment')
install=dagu-bin.install
source=(
  'dagu.service'
  'dagu.sysusers'
  'dagu.tmpfiles'
  'dagu.environment'
)

_base_url="https://github.com/dagucloud/dagu/releases/download/v${pkgver}"

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_base_url}/dagu_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_base_url}/dagu_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::${_base_url}/dagu_${pkgver}_linux_armv7.tar.gz")
source_armv6h=("${pkgname}-${pkgver}-armv6h.tar.gz::${_base_url}/dagu_${pkgver}_linux_armv6.tar.gz")

sha256sums=('f5069a8dd8026e7d248ac0c6fc13251b29381d9bb76fe50cf1bed15434f5ddfa'
            '71faf0a14465a71adaa0fc63b3f99b2b940e7d774609986791c3647fccddc2bf'
            'd478707f5152360f83d77ae4b9be90a5b08534bec9f4da8f0bf9e4e203a77902'
            '482d51d6950397cb3a2bbbd571066fcaee283251d991e974b83c2a9d45e85c57')
sha256sums_x86_64=('fadf2946f6f6ac523f47a5c2f9ae51fe7f262be30ebbb48098caa8264f3f716c')
sha256sums_aarch64=('d73ea385d26b8d90ec4393c9783139a21c8be4c72ca5e6569408d7ff0301a178')
sha256sums_armv7h=('ce3fe5f7ca6748c73e3b01daf1931a12468c273b2d3e52b6c42b36e50d29b334')
sha256sums_armv6h=('c4dc1a2a3f34ff17a468bf9b6fb85cff059d51acfe1c1ee3ad7ce5a94b1b1b20')


package() {
  install -Dm755 dagu "$pkgdir/usr/bin/dagu"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Systemd integration
  install -Dm644 dagu.service "$pkgdir/usr/lib/systemd/system/dagu.service"
  install -Dm644 dagu.sysusers "$pkgdir/usr/lib/sysusers.d/dagu.conf"
  install -Dm644 dagu.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/dagu.conf"
  install -Dm644 dagu.environment "$pkgdir/etc/dagu/environment"

  # Shell completions
  ./dagu completion bash > dagu.bash
  ./dagu completion zsh > _dagu
  ./dagu completion fish > dagu.fish
  install -Dm644 dagu.bash "$pkgdir/usr/share/bash-completion/completions/dagu"
  install -Dm644 _dagu "$pkgdir/usr/share/zsh/site-functions/_dagu"
  install -Dm644 dagu.fish "$pkgdir/usr/share/fish/vendor_completions.d/dagu.fish"
}
