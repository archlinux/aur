# Maintainer: René 'Necoro' Neumann <arch@necoro.dev>
pkgname=feed2imap-go
pkgver=1.7.0
pkgrel=2
pkgdesc='RSS aggregator for direct import into IMAP folders'
arch=('x86_64')
url="https://github.com/Necoro/$pkgname"
license=('GPL')
makedepends=('go>=1.19')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('89ade053bd251e9af9c00104fae706ea9b06a3c8f49f9069973bfb3df7612f2c')

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
