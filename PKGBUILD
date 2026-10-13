_pkgname=DiagNG
pkgname=diagmond
pkgver=0.1.2
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
sha256sums=('2ed6959ee30e53d1a9091e375b4de0e25d18072a3aed993a348a83b55c62648b')
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
