
# Maintainer: bbaa <bbaa@bbaa.moe>
# Contributor: cap153 <1536989047@qq.com>

_pkgname=EasyTier
pkgname=easytier
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple, decentralized mesh VPN with WireGuard support."
arch=("x86_64" "aarch64")
url="https://github.com/EasyTier/EasyTier"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo' 'protobuf')
backup=('etc/easytier/config.toml')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/EasyTier/EasyTier/archive/refs/tags/v$pkgver.tar.gz" "easytier.service" "config.toml")
sha256sums=('f5b4d99fe44ce28b7b046b160748438cf050043d8243c792cdbdbe1a0c0fd30f'
            '8bf506d141f3a7a716a9b483c8d469ad4e727f85c9664a35dbf467ae2c27513f'
            'd25d57584779870938bfe71914e823a74b99b7c91f1cdf6dcb8076ebeb29e6ae')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  CFLAGS+=' -ffat-lto-objects' # fix for mimalloc linking
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --verbose --release
}

package() {
  install -dm755 "$pkgdir/var/lib/easytier"
  install -Dm644 "easytier.service" "$pkgdir/usr/lib/systemd/system/easytier.service"
  install -Dm644 "config.toml" "$pkgdir/etc/easytier/config.toml"
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/easytier-cli" "$pkgdir/usr/bin/easytier-cli"
  install -Dm755 "target/release/easytier-core" "$pkgdir/usr/bin/easytier-core"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/easytier/LICENSE"
}
