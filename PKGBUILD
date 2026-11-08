# Maintainer: agony <27015 at riseup dot net>

pkgname=pgstream
pkgver=1.6.0
pkgrel=1
pkgdesc='PostgreSQL replication with DDL changes'
arch=('x86_64' 'aarch64')
url='https://github.com/xataio/pgstream'
license=('Apache-2.0')
depends=('glibc' 'postgresql-libs')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4b9cf2c14d4f448b265bddf259da1ae79da58099e8257670bd47f7d225a821dd')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -v -ldflags="-linkmode=external -X github.com/xataio/pgstream/cmd.Version=${pkgver}" -o pgstream .
  for shell in bash fish zsh; do
    ./pgstream completion "${shell}" > "completion.${shell}"
  done
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 pgstream -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/pgstream"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/pgstream.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pgstream"
}
