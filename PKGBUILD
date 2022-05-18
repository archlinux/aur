# Maintainer: Maël Kerbiriou <m431.kerbiriou@gmail.com>
pkgname=rust-idle-git
_pkgname=rust-idle
pkgver=0.1.0
pkgrel=1
pkgdesc="Rust spin-down utility, a reimplementation of hd-idle"
url="https://github.com/piezoid/rust-idle"
provides=('rust-idle')
license=('MIT')
depends=('glibc')
makedepends=(cargo git jq)
arch=('x86_64')
source=("git+$url")
sha512sums=('SKIP')

_rtarget="$CARCH-unknown-linux-gnu"

pkgver() {
  cd "$_pkgname"
  cargo read-manifest | jq -r .version
}

prepare() {
  cd "$_pkgname"
  if rustup toolchain list | grep -q "nightly-$_rtarget"; then
    CARGO_FLAGS="+nightly -Z build-std=std,panic_abort -Z build-std-features=panic_immediate_abort"
  else
    CARGO_FLAGS=""
  fi
  echo "$CARGO_FLAGS" > .cargo-flags
  cargo $CARGO_FLAGS fetch --target="$_rtarget" --locked
}

build() {
  cd "$_pkgname"
  CARGO_FLAGS="$(< .cargo-flags)"
  cargo $CARGO_FLAGS build --target="$_rtarget" --release --frozen
}

package() {
  cd "$_pkgname"
  DESTDIR="$pkgdir" PREFIX="/usr" TARGET="$_rtarget" PKGNAME="$pkgname" ./install.sh
}
