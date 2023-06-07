# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: William Aass Dahlen <cznk@protonmail.com>

pkgname=azure-kubelogin
_name=kubelogin
pkgver=0.0.30
pkgrel=1
pkgdesc="A Kubernetes credential (exec) plugin implementing azure authentication"
arch=(x86_64)
url="https://github.com/Azure/kubelogin"
license=(MIT)
makedepends=(go)
depends=(glibc)
conflicts=(kubelogin)

source=("$pkgname-$pkgver.tar.gz::https://github.com/Azure/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b9b2198beae24827dba7bca312e2d872d6668448cadebf19a87db087639c4ea2')

_archive="$_name-$pkgver"
_git_hash="f9291df8538a4f8d3eb1957d75027199bbea0481"

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  _go_version=$(go version | cut -d " " -f 3)
  _ld_flags="-linkmode external -X main.version=v$pkgver/$_git_hash -X main.goVersion=$_go_version -X 'main.platform=linux/amd64'"
  go build -ldflags "$_ld_flags" .
}

check() {
  cd "$_archive"

  go test ./...
}

package() {
  cd "$_archive"

  install -Dm755 kubelogin $pkgdir/usr/bin/kubelogin
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
