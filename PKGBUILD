# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=snowflake-pt-client
_gitname=snowflake
pkgver=2.11.0
pkgrel=1
pkgdesc="Snowflake is a pluggable transport that proxies traffic through temporary proxies using WebRTC"
arch=('x86_64')
url="https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake/-/wikis/home"
license=('BSD-3-Clause')
depends=('libx11')
makedepends=('git' 'go')
source=("git+https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake.git#tag=v${pkgver}")
b2sums=('e63f8c64f46ec70b66dd73d986ea3b60fe0e78d5b42e1386eeaae84685c2ef6f19dfc97c827faa7db91bf54e848559e167888e960f9c957fee66bd3e1afb0281')

build() {
  export GOPATH="$srcdir"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd "$srcdir/$_gitname/client"
  go get -v -d
  go build .
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 client/client "${pkgdir}/usr/bin/snowflake-pt-client"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
