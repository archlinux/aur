# Maintainer: Jon Kinney
#
# Source of truth for the AUR `tensaku` package. The aur-publish.yml
# workflow copies this file, pins pkgver/pkgrel to the release,
# refreshes sha256sums with updpkgsums, regenerates .SRCINFO, and
# pushes to the AUR. Edit depends / package() etc. here — never in the
# AUR repo directly.
pkgname=tensaku
pkgver=0.27.0
pkgrel=1
pkgdesc='Modern screenshot annotation tool for Wayland'
arch=('x86_64')
url='https://github.com/jondkinney/tensaku'
license=('MPL-2.0')
depends=('gtk4' 'gtk4-layer-shell' 'libadwaita' 'libepoxy' 'fontconfig')
makedepends=('rust')
# Window snapping and pin placement ask the compositor where its
# windows are; without its CLI you drag the region by hand and the
# pin lands wherever the compositor puts it. Neither is required.
optdepends=('hyprland: window snapping and pin placement'
            'sway: window snapping and pin placement')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c73d5964472a4fc62fc5db15476c12b224473e232c22a36b21ae0b4070d6cba')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --features ci-release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/tensaku "$pkgdir/usr/bin/tensaku"
  install -Dm755 assets/tensaku-edit "$pkgdir/usr/bin/tensaku-edit"
  install -Dm644 dev.tensaku.Tensaku.desktop "$pkgdir/usr/share/applications/dev.tensaku.Tensaku.desktop"
  install -Dm644 assets/tensaku.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.tensaku.Tensaku.svg"
  install -Dm644 man/tensaku.1 "$pkgdir/usr/share/man/man1/tensaku.1"
  install -Dm644 completions/tensaku.bash "$pkgdir/usr/share/bash-completion/completions/tensaku"
  install -Dm644 completions/tensaku.fish "$pkgdir/usr/share/fish/vendor_completions.d/tensaku.fish"
  install -Dm644 completions/_tensaku "$pkgdir/usr/share/zsh/site-functions/_tensaku"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
