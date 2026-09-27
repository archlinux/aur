# Maintainer: forvkusa <forvkusa+aur at csie dot ntu dot edu dot tw>
# Portions adapted from https://github.com/chadsr/aur-packages/tree/main/openshell
# Copyright (c) 2026 Ross
# MIT license. See LICENSE.packaging.

pkgname=openshell-bin
pkgver=0.1.1
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

sha256sums=('c4be3acebe12527d7de689933d98329b4065f8c50cd929d0365584eafe6c20dd'
            'a267ac371807966057f0e5d595d6da72d04c3d6cacd604fa6e66ef275084fcfe'
            'd0fde0899d0df90c5bf2dc0054b8bcbe701198e3643239ffe77bd6a164c23d35'
            '19eece9f13ecf050fb74a35e0767076aa30feecd6d58ad49701d19e05e695ad4'
            '707c93399d6af66b8f4479e5c9a4e1958958f883324f033aa7eae8d2708b8c13'
            'b21382e3e0ce1f394e66eca7ef8903c36214c9c267c5784d1ad58d96a1e6b95a')
sha256sums_x86_64=('822e8e462944366cb1b3d3b023be20a675016714666124b05ad8699a03c43143'
                   '297dd4464b1c9fe1a3385a1d10a2bbd6a8e96ebbd12c6635d3879b5fe346e008'
                   '635652023d97fc50fe64e8bcae85e8a7684352704aa70af168dc4d7e7ac707f9'
                   '8bbdc9f57b671430be89331ed58a7f04537a9f3896aaaf9b5e06cb0600d7e071')
sha256sums_aarch64=('36f0d737386ca9d7c4b8e7f4803741d051f03c2f605879d184105dc52918a8d1'
                    '733c1344cf6ad2301d763098486748e800c257369569685aee796d7461aa7ff1'
                    '1dfe320ab8eae95f18ba072756c673df58b0460f5c8f38f28be7eb36bdb6f4d8'
                    'b7ebb57e16c99f8326dc545f893c6436b5ff36c46c4de8ecef96802fa3c2fd0a')

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
