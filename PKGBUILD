# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Stéphane Graber <stgraber AT ubuntu DOT com>

pkgname=distrobuilder
pkgver=1.1
pkgrel=2
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
  # go modules will solve everything, they said ...
  export GO111MODULE=off

  # create $GOPATH directory, plus some extras
  mkdir -p $srcdir/gopath/src/github.com/lxc

  # symlink extracted source to gopath
  ln -srfT $pkgname-$pkgname-$pkgver gopath/src/github.com/lxc/distrobuilder

  # export $GOPATH & download dependencies
  export GOPATH="$srcdir"/gopath
  cd "$GOPATH"/src/github.com/lxc/distrobuilder
  go get -v -d ./...
}

build() {
  export GO111MODULE=off
  export GOPATH="$srcdir"/gopath
  cd "$GOPATH"/src/github.com/lxc/distrobuilder
  go install -v \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS}" \
    ./...
}

package() {
  install -Dm755 gopath/bin/distrobuilder "${pkgdir}/usr/bin/${pkgname}"
}
