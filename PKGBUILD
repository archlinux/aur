# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=go-yq
pkgver=4.7.0
pkgrel=1
pkgdesc="portable command-line YAML processor"
arch=(x86_64)
url=https://github.com/mikefarah/yq
license=(MIT)
depends=(glibc)
makedepends=(go)
conflicts=(yq)
source=(https://github.com/mikefarah/yq/archive/v${pkgver}/yq-${pkgver}.tar.gz)
sha256sums=('d4984f8f8ac5151797c8cf9c6ab8b705958802721c4405ef8a99206dcd00dcb5')

prepare() {
  cd yq-$pkgver
  export GOPATH="$srcdir/gopath"
  go mod vendor
}

check() {
  cd yq-$pkgver
  go test ./...
}

build() {
  cd yq-$pkgver
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o yq
}

package() {
  cd yq-$pkgver
  install -Dm0755 yq "$pkgdir/usr/bin/yq"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  ./yq shell-completion bash | install -Dm0644 /dev/stdin \
    "$pkgdir/usr/share/bash-completion/completions/yq"
  ./yq shell-completion zsh | install -Dm0644 /dev/stdin \
    "$pkgdir/usr/share/zsh/site-functions/_yq"
  ./yq shell-completion fish | install -Dm0644 /dev/stdin \
    "$pkgdir/usr/share/fish/vendor_completions.d/yq.fish"
}
