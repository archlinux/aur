# Maintainer: Scott Dickson <scottfoesho AT gmail DOT com>

pkgname=plexdrive-mongodb
pkgver=4.0.0
pkgrel=1
pkgdesc='Plexdrive allows you to mount your Google Drive account as read-only fuse filesystem. This version uses mongodb and has hard-drive caching.'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='https://github.com/dweidenfeld/plexdrive'
license=('MIT')
depends=('fuse')
makedepends=('go')
conflicts=("plexdrive-bin" "plexdrive-git" "plexdrive-dev-git" "plexdrive" "plexdrive-mongodb-bin" "plexdrive-sqlite" "plexdrive-bin-sqlite")
provides=("plexdrive")
source=(https://github.com/dweidenfeld/plexdrive/archive/4.0.0.tar.gz)
sha256sums=('c19fcfead0916900324f5e4ad581cb4d2004b84caf483ec6ebf6ccfcf251e9c0')
_goroot='/usr/lib/go'

build() {
  mkdir -p plexdrive/src/github.com/dweidenfeld/plexdrive
  cd plexdrive
  export GOROOT="$_goroot"
  GOPATH=$PWD && export GOPATH
  cp ../plexdrive-${pkgver}/*.go .
	mv ../plexdrive-${pkgver}/* src/github.com/dweidenfeld/plexdrive
  go get bazil.org/fuse
  go get google.golang.org/api/googleapi
  go get golang.org/x/sys/unix
  go get github.com/ogier/pflag
  go get github.com/claudetech/loggo
  go get golang.org/x/net/context
  go get golang.org/x/oauth2
  go get github.com/mxk/go-flowrate/flowrate
  go get github.com/orcaman/concurrent-map
  go get gopkg.in/mgo.v2
	go build
}

package() {
  install -d ${pkgdir}/usr/bin
  install -Dm755 ${srcdir}/plexdrive/plexdrive ${pkgdir}/usr/bin/
}
