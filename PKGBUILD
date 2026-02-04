# Maintainer: Azur84 <Azur84@outlook.fr>
pkgname=pandora-launcher
_pkgrustname=pandora_launcher
_pkgtarname=PandoraLauncher
pkgver=2.7.3
pkgrel=2
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
)
optdepends=(
  'flite: minecraft narrator support'
  'orca: minecraft screen reader'
  'gamemode: gamemode support'
  'mangohud: mangohud support'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Moulberry/PandoraLauncher/archive/refs/tags/v$pkgver.tar.gz"
  "$pkgname.desktop"
)
sha256sums=('89a1f154d31486b9020a21ac4a0833a82d3bc7d5738a5183df1261e11b0a6ad4'
            'f9ab75791b696e27569c5bc44b8d325f356a6e36efe4eb9c2e227cb2ba95b6b3')

export RUSTUP_TOOLCHAIN=stable

prepare() {
  cd "$_pkgtarname-$pkgver"
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd "$_pkgtarname-$pkgver"
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="-C link-arg=-fuse-ld=mold"
  cargo build --release --locked --target $(rustc --print host-tuple)
}

package() {
  install -d "$pkgdir/usr/"{bin,share/{pixmaps,applications}}

  install -Dm755 "$_pkgtarname-$pkgver/target/$(rustc --print host-tuple)/release/$_pkgrustname" "$pkgdir/usr/bin/$pkgname"
  install "$_pkgtarname-$pkgver/package/windows.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$_pkgtarname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
