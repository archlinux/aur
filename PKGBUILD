# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>
# Contributor: Dmitri Goutnik <dg@syrec.org>

pkgname=trdsql
pkgver=0.11.1
pkgrel=1
pkgdesc="CLI tool that can execute SQL queries on CSV, LTSV, JSON and TBLN"
arch=('i686' 'x86_64')
url="https://github.com/noborus/trdsql"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e5a16bd1561304ca6c48079108bc8c57571997b29af9921888d1e278d3b50d14')

build() {
  cd ${pkgname}-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  export GOPATH="${srcdir}/go"

  make VERSION="v${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr"
}

package() {
  cd ${pkgname}-${pkgver}
  export GOBIN="${pkgdir}/usr/bin"
  make VERSION="v${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" install

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 completion/trdsql-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}

# vim: ts=2 sw=2 et:
