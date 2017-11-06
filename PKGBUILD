# Maintainer: rawkode <david.andrew.mckay@gmail.com>

pkgname=openfaas-cli
pkgdesc="OpenFaaS CLI"
pkgver=0.4.30
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/openfaas/faas-cli"
license=('mit')
makedepends=('go')

source=("https://github.com/openfaas/faas-cli/archive/$pkgver.tar.gz")
sha256sums=('10a844c8f92fdcf843107170a3d1e101d89afd1bb25c05d898748f1e97239271')

build() {
  cd "$srcdir/faas-cli-$pkgver"

  VERSION=$(git describe --all --exact-match `git rev-parse HEAD` | grep tags | sed 's/tags\///')
  GIT_COMMIT=$(git rev-list -1 HEAD)
  CGO_ENABLED=0 GOOS=linux go build --ldflags "-s -w -X github.com/openfaas/faas-cli/commands.GitCommit=${GIT_COMMIT} -X github.com/openfaas/faas-cli/commands.Version=${VERSION}" -a -installsuffix cgo -o faas-cli .
}

package() {
  install -Dm 755 "$srcdir/faas-cli-$pkgver/faas-cli" "$pkgdir/usr/bin/faas-cli"
}
