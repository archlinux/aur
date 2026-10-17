# Maintainer: kewl fft <kewl@archlinux.org>

pkgname=prysm-beacon-chain
pkgver=7.3.0
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
sha256sums=('53d58c9f5ded3b65b146e96d7ee293297fee547555cd08ddb0cdaff013f93207')

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
