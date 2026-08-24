# Maintainer: Azur84 <Azur84@outlook.fr>
pkgname=pandora-launcher
_pkgrustname=pandora_launcher
_pkgtarname=PandoraLauncher
_pkggithuburl=https://github.com/Moulberry/PandoraLauncher
pkgver=5.5.2
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
  'libgcc'
  'glibc'
  'libseccomp'
)
makedepends=(
  'cargo'
  'xcb-util'
  'fontconfig'
)
optdepends=(
  'flite: minecraft narrator support'
  'orca: minecraft screen reader'
  'gamemode: gamemode support'
  'mangohud: mangohud support'
)
source=(
  "$pkgname-$pkgver.tar.gz::$_pkggithuburl/archive/refs/tags/v$pkgver.tar.gz"
  "$pkgname.desktop"
)
sha256sums=('e63f2044c48e15b99d6a30b4d2e0a4ca634b436915e10f7ca88522c77cee9ce4'
            'f9ab75791b696e27569c5bc44b8d325f356a6e36efe4eb9c2e227cb2ba95b6b3')

options=('!lto')

export RUSTUP_TOOLCHAIN=stable

prepare() {
  cd "$_pkgtarname-$pkgver"
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd "$_pkgtarname-$pkgver"
  export CARGO_TARGET_DIR=target
  export GITHUB_REPOSITORY_URL=$_pkggithuburl
  export PANDORA_DISTRIBUTION=aur
  export PANDORA_RELEASE_VERSION=$pkgver
  cargo build --release --locked --target $(rustc --print host-tuple)
}

package() {
  install -d "$pkgdir/usr/"{bin,share/{pixmaps,applications}}

  install -Dm755 "$_pkgtarname-$pkgver/target/$(rustc --print host-tuple)/release/$_pkgrustname" "$pkgdir/usr/bin/$pkgname"
  install "$_pkgtarname-$pkgver/package/windows.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$_pkgtarname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
