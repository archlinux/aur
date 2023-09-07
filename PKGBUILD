# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: William Aass Dahlen <cznk@protonmail.com>

pkgname=azure-kubelogin
_name=kubelogin
pkgver=0.0.32
pkgrel=1
pkgdesc="A Kubernetes credential (exec) plugin implementing azure authentication"
arch=(x86_64)
url="https://github.com/Azure/kubelogin"
license=(MIT)
makedepends=(go)
depends=(glibc)
conflicts=(kubelogin)

source=("$pkgname-$pkgver.tar.gz::https://github.com/Azure/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ca487d104280d012643c00cf4d250c1c8b55f28adaab0aad8696974a4e21b14')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  _go_version=$(go version | cut -d " " -f 3)
  _ld_flags=" \
    -linkmode external \
    -X main.version=v$pkgver/? \
    -X main.goVersion=$_go_version \
    -X 'main.platform=linux/amd64' \
  "
  go build -ldflags "$_ld_flags" .
}

check() {
  cd "$_archive"

  go test ./...
}

package() {
  cd "$_archive"

  install -Dm755 kubelogin "$pkgdir/usr/bin/kubelogin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
