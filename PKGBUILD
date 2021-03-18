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
b2sums=('cdbc99d30aacc6efcb6e499a8f5ad3df89d16726cc9513ee08976d01a1e86dacd4e88c37715e11da9a727e013af60481ac2ec3b3dab52ea039c5ec7d6e2f9586')

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
