# Contributor: Thomas Laroche <tho.laroche@gmail.com>
# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=gogs
_pkgname=${pkgname}
pkgver=0.9.97
pkgrel=2
epoch=1
pkgdesc="Gogs(Go Git Service) is a Self Hosted Git Service in the Go Programming Language."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://gogs.io/"
license=('MIT')
provides=('gogs')
depends=('git>=1.7.1')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support')
makedepends=('go>=1.3' 'git>=1.7.1' 'patch' 'glide>=0.10')
conflicts=('gogs-bin' 'gogs-git' 'gogs-git-dev')
options=('!strip' '!emptydirs')
backup=('srv/gogs/conf/app.ini')

install=gogs.install

_gourl=github.com/gogits/$_pkgname
source=('gogs.service.patch'
        'app.ini.patch'
        "$_pkgname::https://${_gourl}/archive/v${pkgver}.tar.gz")

sha512sums=(834e95fe9bcfa291a573ad1fa43f41bbed844658a918ff4fcf53ab8a44a296206ee4003eab1d9a2785c9126be077022f4907846d2eb6c5d64050b5e81ce47f44
            800bba8c0d01bacb43846572f5ade2d1a04b0093f70c991b3cc80bd39b14eb02bb3534890666ff1bbbd9a23e97453f2f136648f7f23d5f829239ab7b4258f6ca
            4ea51d7dc3f70a352765c9e736ebbf290b652253309f44ab08c6c95a96b033356db954d0da22cea754c346537af2c24f3239fcbb7c1babf9161f710d75b4e9e5)

_goroot="/usr/lib/go"

prepare() {
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

  mv "$srcdir/$_pkgname-${pkgver}" $GOPATH/src/${_gourl}

  # Glide
  msg2 "Download dependencies via Glide"
  cd $GOPATH/src/${_gourl}
  glide install

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
