# Maintainer: kewl fft <kewl@archlinux.org>

pkgname=prysm-beacon-chain
pkgver=7.1.7
pkgrel=1
pkgdesc="Prysm Ethereum consensus client (beacon chain node)"
arch=('x86_64')
url="https://github.com/OffchainLabs/prysm"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('git' 'bazelisk' 'cmake' 'openssl' 'gmp' 'protobuf')
provides=('prysm-beacon-chain')
conflicts=('prysm-beacon-chain-bin' 'prysm' 'prysm-bin')
options=(!strip !buildflags)
source=("prysm::git+https://github.com/OffchainLabs/prysm.git#tag=v${pkgver}")
sha256sums=('598b4e6c3de14ae59619f4be65e7d88fe3d4b70796bd8638fd1c3a491b9b7076')

build() {
  cd "$srcdir/prysm"
  bazel build //cmd/beacon-chain:beacon-chain --config=release \
    --copt=-march=native --copt=-mtune=native \
    --copt=-O3 --copt=-flto --linkopt=-flto
}

package() {
  cd "$srcdir/prysm"
  install -Dm755 bazel-bin/cmd/beacon-chain/beacon-chain_/beacon-chain \
    "$pkgdir/usr/bin/prysm-beacon-chain"
}
