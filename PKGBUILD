# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ferret
pkgver=0.16.0
pkgrel=1
pkgdesc='A web scraping system aiming to simplify data extraction from the web'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://www.montferret.dev'
license=('Apache')
makedepends=('go')
optdepends=('chromium: to handle dynamically rendered web pages')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MontFerret/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('b31e649034c32d3c2a6baa5475669c09a8feb9c95306621110ef02a7fa444732f383ff08b515448e3c2c0c6fd30f7c1278d6a4fdd18f7807a3903a4d0e94d981')

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
