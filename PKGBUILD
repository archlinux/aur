# Maintainer: David Birks <david@birks.dev>
# Contributor: Sophie Tauchert <sophie at 999eagle dot moe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=clair
pkgver=4.8.0
pkgrel=1
pkgdesc="Vulnerability Static Analysis for Containers"
arch=('x86_64')
url='https://github.com/quay/clair'
license=('Apache')
options=('!debug')
depends=('glibc')
makedepends=('go')
optdepends=('postgresql: local database')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quay/clair/archive/v${pkgver}.tar.gz")
b2sums=('3eb8905f12374449573cf888d40fe683506b9df66dc6996b9e0cae1aa60b8d4b5bd1a2c18d48c7fd74e2fb45bdff99338fef68924eb6d1c32052f4ea6603fc3e')
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
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build \
    -ldflags "-X main.Version=${pkgver}" \
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
