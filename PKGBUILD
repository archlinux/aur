_pkgname=DiagNG
pkgname=diagmond
pkgver=0.1.7
pkgrel=1
pkgdesc='D-Bus daemon for DiagNG privileged actions'
arch=('x86_64')
url='https://github.com/P1sec/DiagNG'
license=('GPL-3.0-only')
install=$pkgname.install
depends=(
  'glib2'
  'dbus'
  'polkit'
  'systemd-libs'
)
makedepends=('cargo' 'pkgconf' 'git' 'clang')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8d66f6bacff47c7b926e207f8d74a94ec7e071c2506b2569eb4300c22852f23e')
options=('!lto')

prepare() {
  cd "$_pkgname-$pkgver/$pkgname"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_pkgname-$pkgver/$pkgname"
  cargo build --release --frozen
}

check() {
  cd "$_pkgname-$pkgver/$pkgname"
  cargo test --frozen
}

package() {
  cd "$_pkgname-$pkgver/$pkgname"
  install -Dm 755 "target/release/diagmond-bin" "$pkgdir/usr/bin/diagmond-bin"

  cp -r share lib -t "$pkgdir/usr/"
}
