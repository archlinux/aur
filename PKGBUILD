# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=gotp
pkgver=0.6.0
pkgrel=1
pkgdesc="A command line interface to manage and generate Time-based One Time Password (TOTP)"
arch=(x86_64)
url='https://git.sr.ht/~shulhan/gotp'
license=('GPL3')
makedepends=('go' 'git' 'asciidoctor')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('237ea09dd230558abb589c7e3d4fd785bc21991b46ca7af36dc17437f0948830')

prepare() {
  cd "${pkgname}-v${pkgver}/_doc"
  asciidoctor -q -b manpage README.md
  mv README.1 ${pkgname}.1
  gzip -c ${pkgname}.1 > ${pkgname}.1.gz
}

build() {
  cd "${pkgname}-v${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${pkgname} ./cmd/...
}

package() {
  cd "${pkgname}-v${pkgver}"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 _doc/${pkgname}.1.gz ${pkgdir}/usr/share/man/man1/${pkgname}.1.gz
  install -Dm644 _sys/usr/share/bash-completion/completions/${pkgname} ${pkgdir}/usr/share/bash-completion/completions/${pkgname}
}
