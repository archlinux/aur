# Maintainer: Azur84 <Azur84@outlook.fr>
pkgname=pandora-launcher
_pkgname=pandora_launcher
pkgver=2.5.0
pkgrel=3
pkgdesc="A modern Minecraft launcher that balances ease-of-use with powerful instance management features."
arch=('x86_64')
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
  'openssl'
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
sha256sums=('2441c9f37770da0c187bbf97842f8f76b63be06bd41b5d6351459b7ef5d36c56'
            '1688c2ba9457367aa252473fb99a91f9ec40494d6de6068528797e3c58c54768')

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

  install -Dm755 "$pkgname/target/$(rustc --print host-tuple)/release/$_pkgname" "$pkgdir/usr/bin/$pkgname"
  install "$pkgname/package/icon_256x256.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
