# Maintainer: user827 <user827@users.noreply.github.com>

pkgname=xaskpass
pkgdesc="A lightweight passphrase dialog"
url="https://github.com/user827/xaskpass.git"
pkgver=1.5.0
pkgrel=1
arch=('x86_64')
license=('Apache')
makedepends=('git' 'rust' 'cargo')
depends=(libxcb xcb-util-errors pango cairo libxkbcommon
    libxkbcommon-x11)
provides=('x11-ssh-askpass')
source=("$pkgname::git+$url#tag=v${pkgver}?signed")
sha256sums=(SKIP)
validpgpkeys=(D47AF080A89B17BA083053B68DFE60B7327D52D6) # user827
options=(strip)

build() {
  cd "$pkgname"
  cargo build --release --locked --target-dir target
}

check() {
  cd "$pkgname"
  cargo test --release --locked --target-dir target
  cd target/release
  ./xaskpass --version
}

package() {
  cd "$pkgname"
  install -D -m755 target/release/xaskpass "$pkgdir"/usr/bin/xaskpass
  install -D -m755 xaskpass.default.toml "$pkgdir/etc/xdg/xaskpass/xaskpass.default.toml"
  install -D -m644 xaskpass.man "$pkgdir/usr/share/man/man1/xaskpass.1"
}
