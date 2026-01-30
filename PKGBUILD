# Maintainer: Azur84 <Azur84@outlook.fr>
pkgname=pandora-launcher
_pkgname=pandora_launcher
pkgver=2.6.1
pkgrel=1
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
  'orca: minecraft screen reader'
  'gamemode: gamemode support'
  'mangohud: mangohud support'
)
source=(
  "$pkgname::git+https://github.com/Moulberry/PandoraLauncher.git#tag=v$pkgver"
  "$pkgname.desktop"
)
sha256sums=('195abe92278efdfbd9b03acbaf5b134bd88c028b01b6e185500b9f13c5bbe4a4'
            'f9ab75791b696e27569c5bc44b8d325f356a6e36efe4eb9c2e227cb2ba95b6b3')

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
  install "$pkgname/package/windows.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
