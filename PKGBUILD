# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: rawkode <rawkode@pm.me>

pkgname=openfaas-cli
pkgdesc="Official CLI for OpenFaaS"
pkgver=0.12.4
pkgrel=1
arch=('i686' 'x86_64' 'arm64')
url="https://github.com/openfaas/faas-cli"
license=('MIT')
depends=('glibc')
makedepends=('go-pie' 'dep')
provides=('faas-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('97b160056033b53103318def3a10735297a28afc52a50da0105e3aad4f570055')

prepare() {
  cd "${srcdir}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  if [[ -d $GOPATH/src/github.com/openfaas/ ]]; then
    rm -rf $GOPATH/src/github.com/openfaas/
  fi
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
  install -Dm755 "${srcdir}/go/src/github.com/openfaas/faas-cli/faas-cli" "${pkgdir}/usr/bin/faas-cli"
  install -Dm644 "${srcdir}/go/src/github.com/openfaas/faas-cli/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}