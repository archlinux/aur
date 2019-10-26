# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Stéphane Graber <stgraber AT ubuntu DOT com>

pkgname=distrobuilder
pkgver=1.0
pkgrel=1
pkgdesc="System container image builder for LXC and LXD"
arch=(x86_64)
url="https://github.com/lxc/distrobuilder"
license=(Apache)
depends=(rsync squashfs-tools gnupg debootstrap)
makedepends=(go git)
conflicts=(distrobuilder-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lxc/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha512sums=('f322435df87fc21fe479894a7d85df75fbf419f29371cca7ad621a1d7686162386c2a74a5dccfe09dc939023ac4e30508ae46a43b0e909ff2a82c78c25cb6d62')

prepare() {
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
  export GOPATH="$srcdir"/gopath
  cd "$GOPATH"/src/github.com/lxc/distrobuilder
  go install -v \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS}" \
    ./...
}

package() {
  export GOPATH="$srcdir"/gopath
  cd "$GOPATH"
  install -Dm755 bin/distrobuilder "${pkgdir}/usr/bin/${pkgname}"
}
