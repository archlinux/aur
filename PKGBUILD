# Maintainer: Kibouo <csonka.mihaly@hotmail.com>
pkgname=rust-analyzer-vscode-git
pkgver=r4319.8de56ec4
pkgrel=1
pkgdesc='An experimental Rust compiler front-end for IDEs (VSCode installation).'
arch=('any')
url='https://github.com/rust-analyzer/rust-analyzer/'
license=('MIT')
depends=('rustup' 'code')
makedepends=('git' 'npm')
provides=("${pkgname}")
conflicts=("${pkgname}" 'rust-analyzer-git')
source=("${pkgname}::git+${url}")
md5sums=('SKIP')
pkgver() {
	cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $pkgname
	cargo build --release

  cd ./editors/code
  npm install
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/ra_lsp_server" "$pkgdir/usr/bin/ra_lsp_server"
	install -D -m755 "$srcdir/$pkgname/target/release/ra_cli" "$pkgdir/usr/bin/ra_cli"

  cd ./editors/code
  ./node_modules/vsce/out/vsce package
  code --install-extension ./ra-lsp-0.0.1.vsix
}