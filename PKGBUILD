# Maintainer: Scott Dickson <scottfoesho AT gmail DOT com>

pkgname=plexdrive-sqlite
pkgver=3.0.0
pkgrel=1
pkgdesc='Plexdrive allows you to mount your Google Drive account as read-only fuse filesystem. This version uses sqlite and has hard-drive caching.'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='https://github.com/dweidenfeld/plexdrive'
license=('MIT')
depends=('fuse')
makedepends=('go')
conflicts=("plexdrive-bin" "plexdrive-git" "plexdrive-dev-git" "plexdrive" "plexdrive-mongodb-bin" "plexdrive-mongodb" "plexdrive-sqlite-bin")
provides=("plexdrive")
source=(https://github.com/dweidenfeld/plexdrive/archive/3.0.0.tar.gz)
sha256sums=('186133f0704b3ba2652750d235b8c5126efb8037321de8918170446e309198db')
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
  go get github.com/jinzhu/gorm
  go get github.com/jinzhu/gorm/dialects/sqlite
  go get github.com/mxk/go-flowrate/flowrate
  go get github.com/orcaman/concurrent-map
	go build
}

package() {
  install -d ${pkgdir}/usr/bin
  install -Dm755 ${srcdir}/plexdrive/plexdrive ${pkgdir}/usr/bin/
}
