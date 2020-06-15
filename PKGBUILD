# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ferret
pkgver=0.11.1
pkgrel=1
pkgdesc='A web scraping system aiming to simplify data extraction from the web'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://www.montferret.dev'
license=('Apache')
makedepends=('go')
optdepends=('chromium: to handle dynamically rendered web pages')
source=("https://github.com/MontFerret/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0b2c7e512d7ec12de8b7ff89b67bb278df62fe6df0dc0763916d6ef4189258f2')

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
