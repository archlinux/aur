# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
pkgname=cfait
pkgver=0.5.5
pkgrel=1
pkgdesc="Powerful, fast and elegant task / TODO manager. (GUI & TUI, CalDAV & local)"
arch=('x86_64')
url="https://codeberg.org/trougnouf/cfait"
license=('GPL3')
depends=('fontconfig' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'libxcb' 'vulkan-driver')
makedepends=('cargo')
options=('!lto' '!strip' '!debug')
source=("cfait-source-v0.5.5.tar.gz::https://codeberg.org/trougnouf/cfait/releases/download/v0.5.5/cfait-source-v0.5.5.tar.gz")
sha256sums=('409689b880996412977eb2ec55bb7e43bf4155460791b30e407128650f5c9aa6')
replaces=('rustycal' 'rustache' 'fairouille')
provides=('cfait-tui' 'cfait-gui')

build() {
  cd "$pkgname-$pkgver"
  # Set the target directory to be at the root of the makepkg build area
  export CARGO_TARGET_DIR="$srcdir/target"
  # Skip compiling the problematic fallback RNG.
  # Linux's native getrandom() is used instead.
  export AWS_LC_SYS_NO_JITTER_ENTROPY=1
  cargo build --release --features gui
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$srcdir/target/release/cfait" "$pkgdir/usr/bin/cfait"
  install -Dm755 "$srcdir/target/release/gui" "$pkgdir/usr/bin/cfait-gui"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "assets/cfait.desktop" "$pkgdir/usr/share/applications/cfait.desktop"
  install -Dm644 "assets/cfait.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/cfait.svg"
}
