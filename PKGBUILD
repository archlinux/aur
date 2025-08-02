# Contributor: gilcu3
# Maintainer: gilcu3

pkgname=watch-your-lan
_pkgname=WatchYourLAN
pkgver=2.1.3
pkgrel=1
pkgdesc='Lightweight network IP scanner with web GUI.'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/aceberg/WatchYourLAN"
license=('MIT')
depends=('arp-scan' 'tzdata')
makedepends=('go')
source=("$url/archive/refs/tags/$pkgver.tar.gz" "$_pkgname.install")
sha256sums=('764bbd987a9e7c84f54a573b637050e930d727a42483155d764a9a90e977fdf9'
            'd632e52726e2de9217df8e8a5e6f73697cee38a2b40e2d1c502ff4a603937765')
install=$_pkgname.install


prepare() {
  cd "$_pkgname-$pkgver"
  rm go.mod
  go mod init "${url#https://}" # strip https:// from canonical URL
  go mod tidy
}

export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"

build() {
  cd $_pkgname-$pkgver
  cd cmd/$_pkgname
  go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
      .
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver/cmd/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
