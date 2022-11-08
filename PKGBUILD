# Maintainer: Douglas Chimento <dchimento@gmail.com>
pkgname=sui-git
_name=sui
pkgver=r0.15.0
pkgrel=1
pkgdesc='Next-generation smart contract platform with high throughput'
url='https://github.com/MystenLabs/sui'
makedepends=('cargo' 'gcc' 'curl' 'clang' 'openssl' 'git')
conflicts=('sui-bin')
provides=('sui')
backup=('etc/default/sui' 'etc/sui/fullnode.yaml')
license=('Apache')
arch=('any')
source=("git+https://github.com/MystenLabs/sui.git#branch=devnet"
       	"fullnode.yaml" "sui.env" "sui.service" "sui.tmpfiles" "sui.sysusers")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

#_nproc=$(($(nproc)/2))
_nproc=2
[[ ${_nproc} < 1 ]] && _nproc=1

pkgver() {
  cd "$srcdir/$_name"
  printf "r%s" "$(git tag --sort=-taggerdate    --list 'devnet-*' | sed s/devnet-// | head -1)"
}

prepare() {
  cd "$srcdir/${_name}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu" 
}

package() {
  cd "$srcdir/${_name}/target/release"
  install -Dm0755 narwhal-benchmark-client ${pkgdir}/usr/bin/narwhal-benchmark-client
  install -Dm0755 narwhal-node ${pkgdir}/usr/bin/narwhal-node
  install -Dm0755 sui-tool ${pkgdir}/usr/bin/sui-tool
  install -Dm0755 rpc-server ${pkgdir}/usr/bin/sui-rpc-server
  install -Dm0755 sui-node ${pkgdir}/usr/bin/sui-node
  install -Dm0755 sui-rosetta ${pkgdir}/usr/bin/sui-rosetta
  install -Dm0755 sui ${pkgdir}/usr/bin/sui
  install -Dm0755 sui-cluster-test ${pkgdir}/usr/bin/sui-cluster-test
  install -Dm0755 sui-faucet ${pkgdir}/usr/bin/sui-faucet
  install -Dm0755 stress ${pkgdir}/usr/bin/sui-stress
  install -Dm0755 sui-test-validator ${pkgdir}/usr/bin/sui-test-validator

  cd "$srcdir/${_name}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_name}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
  install -Dm644 "LICENSE-docs" "${pkgdir}/usr/share/licenses/${_name}/LICENSE-docs"

  cd $srcdir

  install -Dm644 "${_name}.service" "${pkgdir}/usr/lib/systemd/system/${_name}.service"
  install -Dm644 "${_name}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_name}.conf"
  install -Dm644 "${_name}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_name}.conf"
  install -d "${pkgdir}/var/lib/sui"
  curl -L -s "https://github.com/MystenLabs/sui-genesis/raw/main/devnet/genesis.blob" > "${pkgdir}/var/lib/sui/genesis.blob"
  install -Dm644 "fullnode.yaml" "${pkgdir}/etc/sui/fullnode.yaml"
  install -Dm644 "sui.env" "${pkgdir}/etc/default/sui"
}

build() {
  cd "$srcdir/$_name"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --profile release --frozen --release --all-features --jobs $_nproc
}
