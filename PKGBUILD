# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Stéphane Graber <stgraber AT ubuntu DOT com>

pkgname=distrobuilder
pkgver=1.1
pkgrel=3
pkgdesc="System container image builder for LXC and LXD"
arch=(x86_64)
url="https://github.com/lxc/distrobuilder"
license=(Apache)
depends=(rsync squashfs-tools gnupg debootstrap)
makedepends=(go git)
conflicts=(distrobuilder-git)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
b2sums=('d1b7fe9fcc6fd65993dc0eaa610dac7bc35c0bd4e67165d94b8761e5ed906bd3ea4357f467332a6dbc02db39227d0efc4c260fae0d6fde6f63843eeacb5622d3')

prepare() {
  mv "$pkgname-$pkgname-$pkgver" "$pkgname-$pkgver"

  # export & create $GOPATH
  export GOPATH="$srcdir/go"
  mkdir -p "$GOPATH"

  # download dependencies (via workaround as per below comment)
  # https://github.com/lxc/distrobuilder/issues/408#issuecomment-801899860
  cd "$pkgname-$pkgver"
  go mod init github.com/lxc/distrobuilder
  go get github.com/mudler/docker-companion/api@master
  go get -t -d ./...
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
  cd "$pkgname-$pkgver"
  go install -v ./...
}

check() {
  # TODO: See Makefile for additional checks
  # - deadcode
  # - golint
  export GOPATH="$srcdir/go"
  cd "$pkgname-$pkgver"
  go test -v ./...
  go vet -v ./...
}

package() {
  install -Dm755 "$srcdir/go/bin/$pkgname" -t "$pkgdir/usr/bin"
}
