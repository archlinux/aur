# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=snowflake-pt-server
_gitname=snowflake
pkgver=2.10.0
pkgrel=1
pkgdesc="Snowflake is a pluggable transport that proxies traffic through temporary proxies using WebRTC"
arch=('x86_64')
url="https://trac.torproject.org/projects/tor/wiki/doc/Snowflake"
license=('BSD')
depends=('libx11')
makedepends=('git' 'go')
source=("git+https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake.git#tag=v${pkgver}")
b2sums=('07ca880f92516b8036f42df29b5b5087cd26965c6ee9b9b9e447bfb26d54c1b17ce04c4f222c5ec577e1af488bad7491c65a2cafa6d13d2217c803af5348a46f')

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
