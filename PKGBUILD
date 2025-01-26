# Maintainer: a821
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: bkfox
# Contributor: Vojtech Kral <vojtech_kral^hk>
# Contributor: Félix Saparelli <aur@passcod.name>
# Contributor: ask

pkgname=rust-bindgen-git
_pkgname=bindgen
pkgver=0.71.1.r7.g59a43e10
pkgrel=1
pkgdesc="Automatically generates Rust FFI bindings to C (and some C++) libraries"
arch=('x86_64')
url="https://github.com/rust-lang-nursery/rust-bindgen"
license=('BSD-3-Clause')
depends=('gcc-libs' 'clang')
makedepends=('cargo' 'git')
provides=('rust-bindgen')
conflicts=('rust-bindgen')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "rust-bindgen"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
  cd "rust-bindgen"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  mkdir -p completions
}

build() {
  cd "rust-bindgen"
  cargo build --release --frozen
  local _completion="target/release/$_pkgname --generate-shell-completions"
  $_completion bash >"completions/$_pkgname"
  $_completion fish >"completions/$_pkgname.fish"
  $_completion zsh >"completions/_$_pkgname"
}

package() {
  cd "rust-bindgen"
  install -Dm755 "target/release/$_pkgname" "$pkgdir"/usr/bin/bindgen
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm664 "completions/$_pkgname" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm664 "completions/$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm664 "completions/_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
