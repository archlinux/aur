# Maintainer: Yuki Joou <yukijoou at kemonomimi dot gay>

# Base on the work of Pierce Thompson <pierce at insprill dot net>
# on the `stmp` package

_name=stmps
pkgname=${_name}-git
pkgver="581b478"
pkgrel=1
pkgdesc="Subsonic Terminal Music Player S"
arch=('x86_64')
url="https://github.com/spezifisch/${_name}"
license=('GPL')
depends=('mpv')
makedepends=('go')
source=("git+${url}")
sha256sums=('SKIP')

build() {
  export GOPATH="$srcdir"/gopath
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -gcflags=all=-trimpath=${PWD}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$_name"

  go get -d
  go build -a \
    -o "$_name" \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd "$srcdir/$_name"
  install -Dm755 "$_name" "$pkgdir/usr/bin/stmps"
}

