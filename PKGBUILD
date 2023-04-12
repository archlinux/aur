# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: David Birks <david at birks dot dev>

pkgname=pluto
pkgver=5.16.0
pkgrel=2
pkgdesc="A cli tool to help discover deprecated apiVersions in Kubernetes"
arch=(x86_64)
url=https://github.com/FairwindsOps/pluto
license=(Apache)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/archive/v$pkgver.tar.gz")
sha256sums=('bdbfe9a11ebbcf5df9f16ce432bb7b78bd4b310bdb31445675d714b3f99fb40a')

prepare() {
  cd $pkgname-$pkgver
  export GOPATH="$srcdir/gopath"
  go mod vendor
}

check() {
  cd $pkgname-$pkgver
  export GOPATH="$srcdir/gopath"
  go test -mod=readonly -v ./...
}

build() {
  cd $pkgname-$pkgver

  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -o pluto \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w -linkmode external -extldflags \"${LDFLAGS}\" -X main.version=${pkgver}" \
    cmd/pluto/main.go
}

package() {
  cd $pkgname-$pkgver

  install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  for doc in advanced.md faq.md quickstart.md; do
    install -Dm0644 docs/$doc "$pkgdir/usr/share/doc/$pkgname/$doc"
  done

  # redirect stderr to supress fairwinds ads during package
  ./pluto completion bash 2>/dev/null | install -Dm0644 /dev/stdin \
    "$pkgdir/usr/share/bash-completion/completions/pluto"
  ./pluto completion zsh 2>/dev/null | install -Dm0644 /dev/stdin \
    "$pkgdir/usr/share/zsh/site-functions/_pluto"
  ./pluto completion fish 2>/dev/null | install -Dm0644 /dev/stdin \
    "$pkgdir/usr/share/fish/vendor_completions.d/pluto.fish"
}

# vim: set ts=2 sw=2 et:
