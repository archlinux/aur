# $Id$
# Maintainer: Chris Fordham

pkgname=containerd-git
_pkgname=containerd
pkgver=v0.2.0.r95.g3d90005
pkgrel=1
pkgdesc='A daemon to control runC, built for performance and density'
url='https://containerd.tools/'
depends=('glibc' 'runc-git')
makedepends=('go' 'git')
replaces=('containerd')
arch=('i686' 'x86_64')
source=("git+https://github.com/docker/containerd.git")
license=("APACHE")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="$srcdir"
  mkdir -p src/github.com/docker
  ln -rsf containerd src/github.com/docker
  cd src/github.com/docker/containerd
  LDFLAGS= make
}

package() {
  cd src/github.com/docker/containerd/bin
  for file in $(find . -type f -print); do
    install -Dm755 $file $pkgdir/usr/bin/$file
  done
}

# vim:set ts=2 sw=2 et:
