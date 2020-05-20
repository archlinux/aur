# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=c2go
pkgver=0.26.1
pkgrel=1
pkgdesc="A tool for transpiling C to Go"
arch=('x86_64')
url='https://github.com/elliotchance/c2go'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d0032a06be4cce8e1709ad034090bb5d8856c06302b978868f677c4acf356fa7')

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
  install -Dm755 build/c2go "${pkgdir}/usr/bin/c2go"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/c2go/LICENSE"
}