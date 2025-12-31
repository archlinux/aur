# Maintainer: Azur84 <Azur84@outlook.fr>
pkgname=pandora_launcher
pkgver=2.3.0
pkgrel=1
pkgdesc="Pandora is a modern Minecraft launcher that balances ease-of-use with powerful instance management features"
arch=(
  'x86_64'
  'amd64'
)
url="http://pandora.moulberry.com/"
license=('MIT')
depends=(
  'libxkbcommon-x11'
  'vulkan-tools'
  'wayland'
  'libxkbcommon'
  'libxcb'
  'vulkan-icd-loader'
  'vulkan-driver'
)
makedepends=(
  'cargo'
  'mold'
  'xcb-util'
  'git'
)
optdepends=(
  'flite: minecraft narrator support'
)
source=(
  "$pkgname::git+https://github.com/Moulberry/PandoraLauncher.git#tag=v$pkgver"
  "$pkgname.desktop"
)
sha256sums=(
  '8ee2e772fa0ee4e86b8577747e7200f8e9b7f7f61bf9d604d6b634cf5d41ec1e'
  '39dbc50e690690e3111aa7e98fefc2686e4993f5bf062b0346f8dc0964cd439b'
)

export RUSTUP_TOOLCHAIN=stable

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd "$pkgname"
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="-C link-arg=-fuse-ld=mold"
  cargo build --release --locked --target $(rustc --print host-tuple)
}

package() {
  install -d "$pkgdir/usr/"{bin,share/{pixmaps,applications}}

  install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname/target/$(rustc --print host-tuple)/release/$pkgname"
  install "$pkgname/package/icon_256x256.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
