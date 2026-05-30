# Maintainer: Jon Kinney
#
# Source of truth for the AUR `tensaku` package. The aur-publish.yml
# workflow copies this file, pins pkgver/pkgrel to the release,
# refreshes sha256sums with updpkgsums, regenerates .SRCINFO, and
# pushes to the AUR. Edit depends / package() etc. here — never in the
# AUR repo directly.
pkgname=tensaku
pkgver=0.26.3
pkgrel=1
pkgdesc='Modern screenshot annotation tool for Wayland'
arch=('x86_64')
url='https://github.com/jondkinney/tensaku'
license=('MPL-2.0')
depends=('gtk4' 'gtk4-layer-shell' 'libadwaita' 'libepoxy' 'fontconfig')
makedepends=('rust')
install=tensaku.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ca5ade6ba0e47938186e4487dea57735258a6732a2bb25565fa8a9d99c2f30cc')

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
