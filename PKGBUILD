# Maintainer : Kevin MacMartin <prurigro@gmail.com>

_pkgname=syncthing
pkgname=$_pkgname-discosrv
pkgver=20150820.r41.0dd76f7
pkgrel=1
pkgdesc='Discover server for the syncthing P2P synchronization utility'
url='http://syncthing.net'
license=('MIT')
install=$pkgname.install
depends=('glibc')
makedepends=('git' 'go' 'godep' 'mercurial')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')

source=(
  "$pkgname.service"
  "$pkgname.tmpfiles.conf"
  "git+https://github.com/$_pkgname/discosrv.git"
  "git+https://github.com/$_pkgname/syncthing.git"
  "git+https://github.com/$_pkgname/protocol.git"
  "git+https://github.com/$_pkgname/relaysrv.git"
  'git+https://github.com/syndtr/goleveldb.git'
  'git+https://github.com/golang/snappy'
  'git+https://github.com/juju/ratelimit.git'
  'git+https://github.com/golang/crypto.git'
  'git+https://github.com/golang/groupcache.git'
  'git+https://github.com/calmh/du'
  'git+https://github.com/calmh/logger.git'
  'git+https://github.com/calmh/luhn.git'
  'git+https://github.com/calmh/xdr.git'
  'git+https://github.com/camlistore/lock.git'
  'git+https://github.com/cznic/b.git'
  'git+https://github.com/cznic/bufs.git'
  'git+https://github.com/cznic/exp.git'
  'git+https://github.com/cznic/fileutil.git'
  'git+https://github.com/cznic/mathutil.git'
  'git+https://github.com/cznic/ql.git'
  'git+https://github.com/cznic/sortutil.git'
  'git+https://github.com/cznic/strutil.git'
  'git+https://github.com/cznic/zappy.git'
  'git+https://github.com/lib/pq.git'
  'git+https://github.com/bkaradzic/go-lz4.git'
  'git+https://github.com/thejerf/suture.git'
  'hg+https://code.google.com/p/go.text/'
)
sha512sums=(
  '140e2d92bb0fdbc0920fddb0d5b859b291e83d38e049e5eb5e68f2644172cb2392297e35b0c7fa16087e62e7f5ad9049b5178896ccba6cfe379064194c90f7ce'
  '28b0bb6a6f2fa536ec8cb887cfebf4706be25af5e29da39e2e3776daeeeb48f75fb5be255472920355948d8905830342866e89299facd626ddf8a658d84faf27'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

pkgver() {
  cd discosrv
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Remove Old Build Environment (if it exists)
  [[ -d src ]] && rm -rf src

  # Setup Build Environment
  install -d src/github.com/$_pkgname
  mv discosrv src/github.com/$_pkgname/
  mv syncthing src/github.com/$_pkgname/
  mv protocol src/github.com/$_pkgname/
  mv relaysrv src/github.com/$_pkgname/

  install -d src/github.com/syndtr
  mv goleveldb src/github.com/syndtr/

  install -d src/github.com/golang
  mv snappy src/github.com/golang/

  install -d src/golang.org/x
  mv crypto src/golang.org/x/

  install -d src/github.com/juju
  mv ratelimit src/github.com/juju/

  install -d src/github.com/golang
  mv groupcache src/github.com/golang/

  install -d src/github.com/calmh
  mv logger src/github.com/calmh/
  mv luhn src/github.com/calmh/
  mv xdr src/github.com/calmh/
  mv du src/github.com/calmh/

  install -d src/github.com/camlistore
  mv lock src/github.com/camlistore/

  install -d src/github.com/cznic
  mv b src/github.com/cznic/
  mv bufs src/github.com/cznic/
  mv exp src/github.com/cznic/
  mv fileutil src/github.com/cznic/
  mv mathutil src/github.com/cznic/
  mv ql src/github.com/cznic/
  mv sortutil src/github.com/cznic/
  mv strutil src/github.com/cznic/
  mv zappy src/github.com/cznic/

  install -d src/github.com/lib
  mv pq src/github.com/lib/

  install -d src/github.com/bkaradzic
  mv go-lz4 src/github.com/bkaradzic/

  install -d src/github.com/thejerf
  mv suture src/github.com/thejerf/

  install -d src/code.google.com/p
  mv go.text src/code.google.com/p/

  install -d src/golang.org/x
  ln -s "$srcdir"/src/code.google.com/p/go.text src/golang.org/x/text

  ln -s main.go src/github.com/syncthing/discosrv/main
}

build() {
  export GOPATH="$srcdir"
  cd src/github.com/$_pkgname/discosrv
  go build *.go
}

package() {
  install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 $pkgname.tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
  install -Dm644 src/github.com/$_pkgname/$_pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 src/github.com/$_pkgname/discosrv/main "$pkgdir/usr/bin/$pkgname"
}
