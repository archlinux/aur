# Maintainer: David Birks <david@birks.dev>

pkgname=kubeseal
pkgver=0.11.0
pkgrel=1
pkgdesc="A tool for one-way encrypted secrets in Kubernetes"
arch=(x86_64)
url="https://github.com/bitnami-labs/sealed-secrets"
license=('Apache')
makedepends=('go')
conflicts=('kubeseal-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitnami-labs/sealed-secrets/archive/v$pkgver.tar.gz")
sha512sums=('125d5f0ae68f33b748e89d870d1392f18b0768ce32db8ade379215ec35296cad0266e67797d3209c10a850188bbe587ae5d03e74602bb1597978d3a1524d4948')

build() {
  # Trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd sealed-secrets-$pkgver
  go build --ldflags "-X main.VERSION=$pkgver" ./cmd/kubeseal
}

package() {
  install -Dm 755 "$srcdir/sealed-secrets-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
