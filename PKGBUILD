# Maintainer: forvkusa <forvkusa+aur at csie dot ntu dot edu dot tw>
# Portions adapted from https://github.com/chadsr/aur-packages/tree/main/openshell
# Copyright (c) 2026 Ross
# MIT license. See LICENSE.packaging.

pkgname=openshell-bin
pkgver=0.1.3
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
            'a44c5fcec95dab22dc8e125c620378913207d06593b1e26fa70e9ac0fb07799f'
            '707c93399d6af66b8f4479e5c9a4e1958958f883324f033aa7eae8d2708b8c13'
            'b21382e3e0ce1f394e66eca7ef8903c36214c9c267c5784d1ad58d96a1e6b95a')
sha256sums_x86_64=('ed08ea7874c47f22d6e5dcc4b27d9ef1ef5d2060f83035b35ff725d5160830a3'
                   'da8dce943fe01cce90243b2bf2587c71a243e4d641a4b616528829b681ced198'
                   '8ab28e18e425f4160e99744ba74bb2a2d32a7f158ca55a2536e79f11ea1a8cf5'
                   '22593640c6179eb87413ab099832fbd133d3a6a4979904d27679e7da6d80a0cb')
sha256sums_aarch64=('07687dacefc52bc73b01943f5b58f7a5082c1ceaa228461b9a2a78023b8057c0'
                    '801214322227f64f2d3faa6989daaa5e6cd9ef1ab768b5860496deeb1158c27b'
                    '47fb89fee5997f5dfb1911ec95201346690b46580df0220458f418e4c3c6782b'
                    '4426ee0992989060eb5987ad7072feb3eb6aecf5a628ad0284c3d7ad5f39974b')

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
