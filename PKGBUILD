# Maintainer: forvkusa <forvkusa+aur at csie dot ntu dot edu dot tw>
# Portions adapted from https://github.com/chadsr/aur-packages/tree/main/openshell
# Copyright (c) 2026 Ross
# MIT license. See LICENSE.packaging.

pkgname=openshell-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='The safe, private runtime for autonomous AI agents.'
arch=('x86_64' 'aarch64')
url='https://github.com/NVIDIA/OpenShell'
license=('Apache-2.0')
install=openshell.install
makedepends=('pandoc')
depends=('glibc' 'libgcc')
optdepends=(
  'bash-completion: Bash completion support'
  'podman: Podman compute driver'
  'docker: Docker compute driver'
  'e2fsprogs: ext4 filesystem tools for VM images'
  'iproute2: network configuration tools'
  'nftables: network filtering tools'
)
optdepends_x86_64=(
  'qemu-system-x86: QEMU virtual machine support'
)
provides=("openshell=$pkgver")
conflicts=('openshell')
options=('!strip' '!debug')

source=(
  "LICENSE-$pkgver::https://raw.githubusercontent.com/NVIDIA/OpenShell/v$pkgver/LICENSE"
  "openshell-gateway-$pkgver.service::https://raw.githubusercontent.com/NVIDIA/OpenShell/v$pkgver/deploy/deb/openshell-gateway.service"
  "openshell-$pkgver.1.md::https://raw.githubusercontent.com/NVIDIA/OpenShell/v$pkgver/deploy/man/openshell.1.md"
  "openshell-gateway-$pkgver.8.md::https://raw.githubusercontent.com/NVIDIA/OpenShell/v$pkgver/deploy/man/openshell-gateway.8.md"
  "gateway-$pkgver.toml.default::https://raw.githubusercontent.com/NVIDIA/OpenShell/v$pkgver/deploy/rpm/gateway.toml.default"
  'openshell.install'
)
source_x86_64=(
  "openshell-$pkgver-x86_64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-x86_64-unknown-linux-musl.tar.gz"
  "openshell-gateway-$pkgver-x86_64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-gateway-x86_64-unknown-linux-gnu.tar.gz"
  "openshell-sandbox-$pkgver-x86_64-musl.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-sandbox-x86_64-unknown-linux-musl.tar.gz"
  "openshell-driver-vm-$pkgver-x86_64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-driver-vm-x86_64-unknown-linux-gnu.tar.gz"
)
source_aarch64=(
  "openshell-$pkgver-aarch64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-aarch64-unknown-linux-musl.tar.gz"
  "openshell-gateway-$pkgver-aarch64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-gateway-aarch64-unknown-linux-gnu.tar.gz"
  "openshell-sandbox-$pkgver-aarch64-musl.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-sandbox-aarch64-unknown-linux-musl.tar.gz"
  "openshell-driver-vm-$pkgver-aarch64.tar.gz::https://github.com/NVIDIA/OpenShell/releases/download/v$pkgver/openshell-driver-vm-aarch64-unknown-linux-gnu.tar.gz"
)

sha256sums=('d07c0367e2861e7fe70fa1b679f879f4fa2f9138ade4457d44ecf8b2e135bb45'
            'a267ac371807966057f0e5d595d6da72d04c3d6cacd604fa6e66ef275084fcfe'
            'd0fde0899d0df90c5bf2dc0054b8bcbe701198e3643239ffe77bd6a164c23d35'
            '3d90d393c7e51b4d985a6ecc236f70a1bdeeca84763789812f1aed9add7d118e'
            '707c93399d6af66b8f4479e5c9a4e1958958f883324f033aa7eae8d2708b8c13'
            'b21382e3e0ce1f394e66eca7ef8903c36214c9c267c5784d1ad58d96a1e6b95a')
sha256sums_x86_64=('3856ac7b6b2e33d6c8ab72a1036444156516e7303da85a9b13f661a2aa63bd2d'
                   'c32085d64ccef037121c0e87bee1a57d6e886d77f77bb8b260cb08f0a6cce6a3'
                   '01d4a311929a9a2a4a0c149340d0ac570ee49aeee9fcf56699735db8d9c52128'
                   '87bd26e5f49acdc4c6165aa463ad3964c40d5ef066125f99956f7e8eea0a0f65')
sha256sums_aarch64=('cb923d08703b966f7e0e6b1483ed4ba6ed77bc10812c5502bcc1fb6ee0f6ad59'
                    'a41701c2dc7ac1aba13b0d48678dcb95090055aa42a2103b2ae712fb79338b1a'
                    '903c5bf487295ddcd6a48af389496fc274d4abfe4f54e44d82b121c8f766737e'
                    '3d4a95329550472477ad1f5c108b10de194490e3404d2261e5556201a0d2d33d')

build() {
  pandoc -s -t man "$srcdir/openshell-$pkgver.1.md" -o "$srcdir/openshell.1"
  pandoc -s -t man "$srcdir/openshell-gateway-$pkgver.8.md" -o "$srcdir/openshell-gateway.8"

  "$srcdir/openshell" completions bash >"$srcdir/openshell.bash"
  "$srcdir/openshell" completions zsh >"$srcdir/_openshell"
  "$srcdir/openshell" completions fish >"$srcdir/openshell.fish"
}

check() {
  "$srcdir/openshell" --version | grep -Fx "openshell $pkgver"
  "$srcdir/openshell-gateway" --version | grep -Fx "openshell-gateway $pkgver"
  "$srcdir/openshell-sandbox" --version | grep -Fx "openshell-sandbox $pkgver"
  "$srcdir/openshell-driver-vm" --version | grep -Fx "openshell-driver-vm $pkgver"
}

package() {
  install -Dm644 "$srcdir/gateway-$pkgver.toml.default" "$pkgdir/usr/share/openshell-gateway/gateway.toml.default"
  install -Dm644 "$srcdir/openshell.1" "$pkgdir/usr/share/man/man1/openshell.1"
  install -Dm644 "$srcdir/openshell-gateway.8" "$pkgdir/usr/share/man/man8/openshell-gateway.8"
  install -Dm644 "$srcdir/openshell.bash" "$pkgdir/usr/share/bash-completion/completions/openshell"
  install -Dm644 "$srcdir/_openshell" "$pkgdir/usr/share/zsh/site-functions/_openshell"
  install -Dm644 "$srcdir/openshell.fish" "$pkgdir/usr/share/fish/vendor_completions.d/openshell.fish"

  install -Dm755 "$srcdir/openshell" "$pkgdir/usr/bin/openshell"
  install -Dm755 "$srcdir/openshell-gateway" "$pkgdir/usr/bin/openshell-gateway"
  install -Dm755 "$srcdir/openshell-sandbox" "$pkgdir/usr/bin/openshell-sandbox"
  install -Dm755 "$srcdir/openshell-driver-vm" "$pkgdir/usr/bin/openshell-driver-vm"
  install -Dm644 "$srcdir/openshell-gateway-$pkgver.service" "$pkgdir/usr/lib/systemd/user/openshell-gateway.service"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
