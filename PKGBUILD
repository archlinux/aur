# Maintainer: ml <>
_pkgname=probe-cli
pkgname=ooniprobe-cli
pkgver=3.1.0
pkgrel=1
pkgdesc='Next generation OONI Probe CLI'
arch=('x86_64')
url='https://github.com/ooni/probe-cli'
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('daa3878737df32565192ea2010151183a45125ee1efced1bfeef21be1e9a54c9')

prepare() {
  cd "$_pkgname-$pkgver"
  go get -modcacherw -d ./...
}

build() {
  cd "$_pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -ldflags '-linkmode=external' ./cmd/ooniprobe
}

check() {
  cd "$_pkgname-$pkgver"
  go test -short ./...
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 ooniprobe -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 Readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
