# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: rawkode <rawkode@pm.me>

pkgname=openfaas-cli
pkgdesc="Official CLI for OpenFaaS"
pkgver=0.12.0
pkgrel=4
arch=('i686' 'x86_64' 'arm64')
url="https://github.com/openfaas/faas-cli"
license=('MIT')
makedepends=('go' 'dep')
provides=('faas-cli')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('0b088a822f2a61085cf914007be9f147cfe1a32f936c5ed50c931e23066a4d0b')

prepare() {
  cd "${srcdir}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  mkdir -p $GOPATH/src/github.com/openfaas/
  cd $GOPATH/src/github.com/openfaas/
  mv "$srcdir/faas-cli-${pkgver}" faas-cli
  cd faas-cli
  dep ensure -v
}

build() {
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  cd $GOPATH/src/github.com/openfaas/faas-cli
  CGO_ENABLED=0 GOOS=linux go build --ldflags "-s -w -X github.com/openfaas/faas-cli/version.Version=$pkgver" -a -installsuffix cgo -o faas-cli
}

package() {
  install -Dm 755 "${srcdir}/go/src/github.com/openfaas/faas-cli/faas-cli" "${pkgdir}/usr/bin/faas-cli"
}