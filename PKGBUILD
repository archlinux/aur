# Maintainer: wildeyedskies <zoenb@mailbox.org>
pkgname=stmp-git
pkgver=r41.5e140a9
pkgrel=1
pkgdesc="Subsonic Terminal Music Player"
arch=('x86_64' 'aarch64')
url="https://github.com/wildeyedskies/stmp"
license=('GPL')
depends=('mpv')
makedepends=('go')
source=("${pkgname}::git+https://github.com/wildeyedskies/stmp")
sha256sums=('SKIP')

build() {
  export GOPATH="$srcdir"/gopath
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -gcflags=all=-trimpath=${PWD}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname"

  go get -d
  go build -a \
    -o "$pkgname-$pkgver" \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/stmp"
}

