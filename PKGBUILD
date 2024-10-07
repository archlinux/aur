# Maintainer: galister <galister at librevr dot org>

_pkgname=motoc
pkgname=$_pkgname-git
pkgver=0.3.3.r0.834a7f6
pkgrel=1
pkgdesc="Monado Tracking Origin Calibrator"
url="https://github.com/galister/motoc"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('openxr')
makedepends=('git' 'cargo')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$_pkgname::git+https://github.com/galister/motoc.git")
sha256sums=('SKIP')
#options=(!lto)

# Use debug
# export CARGO_PROFILE_RELEASE_DEBUG=2

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  cargo build --frozen --release
}

check() {
  cd "$_pkgname"
  cargo test --frozen
}

package() {
  cd "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
