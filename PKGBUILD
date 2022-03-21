# Maintainer: timescam <timescam at duck dot com>

_pkgname=cli2cloud
pkgname=$_pkgname-git
pkgver=r64.171ac42
pkgrel=1
pkgdesc="Pipe your terminal output to the cloud. (git version)"
arch=(any)
url="https://cli2cloud.com/"
license=(MIT)
makedepends=(git go)
source=("git+https://github.com/leonwind/$_pkgname.git")
provides=($_pkgname)
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname/cli/$_pkgname"
  export GOPATH="$srcdir"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build 
}

package() {
  cd "$_pkgname"
  install -Dm755 "$srcdir/$_pkgname/cli/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
