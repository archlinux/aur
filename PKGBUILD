# Maintainer: bbaa <bbaa@bbaa.moe>
_pkgname=EasyTier
pkgbase=easytier-git
pkgname=(easytier-git easytier-core-git easytier-cli-git easytier-web-git)
conflicts=(easytier-bin)
pkgver=2.2.4.r32.g9943098
pkgrel=1
pkgdesc="A simple, decentralized mesh VPN with WireGuard support."
arch=('x86_64')
url="https://github.com/EasyTier/EasyTier"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo' 'protobuf' 'rust-bindgen')
source=("git+https://github.com/EasyTier/EasyTier.git" "easytier.service" "config.toml")
sha256sums=('SKIP'
            'df7e33920d5b126aecfa40b5aa38b407fcd6f3762f0fdd87ae0823737940c4d0'
            '05518beea8b047d5e9b9adb14f26f85a91e4eea81ead7eeb4743f8978e1fd842')

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  CFLAGS+=' -ffat-lto-objects' # fix for mimalloc linking
  CFLAGS+=' -std=gnu17' # fix build mimalloc on gcc15
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --verbose --release
}

package_easytier-git() {
  provides=("easytier")
  conflicts=("easytier" "easytier-bin")
  pkgdesc="Meta package for EasyTier, A simple, decentralized mesh VPN with WireGuard support."
  depends=('easytier-core-git' 'easytier-cli-git' 'easytier-web-git')
}

package_easytier-core-git() {
  provides=("easytier-core")
  conflicts=("easytier-core")
  backup=('etc/easytier/config.toml')
  install -dm755 "$pkgdir/var/lib/easytier"
  install -Dm644 "easytier.service" "$pkgdir/usr/lib/systemd/system/easytier.service"
  install -Dm644 "config.toml" "$pkgdir/etc/easytier/config.toml"
  cd "$_pkgname"
  install -Dm755 "target/release/easytier-core" "$pkgdir/usr/bin/easytier-core"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/easytier/LICENSE"
}

package_easytier-cli-git() {
  provides=("easytier-cli")
  conflicts=("easytier-cli")
  cd "$_pkgname"
  install -Dm755 "target/release/easytier-cli" "$pkgdir/usr/bin/easytier-cli"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/easytier/LICENSE-cli"
}

package_easytier-web-git() {
  provides=("easytier-web")
  conflicts=("easytier-web")
  cd "$_pkgname"
  install -Dm755 "target/release/easytier-web" "$pkgdir/usr/bin/easytier-web"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/easytier/LICENSE-web"
}

