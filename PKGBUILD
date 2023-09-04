# Maintainer: M Hickford <mirth.hickford@gmail.com>
# Contributor: Brainos <brainos233@gmail.com>
pkgname=git-credential-oauth
pkgver=0.10.1
pkgrel=1
pkgdesc='Git credential helper that securely authenticates to GitHub, GitLab and BitBucket using OAuth'
arch=('any')
url="https://github.com/hickford/git-credential-oauth"
license=('APACHE')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hickford/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f5656771f51fa9a2e947da11e426bd724992c3fb950f42800022646a16f9978c')

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
  install -Dm0644 git-credential-oauth.1 -t "$pkgdir"/usr/share/man/man1/
}
