# Maintainer: coldBug <coldbug@e.mail.de>
pkgname=typst-languagetool-lsp-git
pkgver=0.101.a54641f
pkgrel=1
pkgdesc="Spellcheck typst files with LanguageTool and VSCodium."
url="https://github.com/antonWetzel/typst-languagetool"
license=("MIT")
arch=("x86_64")
makedepends=("cargo" "maven")
provides=("typst-languagetool-lsp")
conflicts=("typst-languagetool-lsp")
source=("$pkgname::git+https://github.com/antonWetzel/typst-languagetool/")
sha256sums=("SKIP")
install=post_install.install

pkgver() {
  cd "$pkgname"
  printf "0.%s.%s" "$(git rev-list --count --all)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  sed -i 's/0.13.0/0.13.1/g' Cargo.toml
  cd "lsp"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname/lsp"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --features=server,bundle,jar
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$pkgname/LICENSE" 
  install -Dm644 -t "$pkgdir/usr/share/$pkgname/" "$pkgname/editors/vscodium/generic-lsp/generic-lsp-0.0.1.vsix" 
  install -Dm644 -t "$pkgdir/usr/share/$pkgname/" "$pkgname/example/.vscode/settings.json" 
  install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname/lsp/target/release/${pkgname%-git}"
} 
