# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: William Aass Dahlen <cznk@protonmail.com>

pkgname=azure-kubelogin
_pkgname=kubelogin
pkgver=0.0.24
pkgrel=2
pkgdesc="A Kubernetes credential (exec) plugin implementing azure authentication"
arch=('x86_64')
url="https://github.com/Azure/kubelogin"
license=('MIT')
makedepends=('go')
conflicts=('kubelogin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Azure/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a961e82d79054ca8bc6054455ad354a811da0309b6fe31508810b03242950f44')

_archive="$_pkgname-$pkgver"
_git_hash="bbb308d4255c4a29a17c9bec0f2f89586d084c42"

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
