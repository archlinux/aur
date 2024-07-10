# Maintainer: René 'Necoro' Neumann <arch@necoro.dev>
pkgname=feed2imap-go
pkgver=1.7.2
pkgrel=1
pkgdesc='RSS aggregator for direct import into IMAP folders'
arch=('x86_64')
url="https://github.com/Necoro/$pkgname"
license=('GPL')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b69103ddd8dd789e5174fd2469bc6c74ce29414291a9000de07e24ec569b0f1b')

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
