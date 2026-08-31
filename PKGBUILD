# Maintainer: Ryan Kes <ryan@andthensome.nl>
pkgname=linkwarden-obsidian-sync
pkgver=2.6.0
pkgrel=1
pkgdesc="Keeps a directory of Obsidian notes in sync with your saved Linkwarden links"
arch=('x86_64' 'aarch64')
url="https://github.com/alrayyes/linkwarden-obsidian-sync"
license=('GPL-3.0-only')
# The build already strips symbols and DWARF info (-s -w below, same as
# goreleaser's own build for every other release artifact) — makepkg's
# automatic debug-package step has nothing to extract from that, and
# without this it still tries, producing a broken -debug package with a
# dangling .build-id symlink that namcap flags as a real error.
options=('!debug')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alrayyes/linkwarden-obsidian-sync/archive/v$pkgver.tar.gz")
sha256sums=('ecdcb3c5446313a4690783525e0782997720ee8b1c61ad391a34bd382f4f0991')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -ldflags "-s -w -X main.version=$pkgver" \
    -o "$pkgname" ./cmd/linkwarden-obsidian-sync
  go run -tags mangen ./cmd/linkwarden-obsidian-sync man
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  # Left uncompressed: makepkg's own tidy step gzips these, unlike nfpm's
  # deb/rpm build in .goreleaser.yaml, which has to be told to.
  install -Dm644 man/linkwarden-obsidian-sync.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 man/linkwarden-obsidian-sync-init.1 "$pkgdir/usr/share/man/man1/$pkgname-init.1"
}
