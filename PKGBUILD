# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=dum
pkgver=0.1.20
pkgrel=1
pkgdesc='An npm scripts runner written in Rust.'
arch=('x86_64')
url="https://github.com/egoist/$pkgname"
license=('MIT')
makedepends=('rust')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/egoist/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('a1f4890f7edec4b5a376d3d6a30986b13ef8818593732f4a577a35c3c7145503')

prepare() {
  # Assist chroot builds with a persistent cargo cache (hat tip @ccorn for this patch)
  if [ -d "$startdir/.cargo" ]; then
    export CARGO_HOME="${CARGO_HOME:-$startdir/.cargo}"
  else
    msg2 "NOTE : If you're building in a (clean) chroot and want a persistant cargo cache folder specific for this package, you can create an empty '.cargo' directory next to the 'PKGBUILD'. This will be recognized and used as CARGO_HOME (except when CARGO_HOME is already set)."
  fi
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
