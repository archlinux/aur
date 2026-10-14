_pkgname=DiagNG
pkgname=diagmond
pkgver=0.1.3
pkgrel=1
pkgdesc='D-Bus daemon for DiagNG privileged actions'
arch=('x86_64')
url='https://github.com/P1sec/DiagNG'
license=('GPL-3.0-only')
depends=(
  'glib2'
  'dbus'
  'polkit'
  'systemd-libs'
)
makedepends=('cargo' 'pkgconf' 'git' 'clang')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('151ddfe43f9ece2b8b98bdc1436c6f055832232ab4057ff44c05db6b64acae46')
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
