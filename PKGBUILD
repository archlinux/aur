# Maintainer: bbaa <bbaa@bbaa.moe>
# Contributor: cap153 <1536989047@qq.com>

_pkgname=EasyTier
pkgbase=easytier
pkgname=($pkgbase $pkgbase-core $pkgbase-cli $pkgbase-web)
pkgver=2.3.1
pkgrel=1
pkgdesc="A simple, decentralized mesh VPN with WireGuard support."
arch=("x86_64" "aarch64")
url="https://github.com/EasyTier/EasyTier"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'protobuf' 'rust-bindgen' 
             'nodejs' 'pnpm') # for embeded web
source=(
  "$_pkgname-$pkgver.tar.gz::https://github.com/EasyTier/EasyTier/archive/refs/tags/v$pkgver.tar.gz"
  "easytier.service"
  "config.toml")
sha256sums=('9f6f52d789ebe4d017365bb6b1a7f0e18063c13196ce58d825e490d7fba9716d'
            'c3a88a02c96ccbed58908d91da89338c2d093ec3e571f3861c36a5cd0a92bb21'
            '05518beea8b047d5e9b9adb14f26f85a91e4eea81ead7eeb4743f8978e1fd842')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
  pnpm -r install
}

build() {
  cd "$_pkgname-$pkgver"
  pnpm -r --filter "./easytier-web/*" build
  CFLAGS+=' -ffat-lto-objects' # fix for mimalloc linking
  CFLAGS+=' -std=gnu17' # fix build mimalloc on gcc15
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --verbose --release --features=embed
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

