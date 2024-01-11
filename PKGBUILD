# Maintainer: Axel Navarro <navarroaxel at gmail>
_pkgname=orogene
pkgname="$_pkgname-git"
pkgver=r637.472e481
pkgrel=1
pkgdesc='A next-generation platform and package manager for Node.js-compatible and frontend JavaScript projects'
arch=('x86_64')
url="https://github.com/$_pkgname/$_pkgname"
license=('APACHE')
makedepends=('rust')
provides=('orogene')
conflicts=('orogene')
source=(git+"$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Assist chroot builds with a persistent cargo cache (hat tip @ccorn for this patch)
  if [ -d "$startdir/.cargo" ]; then
    export CARGO_HOME="${CARGO_HOME:-$startdir/.cargo}"
  else
    msg2 "NOTE : If you're building in a (clean) chroot and want a persistant cargo cache folder specific for this package, you can create an empty '.cargo' directory next to the 'PKGBUILD'. This will be recognized and used as CARGO_HOME (except when CARGO_HOME is already set)."
  fi
}

build() {
  cd $_pkgname
  cargo build --release --locked
}

check() {
  cd $_pkgname
  cargo build --release --locked
}

package() {
  cd $_pkgname
  install -Dm755 "target/release/oro" -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
}
