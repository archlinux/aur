# Maintainer: fekoneko <https://github.com/fekoneko>

pkgname='piximan'
pkgver=0.11.1
pkgrel=2
pkgdesc='Pixiv batch downloader and local collection viewer'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/fekoneko/piximan'
license=('GPL-3.0-only')
makedepends=('go')

_srcname="$pkgname-$pkgver.tar.gz"
_srcurl="https://github.com/fekoneko/piximan/archive/refs/tags/v$pkgver.tar.gz"
source=("$_srcname::$_srcurl")
sha256sums=('ef77585c7de20b51cd39c8f0bb6fa253043ad5f6de01016ae805c77242281a4a')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go mod download
}

build() {
  cd "$pkgname-$pkgver"
  make build:current
}

package() {
  cd "$pkgname-$pkgver"
  platform="$(go env GOOS)_$(go env GOARCH)"
  install -Dm755 "bin/$platform/piximan" "$pkgdir/usr/bin/piximan"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
