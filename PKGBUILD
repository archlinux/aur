# Maintainer: Simon <contact at swz dot works>
pkgname=rlbotgui-rust-git
git_pkgname=rlbot_gui_rust
cargo_pkgname=rl-bot-gui
pkgver=1.0.8.2f61792
pkgrel=1
pkgdesc="A Rust GUI for the RLBot framework"
arch=("x86_64")
url="https://github.com/VirxEC/rlbot_gui_rust"
replaces=("rlbot-gui-rust-git")

depends=("python")
makedepends=("cargo" "git" "sed")

license=("custom")

source=("git+https://github.com/VirxEC/rlbot_gui_rust")
sha512sums=(SKIP)

build() {
  cd "$srcdir/$git_pkgname/src-tauri"
  cargo install tauri-cli --version "^1.0.0"
  cargo tauri build
}

package() {
  cd "$srcdir/$git_pkgname/src-tauri"

  debdatapath="target/release/bundle/deb/${cargo_pkgname}_$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1)_amd64/data"

  install -Dm755 "target/release/$cargo_pkgname" "${pkgdir}/usr/bin/$cargo_pkgname"
  install -Dm755 "${debdatapath}/usr/share/applications/${cargo_pkgname}.desktop" "${pkgdir}/usr/share/applications/${cargo_pkgname}.desktop"
  install -Dm755 "${debdatapath}/usr/share/icons/hicolor/192x192/apps/${cargo_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${cargo_pkgname}.png"
}

pkgver() {
  cd "$srcdir/$git_pkgname/src-tauri"
  echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-parse --short HEAD)"
}
