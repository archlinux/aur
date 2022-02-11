# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>
# Contributor: Daniel Dulaney <dan@dulaney.xyz>

pkgname=faq
pkgver=0.0.7
pkgrel=1
pkgdesc='Format Agnostic jQ -- process various formats with libjq'
arch=('any')
url="https://github.com/jzelinskie/faq"
license=('Apache')
depends=('jq')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('92ea8718cb9734acf1feccfc9eaa8d54809cb7bd49561ee684fb5f60460dbb83')

build() {
  cd ${pkgname}-${pkgver}

  export GOPATH="${srcdir}/gopath"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  make FAQ_VERSION="${pkgver}" DESTDIR="${pkgdir}" prefix="/usr" build
}

package() {
  cd ${pkgname}-${pkgver}
  export GOBIN="${pkgdir}/usr/bin"
  make FAQ_VERSION="${pkgver}" DESTDIR="${pkgdir}" prefix="/usr" install

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
