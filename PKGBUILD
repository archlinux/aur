# Maintainer: David Birks <david@tellus.space>

pkgname=kubeseal
pkgver=0.7.0
pkgrel=1
pkgdesc="A tool for one-way encrypted secrets in Kubernetes"
arch=(x86_64)
url="https://github.com/bitnami-labs/sealed-secrets"
license=('Apache')
makedepends=('go')
conflicts=('kubeseal-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitnami-labs/sealed-secrets/archive/v$pkgver.tar.gz")
sha512sums=('9fb2d22d52d2e51c3ec8e597ef8b062e12167513db86cf11124b69f51d50d0a4f952fe9fc01faf6685e61a8af41f0d87b815d1d177392474baf1331a990d07bb')

prepare() {
  mkdir -p gopath/src/github.com/bitnami-labs
  ln -rTsf sealed-secrets-$pkgver gopath/src/github.com/bitnami-labs/sealed-secrets
}

build() {
  # Trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/bitnami-labs/sealed-secrets

  #cd sealed-secrets-$pkgver
  go build --ldflags "-X main.VERSION=$pkgver" ./cmd/kubeseal
}

package() {
  install -Dm 755 "$srcdir/sealed-secrets-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
