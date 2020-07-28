# Maintainer: David Birks <david@birks.dev>

pkgname=kubeseal
pkgver=0.12.5
pkgrel=1
pkgdesc="A tool for one-way encrypted secrets in Kubernetes"
arch=(x86_64)
url="https://github.com/bitnami-labs/sealed-secrets"
license=('Apache')
makedepends=('go')
conflicts=('kubeseal-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitnami-labs/sealed-secrets/archive/v$pkgver.tar.gz")
sha512sums=('e55a8921208739358f89ba7f5fb6ce92a8b3806997496a01651020cc6fe346040434ec374ba010ce70779d613103fa98b704042503a060efeff7a39534fb06e5')

build() {
  # Trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd sealed-secrets-$pkgver
  go build --ldflags "-X main.VERSION=$pkgver" ./cmd/kubeseal
}

package() {
  install -Dm 755 "$srcdir/sealed-secrets-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
