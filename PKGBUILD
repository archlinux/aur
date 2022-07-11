# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=spidy
pkgver=2.0.0
pkgrel=1
pkgdesc='Expired Domain Name Scraper - scrap the web and find expired domains'
arch=('x86_64' 'aarch64')
url="https://github.com/twiny/spidy/"
license=('GPL')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}archive/refs/tags/v${pkgver}.tar.gz")
conflicts=("${pkgname}-bin" ${pkgname}-git)
provides=('spidy')
sha256sums=('39e9ccc39b82de3db06d427e08eb91866aff67c8807c94a4bac0273e38117f28')

prepare(){
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
  go build -o build/${pkgname} -v cmd/spidy/main.go
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/"${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
  install -Dm644 config/example.config.yaml "${pkgdir}"/usr/share/doc/"${pkgname}"/example.config.yaml
}
