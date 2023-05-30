pkgname=git-credential-oauth
pkgver=0.7.0
pkgrel=1
pkgdesc='Git credential helper that securely authenticates to GitHub, GitLab and BitBucket using OAuth'
arch=('any')
url="https://github.com/hickford/git-credential-oauth"
license=('APACHE')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hickford/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('017bd47edc0dd3057323d8b9ccca008b7ebca7aedf6862b1ebca5e54f5a62496')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
