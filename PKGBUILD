# Maintainer: David Birks <david@birks.dev>

pkgname=kubeseal
pkgver=0.9.6
pkgrel=1
pkgdesc="A tool for one-way encrypted secrets in Kubernetes"
arch=(x86_64)
url="https://github.com/bitnami-labs/sealed-secrets"
license=('Apache')
makedepends=('go')
conflicts=('kubeseal-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitnami-labs/sealed-secrets/archive/v$pkgver.tar.gz")
sha512sums=('b295ab51a0b7dc0a0fc5b5ff862142e7d73a4da95db95a1e7933a8aa4ac1dbc20215357a8e7ec92c44985876b0371771eb8e6692902218d4db99b8c72c74c920')

build() {
  # Trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd sealed-secrets-$pkgver
  go build --ldflags "-X main.VERSION=$pkgver" ./cmd/kubeseal
}

package() {
  install -Dm 755 "$srcdir/sealed-secrets-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
