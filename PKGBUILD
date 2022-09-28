# Maintainer: René 'Necoro' Neumann <arch@necoro.dev>
pkgname=feed2imap-go
pkgver=1.5.1
pkgrel=1
pkgdesc='RSS aggregator for direct import into IMAP folders'
arch=('x86_64')
url="https://github.com/Necoro/$pkgname"
license=('GPL')
makedepends=('go>=1.18')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('10872fa1a9bfabdb53fd8935a8676d672dbb361af2d9db2b459cd8aa744f933b')

# cf https://github.com/golang/go/issues/43505
options=(!lto)

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
