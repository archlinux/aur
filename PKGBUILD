# Maintainer: minus <minus@mnus.de>

pkgname=imapgoose
_pkgname=ImapGoose
pkgver=0.5.2
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
sha256sums=('ad21d08a3d3fa29eabf7588dd3423a822f981c554e75549ac1dcf6b3b3d52bd5')

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
