# $Id$
# Maintainer: Chris Fordham <chris [at] fordham-nagy [dot] id [dot] au> aka flaccid
# Contributor: Mikkel Oscar Lyderik Larsen <m at moscar dot net>

pkgname=drone-git
_pkgname=drone
pkgver=v3608
pkgrel=1
pkgdesc="Drone is a Continuous Integration platform built on Docker, written in Go."
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
          '7b5132cd845d9fb869fed3c6ceb96f6105997c35'
          '7d7da680b78a51ba11a8bc63f93b09b228f5b544'
          '280d0933a4afd361e48a35803e38a98162fed644'
          'b839ac23c47ba3953e619300a15660dc22ea9611')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "v"$(git rev-list --count master)
}

prepare() {
  # setup local go env
  export GOPATH="$srcdir/go"
  mkdir -p "$GOPATH/src/github.com/drone"
  ln -sf "$srcdir/$_pkgname" "$GOPATH/src/github.com/drone/"

  # install go dependencies manually
  msg2 'installing go dependencies'
  pushd "$GOPATH/src/github.com/drone/drone" >/dev/null
    go get ./...
  popd
}

build() {
  msg2 'building drone-server'
  pushd "$GOPATH/src/github.com/drone/$_pkgname" >/dev/null
    go build \
      -o release/drone-server \
        github.com/drone/drone/cmd/drone-server
    go build \
      -o release/drone-agent \
        github.com/drone/drone/cmd/drone-agent
  popd
}

package() {
  # binaries
  install -Dm755 "$srcdir/$_pkgname/release/drone-server" "$pkgdir/usr/bin/drone-server"
  install -Dm755 "$srcdir/$_pkgname/release/drone-agent" "$pkgdir/usr/bin/drone-agent"

  # license
  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/$_pkgname"

  # service
  install -Dm644 drone.service "$pkgdir/usr/lib/systemd/system/drone.service"
  install -Dm644 drone-agent.service "$pkgdir/usr/lib/systemd/system/drone-agent.service"

  # config
  install -Dm644 server.conf "$pkgdir/etc/drone/server"
  install -Dm644 agent.conf "$pkgdir/etc/drone/agent"

  # db path
  install -dm700 "$pkgdir/var/lib/drone"
  chown -R 633:633 "$pkgdir/var/lib/drone"
}

# vim:set ts=2 sw=2 ft=sh et:
