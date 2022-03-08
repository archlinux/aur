# Maintainer: Chris Howey <chris@howey.me> -> also the program developer

pkgname=ledger-go
_pkgname=${pkgname%-go}
pkgver=1.5.0
pkgrel=1
pkgdesc="A double-entry accounting system with a command-line reporting interface"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/howeyc/ledger"
license=(ISC)
depends=(glibc)
makedepends=(go)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('928ec540cf9e23e7d436794b669bf89a6b414f6740c217b9231829e6f8e0032d')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  CGO_ENABLED=0

  go build \
	-o ledger-go \
    -trimpath \
    -buildmode=pie \
    -ldflags="-s -w -X github.com/howeyc/ledger/ledger/cmd.version=${pkgver}" \
    ./ledger
}

package() {
  install -Dm755 "${srcdir}"/${_pkgname}-${pkgver}/ledger-go "${pkgdir}"/usr/bin/ledger
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/ledger/man/ledger.1 "${pkgdir}/usr/share/man/man1/ledger.1"
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/ledger/man/ledger.5 "${pkgdir}/usr/share/man/man5/ledger.5"

  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/ledger/cmd/web-portfolio-sample.toml "${pkgdir}/usr/share/${_pkgname}/web-portfolio-sample.toml"
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/ledger/cmd/web-quickview-sample.toml "${pkgdir}/usr/share/${_pkgname}/web-quickview-sample.toml"
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/ledger/cmd/web-reports-sample.toml "${pkgdir}/usr/share/${_pkgname}/web-reports-sample.toml"

  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/ledger/vim-ledger/ftplugin/ledger.vim "${pkgdir}/usr/share/${_pkgname}/vim-ledger/ftplugin/ledger.vim"
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/ledger/vim-ledger/syntax/ledger.vim "${pkgdir}/usr/share/${_pkgname}/vim-ledger/syntax/ledger.vim"
}
