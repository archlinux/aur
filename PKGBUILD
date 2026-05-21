# Maintainer: Wabuo <Spam [.] Wabuo [at] GoogleMail [.] Com>

pkgname=betterleaks
pkgver=1.3.0
pkgrel=2
pkgdesc="Go-based secret scanner offering CEL rule evaluation and Gitleaks compatibility"
arch=('x86_64' 'aarch64')
url="https://github.com/betterleaks/betterleaks"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  export GOPATH="${srcdir}/gopath"
  go mod download
}

build() {
  cd "$pkgname"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

  go build -ldflags "-compressdwarf=false -linkmode external" -o "$pkgname" .
}

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  # install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
