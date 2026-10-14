# Maintainer: forvkusa <forvkusa+aur at csie dot ntu dot edu dot tw>
# Portions adapted from https://github.com/chadsr/aur-packages/tree/main/openshell
# Copyright (c) 2026 Ross
# MIT license. See LICENSE.packaging.

pkgname=openshell-bin
pkgver=0.1.4
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
            '1608a2dc3b66ddfa9b5550f190fbb7693777aba529748b176cbe34e0fbb21998'
            '707c93399d6af66b8f4479e5c9a4e1958958f883324f033aa7eae8d2708b8c13'
            'b21382e3e0ce1f394e66eca7ef8903c36214c9c267c5784d1ad58d96a1e6b95a')
sha256sums_x86_64=('2b65178e62e1ece1d90d482555e9f1f98ff0296e058409b33418104b6333df07'
                   '43f43554bcaabff2a8147444410d1ad0b7f51bdae7589c2d249982bc8b260b91'
                   '832b65c7af487ddbf57cf84cc0edd55de8b7bdef021c6e9e93b0ee8c5acd1571'
                   '43f1abd8416a1ae6298a39daa7a62b242f55f12f677dadb51b66bffe41e05519')
sha256sums_aarch64=('1cd6e63597e1947c44a753bf5352f949e8d8d02e344af92ab899b7c111112d95'
                    'd0f8a2045e613f612a542abe860e497906169c2483093a9bd52e41737df397f0'
                    'd1100446dd8c105ac59c00e9f6dfb9266d9a1aadf36cb9cabbc775514ff705f2'
                    '7396892beaef4f05199e8ccfc49d49b434b1e1c9a00eda78a6e7c8f6e76b0198')

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
