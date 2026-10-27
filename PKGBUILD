# Maintainer: David Birks <david@birks.dev>
# Contributor: Sophie Tauchert <sophie at 999eagle dot moe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=clair
pkgver=4.9.0
pkgrel=1
pkgdesc="Vulnerability Static Analysis for Containers"
arch=('x86_64')
url='https://github.com/quay/clair'
license=('Apache-2.0')
options=('!debug')
depends=('glibc')
makedepends=('go')
optdepends=('postgresql: local database')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quay/clair/archive/v${pkgver}.tar.gz")
b2sums=('d57c65b0dc1f01cb7d9e33c722e19c015c58f3d8444ceaf5dc91b2ce66971b169fa03ee3c9d320a31100c2bd0ce674443d0bb5b5347bdf227292f4874887c52e')
install='clair.install'

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw"

  go build \
    -ldflags "-linkmode=external -X github.com/quay/clair/v4/cmd.Version=${pkgver}" \
    -o build/ \
    ./cmd/...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/clair "${pkgdir}/usr/bin/clair"
  install -Dm755 build/clairctl "${pkgdir}/usr/bin/clairctl"
  install -Dm755 config.yaml.sample "${pkgdir}/etc/clair/config.yaml"
  go clean -modcache
}
