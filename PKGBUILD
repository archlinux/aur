# Maintainer: soloturn@gmail.com

_basename=cosmic-text-editor
pkgname=${_basename}-git
pkgver=r8.aed6b9b
pkgrel=1
pkgdesc="text editor of COSMIC desktop environment, rust, iced based."
arch=('x86_64')
url="https://github.com/pop-os/$_basename"
license=(GPL)
makedepends=(cargo git mold)
provides=($pkgname)
conflicts=($pkgname)
source=(
  "$pkgname::git+${url}.git"
  "$pkgname.desktop"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd $pkgname
#  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  CARGO_TARGET_DIR=target
  RUSTFLAGS="-C link-arg=-fuse-ld=mold -C target-cpu=native"
  cargo build
}

package() {
  cd $pkgname
  install -Dm755 "target/debug/$_basename" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
