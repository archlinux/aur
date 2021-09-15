# Maintainer: user827 <user827@users.noreply.github.com>

pkgname=xaskpass
pkgdesc="A lightweight passphrase dialog"
url="https://github.com/user827/xaskpass.git"
pkgver=1.8.7
pkgrel=1
arch=('x86_64')
license=('Apache')
makedepends=('git' 'rust' 'cargo' 'clang' 'jq')
depends=(libxcb pango cairo libxkbcommon libxkbcommon-x11)
provides=('x11-ssh-askpass')
source=("$pkgname::git+$url#tag=v${pkgver}?signed")
sha256sums=(SKIP)
validpgpkeys=(D47AF080A89B17BA083053B68DFE60B7327D52D6) # user827
options=(strip)

build() {
  cd "$pkgname"
  local cargo_out
  cargo_out=$(cargo build --release --locked --target-dir target \
      --message-format=json-render-diagnostics)
  printf '%s\n' "$cargo_out" | jq -r "select(.out_dir) | select(.package_id | startswith(\"$pkgname \")) | .out_dir" > out_dir
}

check() {
  cd "$pkgname"
  cargo test --release --locked --target-dir target
  cd target/release
  ./xaskpass --version
}

package() {
  cd "$pkgname"
  local outdir=$(<out_dir)
  install -D -m755 target/release/xaskpass "$pkgdir"/usr/bin/xaskpass
  install -D -m755 xaskpass.default.toml "$pkgdir/etc/xdg/xaskpass/xaskpass.default.toml"
  install -D -m644 "$outdir"/xaskpass.man "$pkgdir/usr/share/man/man1/xaskpass.1"
}
