# Maintainer: <contact@amadejpapez.com>

pkgname='gau'
pkgver=2.0.6
pkgrel=1
pkgdesc="Fetch known URLs from AlienVault's Open Threat Exchange, the Wayback Machine, and Common Crawl"
arch=('x86_64')
url='https://github.com/lc/gau'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1728c341b147388fa8e60784c4b3895391be25f1e2e1b1cbb734329be7603693')

prepare() {
  export GOPATH="${srcdir}/gopath"
  go clean -modcache
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${pkgname}-${pkgver}/cmd/gau"
  go build -v -o "${pkgname}" .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dvm755 "cmd/gau/gau" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
