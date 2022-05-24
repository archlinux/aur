# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=cobra-cli
pkgver=1.3.0
pkgrel=1
pkgdesc="tool to generate cobra applications and commands"
arch=(x86_64)
url=https://cobra.dev
license=(Apache)
depends=(glibc)
makedepends=(go)
source=(https://github.com/spf13/cobra-cli/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('9c9729828a035eff012330d5e720eec28d2cb6a1dbaa048e485285977da77d15')

prepare() {
  cd $pkgname-$pkgver
  export GOPATH="$srcdir/gopath"
  go mod vendor
}

check() {
  cd $pkgname-$pkgver
  go test ./...
}

build() {
  cd $pkgname-$pkgver
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $pkgname
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 $pkgname "$pkgdir/usr/bin/cobra-cli"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  ./cobra-cli completion bash | install -Dm0644 /dev/stdin \
    "$pkgdir/usr/share/bash-completion/completions/cobra-cli"
  ./cobra-cli completion zsh | install -Dm0644 /dev/stdin \
    "$pkgdir/usr/share/zsh/site-functions/_cobra-cli"
  ./cobra-cli completion fish | install -Dm0644 /dev/stdin \
    "$pkgdir/usr/share/fish/vendor_completions.d/cobra-cli.fish"
}

# vim: set ts=2 sw=2 et:
