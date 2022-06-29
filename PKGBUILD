# Contributor: edacval <edacval AT gmail DOT com>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Stéphane Graber <stgraber AT ubuntu DOT com>
# Contributor: graysky <graysky AT archlinux DOT us>

_pkgname=distrobuilder
_url=github.com/lxc/$_pkgname
pkgname=$_pkgname-git
pkgver=2.1.r34.g2ff2379
pkgrel=1
pkgdesc="System container image builder for LXC and LXD"
arch=(x86_64)
url="https://$_url"
license=(Apache)
depends=(rsync squashfs-tools gnupg debootstrap)
conflicts=(distrobuilder)
makedepends=(go git)
source=($_pkgname::git+https://$_url)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^distrobuilder-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # export & create $GOPATH
  export GOPATH="$srcdir/go"
  mkdir -p "$GOPATH"

  # download dependencies
  cd "$_pkgname"
  go mod vendor
}

build() {
  # export various Go flags
  export GOPATH="$srcdir/go"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # build binary
  cd "$_pkgname"
  go install -v ./...
}

check() {
  export GOPATH="$srcdir/go"
  cd "$_pkgname"
  go test -v ./...
  go vet -v ./...
}

package() {
  install -Dm755 "$srcdir/go/bin/$_pkgname" -t "$pkgdir/usr/bin"
}
