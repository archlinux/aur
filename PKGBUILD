# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=snowflake-pt-server
_gitname=snowflake
pkgver=2.15.1
pkgrel=1
pkgdesc="Snowflake is a pluggable transport that proxies traffic through temporary proxies using WebRTC"
arch=('x86_64')
url="https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake/-/wikis/home"
license=('BSD-3-Clause')
depends=('libx11')
makedepends=('git' 'go')
source=("git+https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake.git#tag=v${pkgver}")
b2sums=('dac6f9e7b97f8314106c1056bf504735a733c76f301cba07b42d47999a3d1068811ed9e033bce1fab5c667884f4399fb89b99f1cdb6a04b1d2ee8b64c4b0e830')

build() {
  export GOPATH="$srcdir"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd "$srcdir/$_gitname/server"
  go get -v -d
  go build .
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 server/server "${pkgdir}/usr/bin/snowflake-pt-server"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
