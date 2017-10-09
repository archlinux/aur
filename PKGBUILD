# Maintainer: rawkode <david.andrew.mckay@gmail.com>

pkgname=openfaas-cli
pkgdesc="OpenFaaS CLI"
pkgver=0.4.18
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/openfaas/faas-cli"
license=('mit')
makedepends=('go')

source=("https://github.com/openfaas/faas-cli/archive/$pkgver.tar.gz")
sha256sums=('9350c345484ba217645af1e75487725159d2eceff21518265b751f05f7083f4e')

build() {
  cd "$srcdir/faas-cli-$pkgver"

  VERSION=$(git describe --all --exact-match `git rev-parse HEAD` | grep tags | sed 's/tags\///')
  GIT_COMMIT=$(git rev-list -1 HEAD)
  CGO_ENABLED=0 GOOS=linux go build --ldflags "-s -w -X github.com/openfaas/faas-cli/commands.GitCommit=${GIT_COMMIT} -X github.com/openfaas/faas-cli/commands.Version=${VERSION}" -a -installsuffix cgo -o faas-cli .
}

package() {
  install -Dm 755 "$srcdir/faas-cli-$pkgver/faas-cli" "$pkgdir/usr/bin/faas-cli"
}
