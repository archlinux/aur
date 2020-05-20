# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=docker-shell
pkgver=1.3.0
pkgrel=1
pkgdesc="A simple interactive prompt for docker"
arch=('x86_64')
url='https://github.com/Trendyol/docker-shell'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a21a027c09da823e19e1a3b22d6356df4483b993217e5f5aa40110601ece8f07')

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
  install -Dm755 build/docker-shell "${pkgdir}/usr/bin/docker-shell"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  go clean -modcache #Remove go libraries
}