# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: William Aass Dahlen <cznk@protonmail.com>

pkgname=azure-kubelogin
_pkgname=kubelogin
pkgver=0.0.22
pkgrel=1
pkgdesc="A Kubernetes credential (exec) plugin implementing azure authentication"
arch=('x86_64')
url="https://github.com/Azure/kubelogin"
license=('MIT')
makedepends=('go')
conflicts=('kubelogin')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Azure/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('98073ce2e755d3a9ba2e536b612e896bdfdbfa79e7ef074ee71071301ff1556e')

build() {
  cd "$_pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/kubelogin
}

check() {
  cd "$_pkgname-$pkgver"

  go test ./...
}

package() {
  cd "$_pkgname-$pkgver"

  install -Dm755 "build/kubelogin" $pkgdir/usr/bin/kubelogin
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
