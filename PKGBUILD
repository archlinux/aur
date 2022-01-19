# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ferret
pkgver=0.16.5
pkgrel=1
pkgdesc='A web scraping system aiming to simplify data extraction from the web'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://www.montferret.dev'
license=('Apache')
makedepends=('go')
optdepends=('chromium: to handle dynamically rendered web pages')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MontFerret/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('7f2b1a734428038d586c80b7b5e1c3731611521b8538de96aaefdbf411e2a6160ca527f2835b860c95fccdaf0f42fad46cf85c108e2982c0b1b974ac2040324b')

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
