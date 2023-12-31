# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=mailhog
pkgver=1.0.1
pkgrel=1
pkgdesc="Web and API based SMTP testing"
arch=('x86_64')
url="https://github.com/mailhog/MailHog"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("MailHog-${pkgver}.tar.gz::https://github.com/mailhog/MailHog/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('98df715d84ba70c7eace19e4a8c22756a485d93b1a7fbc309dfc97132272c26766e321477b694447aa5e600e3c2046f3f868b0743d2596c611867269f927094f')

prepare() {
  cd "${srcdir}"

  mkdir -p gopath/src
  mv "MailHog-${pkgver}/vendor"/* gopath/src/
  mkdir -p gopath/src/github.com/mailhog
  ln -rsT "MailHog-${pkgver}" gopath/src/github.com/mailhog/MailHog
}

build() {
  cd "${srcdir}/MailHog-${pkgver}"

  GOPATH="${srcdir}/gopath" GO111MODULE=off go build \
    -trimpath \
    -buildmode=pie \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=${pkgver}" \
    -o mailhog \
    main.go
}

package() {
  cd "${srcdir}/MailHog-${pkgver}"

  install -Dm755 mailhog "${pkgdir}/usr/bin/mailhog"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -dm755 "${pkgdir}/usr/share/doc"
  cp -r docs "${pkgdir}/usr/share/doc/mailhog"
}
