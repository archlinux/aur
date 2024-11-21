# Maintainer Max Harmathy <harmathy@alumni.tum.de>
# SPDX-License-Identifier: 0BSD
_pkbase=cluster-api
pkgname=clusterctl
pkgver=1.8.5
pkgrel=1
pkgdesc='Cluster API command line interface'
arch=('x86_64')
url="https://cluster-api.sigs.k8s.io/"
license=('Apache-2.0')
makedepends=('go')
source=("https://github.com/kubernetes-sigs/${_pkbase}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ddf3034d93af6da086791bdfd8ddfa1101e03080e81e41ac8a9d1ebfc57f6e06')

prepare(){
  cd "$_pkbase-$pkgver"
  mkdir -p build/
}

build() {
  cd "$_pkbase-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/clusterctl
}

package() {
  cd "$_pkbase-$pkgver"
  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
