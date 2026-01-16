# Maintainer: Azur84 <Azur84@outlook.fr>
pkgname=pandora-launcher-git
_pkgname=pandora_launcher
pkgver=2.5.0.r5.gcaec657
pkgrel=1
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
)
sha256sums=('SKIP'
            'f525ded38bc914f912fc0de9762c4d9716399dcdbe400aba36fb3044ad833aee')

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
  install "$pkgname/package/icon_256x256.png" "$pkgdir/usr/share/pixmaps/${pkgname::-4}.png"
  install "$pkgname.desktop" "$pkgdir/usr/share/applications/${pkgname::-4}.desktop"
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname::-4}/LICENSE"
}
