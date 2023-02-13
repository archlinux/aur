# Maintainer: soloturn@gmail.com

_basename=gossip
pkgname=${_basename}-git
pkgver=r731.4204a56
pkgrel=1
pkgdesc="gossip nostr client, rust, egui based."
arch=('x86_64')
url="https://github.com/mikedilger/$_basename"
license=(MIT)
makedepends=(cargo mold)
provides=($pkgname)
conflicts=($pkgname)
options=(!lto)
source=(
  "$pkgname::git+https://github.com/mikedilger/gossip.git"
  "$pkgname.desktop"
)
sha256sums=(
  'SKIP'
  '7b2e3b0e1d442f190f0fe28ecba0d4eac7023a51cf066a73ceb7c76eedb4ec67'
)

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  RUSTFLAGS="-C link-arg=--ld-path=/usr/bin/mold -C target-cpu=native --cfg tokio_unstable"
  nice cargo build --release
  strip ./target/release/gossip
}

package() {
  cd $pkgname
  install -Dm755 "./target/release/$_basename" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "./LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./gossip.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  mkdir -p "$pkgdir"/usr/share/applications/
  install -Dm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/"
}
