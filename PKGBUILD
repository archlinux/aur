# Maintainer: Rafael Epplée <aur@rafa.ee>
pkgname=stmp
pkgver=0.0.2
pkgrel=1
pkgdesc="Subsonic Terminal Music Player"
arch=('x86_64')
url="https://github.com/wildeyedskies/stmp"
license=('GPL')
depends=('mpv')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wildeyedskies/stmp/archive/${pkgver}.tar.gz")
sha256sums=('3822edd13c5efa80a42be572e806b96a2c2dea20b4fd4b34c27b67ae9740be4e')

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

