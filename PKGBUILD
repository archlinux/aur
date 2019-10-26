# Maintainer: edacval <edacval AT gmail DOT com>
# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Stéphane Graber <stgraber AT ubuntu DOT com>
# Contributor: graysky <graysky AT archlinux DOT us>

_pkgname=distrobuilder
_url=github.com/lxc/$_pkgname
pkgname=$_pkgname-git
pkgver=1.0.r11.g2501aa3
pkgrel=1
pkgdesc="System container image builder for LXC and LXD"
arch=(x86_64)
url="https://$_url"
license=(Apache)
depends=(rsync squashfs-tools gnupg debootstrap)
conflicts=(distrobuilder)
makedepends=(go git)
source=($_pkgname::git://$_url.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^distrobuilder-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # create $GOPATH directory, plus some extras
  mkdir -p $srcdir/gopath/src/github.com/lxc

  # symlink extracted source to gopath
  ln -srfT $_pkgname gopath/src/github.com/lxc/distrobuilder

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
  install -Dm755 bin/distrobuilder "${pkgdir}/usr/bin/${_pkgname}"
}
