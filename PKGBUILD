# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ferret
pkgver=1.0.0
pkgrel=1
pkgdesc='A web scraping system aiming to simplify data extraction from the web'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://ferretlang.org'
license=('Apache-2.0')
makedepends=('git' 'go')
optdepends=('chromium: to handle dynamically rendered web pages')
source=("${pkgname}-${pkgver}::git+https://github.com/MontFerret/${pkgname}.git#tag=v${pkgver}")
b2sums=('88b06ad254b025ca2129fdd5f725d3dae2433d4d1301c50398c609ebb8e6e1f66ad31cd8d7a227cedf0e8dfb01ee4f0a4e0978eaa3fa160fc9702658842f6fd0')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.version=${pkgver} -extldflags ${LDFLAGS}"
  go build -o ferret -ldflags="${_LDFLAGS}" ./
}

package() {
  cd "${pkgname}-${pkgver}"
  # binary
  install -D -m755 ferret "${pkgdir}/usr/bin/ferret"
  # doc files
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 CHANGELOG.md \
    "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
