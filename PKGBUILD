# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Roman Lisagor <rlisagor at gmail dot com>

pkgname=calicoctl
pkgver=3.18.1
pkgrel=1
pkgdesc="Calico CLI tool"
arch=('x86_64')
url="https://github.com/projectcalico/calicoctl"
license=("Apache")
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/projectcalico/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('69a7c7049575f1374b246fdeaaa6be30e61ace784ec9a835ca773340c36273b5')

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
