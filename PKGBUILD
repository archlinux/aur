# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=orogene
pkgver=0.3.12
pkgrel=1
pkgdesc='A next-generation platform and package manager for Node.js-compatible and frontend JavaScript projects'
arch=('x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('APACHE')
makedepends=('rust')
source=(https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('c6d184d9baed33d814ec1ef702f7c970a90d91ec1ab41a3bb3e1a2519ac91b53')

prepare() {
  # Assist chroot builds with a persistent cargo cache (hat tip @ccorn for this patch)
  if [ -d "$startdir/.cargo" ]; then
    export CARGO_HOME="${CARGO_HOME:-$startdir/.cargo}"
  else
    msg2 "NOTE : If you're building in a (clean) chroot and want a persistant cargo cache folder specific for this package, you can create an empty '.cargo' directory next to the 'PKGBUILD'. This will be recognized and used as CARGO_HOME (except when CARGO_HOME is already set)."
  fi
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "target/release/oro" -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
}
