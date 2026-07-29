# Maintainer: Toolybird <toolybird at tuta dot io>
pkgname=rig.fm
_pkgname=${pkgname%.*}
pkgver=0.2.2
pkgrel=1
pkgdesc="Terminal Radio Player"
arch=(x86_64)
url="https://github.com/MWhyte/rig"
license=(AGPL-3.0-only)
depends=(glibc mpv)
makedepends=(go)
_archive=$_pkgname-$pkgver
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('70c61d41b05c5a4429a9a0f6a9826f9729ee53944a72c4fe52275a9b5799e54e')

prepare() {
  cd "$_pkgname-$pkgver"
  export GOPATH="$srcdir"
  go mod download -modcacherw
}

build() {
  cd "$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
  go build -ldflags "-compressdwarf=false -linkmode=external" -o rig ./cmd/rig
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
