# Maintainer: user827 <user827@users.noreply.github.com>

pkgname=xaskpass
pkgdesc="A lightweight passphrase dialog"
url="https://github.com/user827/xaskpass.git"
pkgver=2.5.9
pkgrel=1
arch=('x86_64')
license=('Apache')
makedepends=('git' 'cargo' 'clang')
depends=(libxcb pango cairo libxkbcommon libxkbcommon-x11)
provides=('x11-ssh-askpass')
source=("$pkgname::git+$url#tag=v${pkgver}?signed")
sha256sums=(SKIP)
validpgpkeys=(D47AF080A89B17BA083053B68DFE60B7327D52D6) # user827
options=(strip)

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target  "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  [ -d manout ] || mkdir manout
  export RUSTUP_TOOLCHAIN=stable
  XASKPASS_BUILDDIR=manout cargo build --release --locked --target-dir target --frozen
}

check() {
  cd "$pkgname"

  local version
  version=$(./target/release/xaskpass --version)
  [ "$version" = "$pkgname $pkgver" ]

  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --locked --target-dir target --frozen
}

package() {
  cd "$pkgname"
  local outdir=manout
  install -D -m755 target/release/xaskpass "$pkgdir"/usr/bin/xaskpass
  install -D -m755 xaskpass.default.toml "$pkgdir/etc/xdg/xaskpass/xaskpass.default.toml"
  install -D -m644 "$outdir"/xaskpass.man "$pkgdir/usr/share/man/man1/xaskpass.1"
}
