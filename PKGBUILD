# $Id$
# Maintainer: Chris Fordham aka flaccid

pkgname=containerd-git
_pkgname=containerd
pkgver=v1.1.0.rc.2.r0.gf630d5f0
pkgrel=1
pkgdesc='An open and reliable container runtime.'
url='https://containerd.io/'
conflicts=('containerd')
optdepends=('runc-git')
makedepends=('go' 'git' 'btrfs-progs')
replaces=('containerd')
arch=('i686' 'x86_64')
source=("containerd::git+https://github.com/containerd/containerd.git")
license=("Apache License 2.0")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "$srcdir/go/src/github.com/containerd"
  ln -sv "$srcdir/containerd" "$srcdir/go/src/github.com/containerd/containerd"
  export GOPATH="$srcdir/go"
}

build() {
  pushd "$GOPATH/src/github.com/containerd/containerd"
    go get ./...
    make
  popd
}

package() {
  pushd "$GOPATH/src/github.com/containerd/containerd/bin"
    for f in $(find . -type f -print); do
      install -Dm755 "$f" "$pkgdir/usr/bin/$f"
    done
  popd
}

# vim:set ts=2 sw=2 et:
