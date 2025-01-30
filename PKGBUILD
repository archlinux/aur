# Maintainer: apropos <jj@toki.la>
# Contributor: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Wojciech Kępka (wojciech@wkepka.dev)
# Contributor: Théo Daron (theo@daron.be)

pkgname=helix-ext
_pkgname=helix
pkgver=25.01.1.1
pkgrel=1
pkgdesc="The Helix editor, with various rejected patches applied."
arch=('x86_64')
url="https://helix-editor.com"
license=('MPL-2.0')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme')
conflicts=('helix')
makedepends=('cargo' 'git')
optdepends=(
  'ansible-language-server: for Ansible language support'
  'bash-language-server: for Bash language support'
  'clang: for C/C++ language support'
  'dart: for Dart language support'
  'elvish: for elvish language support'
  'gopls: for Go language support'
  'haskell-language-server: for Haskell language support'
  'jedi-language-server: for Python language support'
  'julia: for Julia language support'
  'lua-language-server: for Lua language support'
  'marksman: for Marksman language support'
  'python-lsp-server: for Python language support'
  'r: for R and rmarkdown language support'
  'racket: for racket language support'
  'rust-analyzer: for Rust language support'
  'taplo: for TOML language support'
  'texlab: for LaTeX language support'
  'typescript-language-server: for jsx, tsx, typescript language support'
  'typst-lsp: for Typst language support'
  'vue-language-server: for Vue language support'
  'vscode-css-languageserver: for CSS and SCSS support'
  'vscode-html-languageserver: for HTML language support'
  'vscode-json-languageserver: for JSON language support'
  'yaml-language-server: for YAML language support'
  'zls: for Zig language support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/omentic/helix-ext/archive/$pkgver.tar.gz")
sha256sums=('be3971b715e2f5379d343bb7dcbfcb5699abaf65de4c6fc88ba32a7d7381a4ea')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  # NOTE: we are renaming hx to helix so there is no conflict with hex (providing hx)
  sed -i "s|hx|helix|g" contrib/completion/hx.*
  sed -i 's|hx|helix|g' contrib/Helix.desktop
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="--cfg tokio_unstable"
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/hx" "$pkgdir/usr/lib/$_pkgname/hx"
  install -vdm 755 "$pkgdir/usr/bin"
  ln -sv /usr/lib/$_pkgname/hx "$pkgdir/usr/bin/$_pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"

  local runtime_dir="$pkgdir/usr/lib/$_pkgname/runtime"
  mkdir -p "$runtime_dir/grammars"
  cp -r "runtime/queries" "$runtime_dir"
  cp -r "runtime/themes" "$runtime_dir"
  find "runtime/grammars" -type f -name '*.so' -exec \
    install -Dm 755 {} -t "$runtime_dir/grammars" \;
  install -Dm 644 runtime/tutor -t "$runtime_dir"

  install -Dm 644 "contrib/completion/hx.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "contrib/completion/hx.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -Dm 644 "contrib/completion/hx.zsh" "$pkgdir/usr/share/zsh/site-functions/$_pkgname"
  install -Dm 644 "contrib/Helix.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm 644 "contrib/$_pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"
}

# vim: ts=2 sw=2 et:
