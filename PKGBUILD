# Maintainer: Ash <xash at riseup d0t net>
pkgname=rusty-psn-git
_pkgname=rusty-psn
pkgver=0.5.0.r1.ga227494
pkgrel=5
provides=('rusty-psn' 'rusty-psn-gui')
conflicts=('rusty-psn-bin' 'rusty-psn-gui-git' 'rusty-psn-cli-git')
pkgdesc='A GUI/CLI tool for downloading PS3 and PS4 game updates'
url='https://github.com/RainbowCookie32/rusty-psn'
license=('MIT')
arch=('x86_64')
makedepends=('cargo' 'rust' 'pkgconf' 'git')
depends=('openssl' 'libxcb' 'libxkbcommon')
options=('!lto')
source=("$_pkgname::git+https://github.com/RainbowCookie32/rusty-psn.git"
        "playstation-store-icon.png"
        "rusty-psn-gui.desktop")
sha256sums=('SKIP'
            'b9a7443c4be0b30d6de0d8494ae410b8e8a1df2d782c6dbdd4e9d8ac73977ad5'
            '4098c17d95236360c92d5be866589b9fc8d4f123f0908e3fc60a3f93ae04d9ae')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  # Build CLI and GUI in a separate directory to avoid conflict
  cargo build --release --target-dir=target/cli --features "cli"
  cargo build --release --target-dir=target/gui --features "egui"
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/cli/release/rusty-psn" "$pkgdir/usr/bin/rusty-psn"
  install -Dm755 "target/gui/release/rusty-psn" "$pkgdir/usr/bin/rusty-psn-gui"

  install -Dm644 "$srcdir/playstation-store-icon.png" "$pkgdir/usr/share/pixmaps/playstation-store.png"
  install -Dm644 "$srcdir/rusty-psn-gui.desktop" "$pkgdir/usr/share/applications/rusty-psn-gui.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

