# Maintainer: sseneca <me at ssene dot ca>

pkgname=kubeseal
_pkgname=sealed-secrets
pkgver=0.13.1
pkgrel=1
pkgdesc="A Kubernetes controller and tool for one-way encrypted Secrets"
arch=('x86_64')
url="https://github.com/bitnami-labs/sealed-secrets"
license=('Apache')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bitnami-labs/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('a766e8f1f662aa33507d7d02016d2eefcfb5ea383ed4d4e043070b823e6d1a5de2b89c8bd7f342688745cc0744ec7a867b7b64c0451f8847bb59ba0436588974')

prepare() {
  cd "${_pkgname}-${pkgver}"

  mkdir -p build
}

build() {
  cd "${_pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -ldflags='-X=main.VERSION=v${pkgver}' -mod=readonly -modcacherw"

  go build -o build ./cmd/...
}

check() {
  cd "${_pkgname}-${pkgver}"

  go test ./...
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm644 build/$pkgname "$pkgdir"/usr/bin/$pkgname

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
