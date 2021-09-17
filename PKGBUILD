# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Roman Lisagor <rlisagor at gmail dot com>

pkgname=calicoctl
pkgver=3.20.1
pkgrel=1
pkgdesc="Calico CLI tool"
arch=('x86_64')
url="https://github.com/projectcalico/calicoctl"
license=("Apache")
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/projectcalico/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('486fde1fb95f7f0ed692cb5c42bfcf5a7993ff1b02372786fceaec8b65b15201')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -v -o build ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/calicoctl "${pkgdir}/usr/bin/calicoctl"
}
