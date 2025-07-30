# Maintainer: René 'Necoro' Neumann <arch@necoro.dev>
pkgname=feed2imap-go
pkgver=1.8.0
pkgrel=1
pkgdesc='RSS aggregator for direct import into IMAP folders'
arch=('x86_64')
url="https://github.com/Necoro/$pkgname"
license=('GPL-2.0-only')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('191efb28eace2e7a55c52e8494cff84c42b2c0a2bd3c5362862013fc4a627445')
b2sums=('fea1e7b0ea1e5ec9adaeaf1c9de3efe3ad435173a3d2fdd55e30d4394bc897fe4b3e1c30fbce2456388b0c43fc8d45005ce8bf85f11a112fbaad2ca5bae22640')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"

  # LDFlags as per .goreleaser.yml
  ldflags="-s -w -X github.com/Necoro/feed2imap-go/pkg/version.version=$pkgver -X github.com/Necoro/feed2imap-go/pkg/version.commit=AUR"
 
  # Flags as per Arch Guidelines
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  
  go build -o build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode external $ldflags"
}

check() {
  cd "$pkgname-$pkgver"
  go vet ./...
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 {CHANGELOG,README}.md config.yml.example -t "$pkgdir"/usr/share/doc/$pkgname/
}
