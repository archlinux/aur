# Maintainer: bbaa <bbaa@bbaa.moe>
# Contributor: cap153 <1536989047@qq.com>

_pkgname=EasyTier
pkgbase=easytier
pkgname=($pkgbase $pkgbase-core $pkgbase-cli $pkgbase-web)
pkgver=2.1.2
pkgrel=1
pkgdesc="A simple, decentralized mesh VPN with WireGuard support."
arch=("x86_64" "aarch64")
url="https://github.com/EasyTier/EasyTier"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'protobuf')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/EasyTier/EasyTier/archive/refs/tags/v$pkgver.tar.gz" "easytier.service" "config.toml")
sha256sums=('524f13b25a9d9fd93d2d47eb4366cc8d4d36af90ac1b14345e9af84941e5a9a3'
            '8bf506d141f3a7a716a9b483c8d469ad4e727f85c9664a35dbf467ae2c27513f'
            '05518beea8b047d5e9b9adb14f26f85a91e4eea81ead7eeb4743f8978e1fd842')

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

package_easytier() {
  pkgdesc="Meta package for EasyTier, A simple, decentralized mesh VPN with WireGuard support."
  depends=('easytier-core' 'easytier-cli' 'easytier-web')
}

package_easytier-core() {
  backup=('etc/easytier/config.toml')
  install -dm755 "$pkgdir/var/lib/easytier"
  install -Dm644 "easytier.service" "$pkgdir/usr/lib/systemd/system/easytier.service"
  install -Dm644 "config.toml" "$pkgdir/etc/easytier/config.toml"
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/easytier-core" "$pkgdir/usr/bin/easytier-core"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/easytier/LICENSE"
}


package_easytier-cli() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/easytier-cli" "$pkgdir/usr/bin/easytier-cli"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/easytier/LICENSE-cli"
}

package_easytier-web() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/easytier-web" "$pkgdir/usr/bin/easytier-web"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/easytier/LICENSE-web"
}

