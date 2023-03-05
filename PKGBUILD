# Maintainer: Adam Hellberg <sharparam@sharparam.com>

pkgname=mapshot-git
pkgver=0.0.17.r0.gc491893
pkgrel=1
pkgdesc="Tool to export Factorio saves as zoomable HTML maps (development version)"
arch=('x86_64')
url="https://github.com/Palats/mapshot"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go' 'npm')
optdepends=('factorio: The game in some form is required for rendering maps')
provides=('mapshot')
conflicts=('mapshot')
source=("git+$url.git")
sha256sums=('SKIP')
_srcdir=${pkgname%-git}
_binname=${pkgname%-git}

pkgver() {
  cd "$_srcdir"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_srcdir"
  mkdir -p build
  npm --prefix frontend ci
  sh generate.sh
}

build() {
  cd "$_srcdir"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOOS=linux
  export GOARCH=amd64
  go build -o "build/$_binname" ./mapshot.go
}

check() {
  cd "$_srcdir"
  go test ./...
}

package() {
  cd "$_srcdir"
  install -Dm755 "build/$_binname" "$pkgdir/usr/bin/$_binname"
}
