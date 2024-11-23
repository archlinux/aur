# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=snowflake-pt-client
_gitname=snowflake
pkgver=2.10.1
pkgrel=2
pkgdesc="Snowflake is a pluggable transport that proxies traffic through temporary proxies using WebRTC"
arch=('x86_64')
url="https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake/-/wikis/home"
license=('BSD-3-Clause')
depends=('libx11')
makedepends=('git' 'go')
source=("git+https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake.git#tag=v${pkgver}")
b2sums=('0e8a91fa47afa52fa2ac678ca3e5f74d67e19d7787dc95fc5b546ed40e9dc1b48a6f220a392b5fccd7a1490596dd735ca157ce70a22c3661bdb6ef590f754eed')

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
