# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mimemagic
pkgver=1.1.0
pkgrel=1
pkgdesc="Powerful and versatile MIME sniffing package using pre-compiled glob patterns, magic number signatures, XML document namespaces, and tree magic for mounted volumes, generated from the XDG shared-mime-info database"
arch=('x86_64')
url='https://github.com/zRedShift/mimemagic'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3f20e5a7e28080c3dd23721d40d9d419509f26e38c69f11b2c9838c8b41a1927')

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
  # go get -d -v ./cmd/...
  go build -o build ./cmd/...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/mimemagic "${pkgdir}/usr/bin/mimemagic"
  install -Dm755 build/parser "${pkgdir}/usr/bin/parser"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}