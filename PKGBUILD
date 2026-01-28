# Maintainer: Azur84 <Azur84@outlook.fr>
pkgname=pandora-launcher-git
_pkgname=pandora_launcher
pkgver=2.5.0.r40.g6d4c085
pkgrel=2
pkgdesc="A modern Minecraft launcher that balances ease-of-use with powerful instance management features."
arch=('x86_64')
conflicts=('pandora-launcher')
provides=("pandora-launcher")
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
  "$pkgname::git+https://github.com/Moulberry/PandoraLauncher.git#branch=master"
  "$pkgname.desktop"
  "icon.svg::https://github.com/Moulberry/PandoraLauncher/raw/6d4c085dc5a09dd42d89b607e7787b4bbf32d119/package/windows.svg"
)
sha256sums=('SKIP'
            'f525ded38bc914f912fc0de9762c4d9716399dcdbe400aba36fb3044ad833aee'
            '8c045dbd40e52ee10f439e90f368ef4a12c0f3f830f252b2fefd2e862bc76fc5')

export RUSTUP_TOOLCHAIN=stable

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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

  install -Dm755 "$pkgname/target/$(rustc --print host-tuple)/release/$_pkgname" "$pkgdir/usr/bin/${pkgname::-4}"
  install "icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname::-4}.svg"
  install "$pkgname.desktop" "$pkgdir/usr/share/applications/${pkgname::-4}.desktop"
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname::-4}/LICENSE"
}
