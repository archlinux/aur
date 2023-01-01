# Maintainer: Chris Howey <chris@howey.me> -> also the program developer

pkgname=ledger-go
_pkgname=${pkgname%-go}
pkgver=1.10.5
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
sha256sums=('386cdd42f501db56b01a5ecab98939a137a0734acc8c2dd73a25ed6fef6d8e11')

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

  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/vim-ledger/ftplugin/ledger.vim "${pkgdir}/usr/share/${_pkgname}/vim-ledger/ftplugin/ledger.vim"
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/vim-ledger/syntax/ledger.vim "${pkgdir}/usr/share/${_pkgname}/vim-ledger/syntax/ledger.vim"
}
