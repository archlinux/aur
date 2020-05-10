# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=clair
pkgver=4.0.0.alpha.6
_pkgver=4.0.0-alpha.6
pkgrel=1
pkgdesc="Vulnerability Static Analysis for Containers"
arch=('x86_64')
url='https://github.com/coreos/clair'
license=('Apache')
depends=('rpm-tools' 'postgresql' 'glibc')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quay/clair/archive/v${_pkgver}.tar.gz")
sha256sums=('f280ce47977c2ac41ec23569a7f142ead55968ed10fe2cf3e5986c18e442339b')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  mkdir -p build
  export GOPATH="${srcdir}/go" PATH="${srcdir}/go/bin:${PATH}"
  go build \
	-ldflags "-s -w -X github.com/coreos/clair/pkg/version.Version=${pkgver}" \
	-gcflags="all=-trimpath=${GOPATH}/src" \
	-asmflags="all=-trimpath=${GOPATH}/src" \
	-o build/clair -v ./cmd/clair
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  install -Dm755 "build/clair" "${pkgdir}/usr/bin/clair"
  install -Dm755 "config.yaml.sample" "${pkgdir}/etc/clair/config.yaml"
  go clean -modcache # clean modcache
}