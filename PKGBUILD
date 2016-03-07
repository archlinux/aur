# Contributor: Thomas Laroche <tho.laroche@gmail.com>
# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=gogs
_pkgname=${pkgname}
pkgver=0.9.0
pkgrel=1
epoch=2
pkgdesc="Gogs(Go Git Service) is a Self Hosted Git Service in the Go Programming Language."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://gogs.io/"
license=('MIT')
depends=('git>=1.7.1')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support'
            'tidb-git: TiDB support')
makedepends=('go>=1.3' 'git>=1.7.1' 'patch')
conflicts=('gogs-bin' 'gogs-git' 'gogs-git-dev')
options=('!strip' '!emptydirs')
backup=('srv/gogs/conf/app.ini')

install=gogs.install

_gourl=github.com/gogits/$_pkgname
source=('gogs.service.patch'
        'app.ini.patch'
        'helper.sh'
        "$_pkgname::git+https://${_gourl}.git#tag=v${pkgver}")

sha512sums=(834e95fe9bcfa291a573ad1fa43f41bbed844658a918ff4fcf53ab8a44a296206ee4003eab1d9a2785c9126be077022f4907846d2eb6c5d64050b5e81ce47f44
            a7964ccdec7738fff0fce36644cb7144641536b9a43638e9dfe2fce75f17c8ec586dd844a804d742df8be66d7209d83fd67e73f4085c70cb1b84bb6b596fda23
            e45775adafeecad5deaf24a98cd85b25a8383cb0e89905b2927c13fe7f0ec9918a42071ce43eabc429d8a826db93bb75ffb1927dce9c431ed88b0b5c619fd60d
            'SKIP')

_goroot="/usr/lib/go"

prepare() {
  source $srcdir/helper.sh

  export GOROOT=/usr/lib/go
  
  msg2 "Prepare GO build enviroment"
  rm -rf build
  mkdir -p build/go
  cd build/go

  for f in "$GOROOT/"*; do
    ln -s "$f"
  done

  rm pkg
  mkdir pkg
  cd pkg

  for f in "$GOROOT/pkg/"*; do
    ln -s "$f"
  done

  export GOROOT="$srcdir/build/go"
  export GOPATH="$srcdir/build"
  
  mkdir -p "$GOPATH/src/github.com/gogits"

  mv "$srcdir/$_pkgname" $GOPATH/src/${_gourl}

  msg2 "Check and download dependencies from .gopmfile"
  get_gopm "$GOPATH/src/${_gourl}/.gopmfile" "$GOPATH/src"

#  msg2 "Download missing dependencies"
#  go_get github.com/go-xorm/tidb "$GOPATH/src/github.com/go-xorm/tidb"
#  go_get github.com/ngaut/log "$GOPATH/src/github.com/ngaut/log"
#  go_get github.com/pingcap/tidb "$GOPATH/src/github.com/pingcap/tidb"

  # Execute patch
  msg2 "Execute patches"
  patch -Np1 -i "$srcdir/app.ini.patch" "$GOPATH/src/${_gourl}/conf/app.ini"
  patch -Np1 -i "$srcdir/gogs.service.patch" "$GOPATH/src/${_gourl}/scripts/systemd/gogs.service"
}

build() {
  cd $GOPATH/src/${_gourl}

  msg2 "Build program"
  go fix
  go build -x -tags='sqlite pam cert'
}

package() {
  install -Dm0755 "$srcdir/build/src/${_gourl}/$_pkgname" "$pkgdir/usr/share/$_pkgname/$_pkgname"

  cp -r "$srcdir/build/src/${_gourl}/conf" "$pkgdir/usr/share/$_pkgname"
  mkdir -p "$pkgdir/usr/share/themes/gogs/default/"
  cp -r "$srcdir/build/src/${_gourl}/public" "$pkgdir/usr/share/themes/gogs/default"
  cp -r "$srcdir/build/src/${_gourl}/templates" "$pkgdir/usr/share/themes/gogs/default"

  install -Dm0644 "$pkgdir/usr/share/$_pkgname/conf/app.ini" "$pkgdir/srv/$_pkgname/conf/app.ini"
  install -Dm0644 "$srcdir/build/src/${_gourl}/scripts/systemd/gogs.service" "$pkgdir/usr/lib/systemd/system/gogs.service"
  install -Dm0644 "$srcdir/build/src/${_gourl}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"
}
