# Maintainer: bbaa <bbaa@bbaa.moe>
_pkgname=EasyTier
pkgname=easytier-git
conflicts=("easytier")
provides=("easytier")
pkgver=2.0.3.r0.g4dca25d
pkgrel=1
pkgdesc="A simple, decentralized mesh VPN with WireGuard support."
arch=('x86_64')
url="https://github.com/EasyTier/EasyTier"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo' 'protobuf')
backup=('etc/easytier/config.toml')
source=("git+https://github.com/EasyTier/EasyTier.git" "easytier.service" "config.toml")
sha256sums=('SKIP'
            '8bf506d141f3a7a716a9b483c8d469ad4e727f85c9664a35dbf467ae2c27513f'
            '05518beea8b047d5e9b9adb14f26f85a91e4eea81ead7eeb4743f8978e1fd842')

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  CFLAGS+=' -ffat-lto-objects' # fix for mimalloc linking
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --verbose --release
}

package() {
  install -dm755 "$pkgdir/var/lib/easytier"
  install -Dm644 "easytier.service" "$pkgdir/usr/lib/systemd/system/easytier.service"
  install -Dm644 "config.toml" "$pkgdir/etc/easytier/config.toml"
  cd "$_pkgname"
  install -Dm755 "target/release/easytier-cli" "$pkgdir/usr/bin/easytier-cli"
  install -Dm755 "target/release/easytier-core" "$pkgdir/usr/bin/easytier-core"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/easytier/LICENSE"
}
