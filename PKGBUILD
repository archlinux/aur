# Maintainer: Sebastian Wilzbach <sebi at wilzbach dot me>
pkgname=drone-git
_pkgname=drone
pkgver=v942
pkgrel=1
pkgdesc="Drone is a Continuous Integration platform built on Docker, written in Go"
arch=('any')
url="http://github.com/drone/drone"
license=('Apache 2')
groups=()
depends=('docker')
makedepends=('git' 'go')
provides=()
conflicts=('drone' 'drone.io')
replaces=()
backup=('etc/drone/drone.toml')
options=()
install='drone.install'
source=('drone::git+https://github.com/drone/drone.git' "drone.install" "drone.service")
noextract=()
md5sums=('SKIP'
         '09a12dd47fc03e95672d21de0611938b'
         'e10d439170fe3ec031c506b8eb9dae51')

build() {

  # start per default on 8000
  sed -e "s/^port.*$/port=\":8000\"/" -i $_pkgname/packaging/root/etc/drone/drone.toml

  # temporary go path
  export GOPATH=$(pwd)"/go"

  # default dirs
  mkdir -p $GOPATH/src
  mkdir -p $GOPATH/bin

  mkdir -p $GOPATH/src/github.com/drone

  droneFolder="$GOPATH/src/github.com/drone/drone"

  # remove git - allows fast rebuilds
  rm -rf $droneFolder/.git

  # we need to move the go folder inside the go path
  cp -R $(pwd)"/$_pkgname" $GOPATH/src/github.com/drone

  cd "$droneFolder"

  echo "downloading go dependencies (could take some time)"
  make deps

  echo "building drone"
  make build

  # embed static files
  export PATH=$PATH:"$GOPATH/bin"

  # precompile rice sources
  # (embedded static files)
  ( cd server && 
  rice embed-go
  )

  # SOMEHOW appending does not work
  make embed
}

package() {
  cd "$srcdir"

  # server
  install -Dm755 go/src/github.com/drone/drone/packaging/root/usr/local/bin/droned "$pkgdir/usr/bin/droned"

  # client
  install -Dm755 go/bin/cli "$pkgdir/usr/bin/drone"

  # license
  mkdir -p $pkgdir/usr/share/$_pkgname
  install -Dm644 $_pkgname/LICENSE $pkgdir/usr/share/$_pkgname
  install -Dm644 $_pkgname/README.md $pkgdir/usr/share/$_pkgname

  # config
  mkdir -p $pkgdir/etc/$_pkgname
  install -Dm600 $_pkgname/packaging/root/etc/drone/drone.toml $pkgdir/etc/$_pkgname/

  # service
  mkdir -p $pkgdir/usr/lib/systemd/system/
  install -Dm644 drone.service $pkgdir/usr/lib/systemd/system/
}

pkgver() {
  cd $_pkgname
  echo "v"$(git rev-list --count master)
}

# vim:set ts=2 sw=2 et:
