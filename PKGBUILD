# $Id$
# Maintainer: Chris Fordham aka flaccid

pkgname=containerd-git
_pkgname=containerd
pkgver=v0.2.3.r201.g437c971
pkgrel=1
pkgdesc='A daemon to control runC, built for performance and density'
url='https://containerd.tools/'
conflicts=('containerd')
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

prepare() {
  export GOPATH="$srcdir/go"
  mkdir -p "$GOPATH/src/github.com/docker"
  ln -rsf "$srcdir/containerd" "$GOPATH/src/github.com/docker/containerd"
  pushd "$GOPATH/src/github.com/docker/containerd"
    # needs to be fixed upstream
    # likely via https://github.com/docker/containerd/pull/400
    go get -u golang.org/x/net/http2
    go get github.com/gogo/protobuf/gogoproto
    go get github.com/nats-io/go-nats
    go get github.com/opencontainers/runtime-spec/specs-go
    go get github.com/sirupsen/logrus
    go get github.com/tonistiigi/fifo
    go get google.golang.org/grpc
    go get github.com/crosbymichael/go-runc
    go get github.com/docker/go-metrics
    go get github.com/nats-io/nats-streaming-server/server
    go get github.com/opencontainers/runc/libcontainer/system
    go get github.com/urfave/cli
  popd
}

build() {
  pushd "$GOPATH/src/github.com/docker/containerd"
    make setup
    make
  popd
}

package() {
  pushd "$GOPATH/src/github.com/docker/containerd/bin"
    for f in $(find . -type f -print); do
      install -Dm755 "$f" "$pkgdir/usr/bin/$f"
    done
  popd
}

# vim:set ts=2 sw=2 et:
