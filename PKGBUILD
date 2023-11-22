# Maintainer: Pierce Thompson <pierce at insprill dot net>
pkgname=stmp
pkgver=0.0.3
pkgrel=1
pkgdesc="Subsonic Terminal Music Player"
arch=('x86_64')
url="https://github.com/wildeyedskies/stmp"
license=('GPL')
depends=('mpv')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wildeyedskies/stmp/archive/${pkgver}.tar.gz")
sha256sums=('82958ec10d6856402daca8ba6c8e5590a3f783544cc4b100d088ec7e4282a277')

build() {
  export GOPATH="$srcdir"/gopath
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -gcflags=all=-trimpath=${PWD}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgname-$pkgver"

  go get -d
  go build -a \
    -o "$pkgname-$pkgver" \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/stmp"
}

