# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=clair
pkgver=2.1.5
pkgrel=1
pkgdesc="Vulnerability Static Analysis for Containers"
arch=('x86_64')
url='https://github.com/coreos/clair'
license=('Apache')
depends=('rpm-tools' 'postgresql' 'glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quay/clair/archive/v${pkgver}.tar.gz")
sha256sums=('8489857e7e9e79e3e33b8ad6893d8773f8e8f0b9879058a012fead2b8290c545')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/clair "${pkgdir}/usr/bin/clair"
  install -Dm755 config.example.yaml "${pkgdir}/etc/clair/config.yaml"
  go clean -modcache # clean modcache
}
