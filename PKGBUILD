# Maintainer: minus <minus@mnus.de>

pkgname=imapgoose
_pkgname=ImapGoose
pkgver=0.5.5
pkgrel=1
pkgdesc="Keep local Maildir directories synchronised with an IMAP server"
arch=('x86_64')
url="https://git.sr.ht/~whynothugo/ImapGoose"
license=('ISC')
makedepends=(
  'go'
  'golangci-lint'
)
checkdepends=(
  'dovecot'
)
source=(
  "https://git.sr.ht/~whynothugo/ImapGoose/archive/v$pkgver.tar.gz"
)
sha256sums=('9f87ecdde549a64b10eedfa8e37fb939edf69d67b14acc889a70f5432568557e')

prepare() {
  cd "${_pkgname}-v${pkgver}"

  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${_pkgname}-v${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  make build
}

check() {
  cd "${_pkgname}-v${pkgver}"
  # make check runs developer checks. just runs tests instead.
  go test ./...
}

package() {
  cd "${_pkgname}-v${pkgver}"

  make install PREFIX=/usr DESTDIR="$pkgdir"
}
