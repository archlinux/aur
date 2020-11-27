# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Roman Lisagor <rlisagor at gmail dot com>

pkgname=calicoctl
pkgver=3.17.0
pkgrel=1
pkgdesc="Calico CLI tool"
arch=('x86_64')
url="https://github.com/projectcalico/calicoctl"
license=("Apache")
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/projectcalico/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d037dbab4f95a83ba7510e9d127fbfce351571671e98f068b2da1e902fe4ba41')

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
