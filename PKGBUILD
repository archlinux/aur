# Maintainer: Mikkel Oscar Lyderik Larsen <m at moscar dot net>

pkgname=drone-git
_pkgname=drone
pkgver=v2826
pkgrel=1
pkgdesc="Drone is a Continuous Integration platform built on Docker, written in Go"
arch=('i686' 'x86_64')
url="http://github.com/drone/drone"
license=('Apache 2')
makedepends=('git' 'go')
depends=('docker')
provides=('drone')
conflicts=('drone')
backup=('etc/drone/server' 'etc/drone/agent')
install='drone.install'
source=('git+https://github.com/drone/drone.git'
        'drone.service'
        'drone-agent.service'
        'server.conf'
        'agent.conf')
sha1sums=('SKIP'
          '93fc8f9cc5d2b56425086217908a7092ed77c820'
          '7e6ba6a97833179802963cfab95245169a99f896'
          '280d0933a4afd361e48a35803e38a98162fed644'
          'b839ac23c47ba3953e619300a15660dc22ea9611')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "v"$(git rev-list --count master)
}

prepare() {
  # setup local gopath
  mkdir -p $srcdir/src/github.com/drone
  ln -s $srcdir/$_pkgname $srcdir/src/github.com/drone/$_pkgname

  cd $srcdir/src/github.com/drone/$_pkgname

  GOPATH="$srcdir" PATH=$PATH:$GOPATH/bin make deps
  GOPATH="$srcdir" PATH=$PATH:$GOPATH/bin make gen
}

build() {
  cd $srcdir/src/github.com/drone/$_pkgname
  GOPATH="$srcdir" PATH=$PATH:$GOPATH/bin go build -tags netgo -ldflags '-extldflags "-static"' -o drone-bin github.com/drone/drone/drone
}

package() {
  cd "$srcdir"

  # binary
  install -Dm755 drone/drone-bin $pkgdir/usr/bin/drone

  # license
  install -Dm644 $_pkgname/LICENSE $pkgdir/usr/share/$_pkgname
  install -Dm644 $_pkgname/README.md $pkgdir/usr/share/$_pkgname

  # service
  install -Dm644 drone.service $pkgdir/usr/lib/systemd/system/drone.service
  install -Dm644 drone-agent.service $pkgdir/usr/lib/systemd/system/drone-agent.service

  # config
  install -Dm644 server.conf $pkgdir/etc/drone/server
  install -Dm644 agent.conf $pkgdir/etc/drone/agent

  # db path
  install -dm700 $pkgdir/var/lib/drone
  chown -R 633:633 $pkgdir/var/lib/drone
}

# vim:set ts=2 sw=2 ft=sh et:
