# Maintainer: Manuel Schmitzberger <ms@ms-sw.at>

pkgname=jv
pkgver=5.0.0
pkgrel=1
pkgdesc='Package jv provides json-schema compilation and validation.'
arch=('x86_64')
url="https://github.com/santhosh-tekuri"
license=('Apache 2.0')
makedepends=('git' 'go')
source=("$url/jsonschema/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f25779f25a75967d7fde5b99d265f1ed12acb1f63f24f62fa47c45404de1aa5f')

prepare(){
  cd "$srcdir/jsonschema-$pkgver"
  mkdir -p bin/
}

build() {
  cd "jsonschema-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ./bin/jv ./cmd/...
}

check() {
  cd "jsonschema-$pkgver"
  go test ./...
}

package() {
  cd "jsonschema-$pkgver"
  install -Dm 755 "${srcdir}/jsonschema-$pkgver/bin/"jv -t "${pkgdir}"/usr/bin/
}
