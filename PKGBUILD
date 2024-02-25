# Maintainer: M Hickford <mirth.hickford@gmail.com>
# Maintainer: Brainos <brainos233@gmail.com>
pkgname=git-credential-oauth
pkgver=0.11.1
pkgrel=1
pkgdesc='Git credential helper that securely authenticates to GitHub, GitLab, BitBucket, Gerrit and other forges using OAuth'
arch=('any')
url="https://github.com/hickford/git-credential-oauth"
license=('Apache-2.0')
makedepends=('go')
conflicts=('git-credential-oauth-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hickford/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b6a2c5b5d155d6e4a7b3786e235b9c444292e2f2efe2446e4e6905d7b6cf7ee3')

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
