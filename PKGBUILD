# Maintainer: kewl fft <kewl@archlinux.org>

pkgname=prysm-beacon-chain
pkgver=7.1.6
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
sha256sums=('92c6b16803257e9560e3f00000dd0e32c48b75e2ca5ad127272a1988a379e559')

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
