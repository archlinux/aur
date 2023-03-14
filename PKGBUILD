# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: William Aass Dahlen <cznk@protonmail.com>

pkgname=azure-kubelogin
_pkgname=kubelogin
pkgver=0.0.28
pkgrel=1
pkgdesc="A Kubernetes credential (exec) plugin implementing azure authentication"
arch=(x86_64)
url="https://github.com/Azure/kubelogin"
license=(MIT)
makedepends=(go)
depends=(glibc)
conflicts=(kubelogin)

source=("$pkgname-$pkgver.tar.gz::https://github.com/Azure/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2d3fb0d8a3e0b88964e18839126868bac193ed4aa4a368028d790e98e686839a')

_archive="$_pkgname-$pkgver"
_git_hash="2026869c86368dafa3ff06001b68f9a881dee75c"

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  _go_version=$(go version | cut -d " " -f 3)
  _ld_flags="-X main.version=v$pkgver/$_git_hash -X main.goVersion=$_go_version -X 'main.platform=linux/amd64'"

  go build -ldflags "-linkmode external $_ld_flags" .
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
