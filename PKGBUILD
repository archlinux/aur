# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=snowflake-pt-client-git
_gitname=snowflake
pkgver=900.bd636a1
pkgrel=1
pkgdesc="Snowflake is a pluggable transport that proxies traffic through temporary proxies using WebRTC"
arch=('i686' 'x86_64')
url="https://trac.torproject.org/projects/tor/wiki/doc/Snowflake"
license=('BSD')
depends=('libx11')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
source=('git+https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count main).$(git rev-parse --short main)
}

build() {
  export GOPATH="$srcdir"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

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
