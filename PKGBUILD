# Contributor: Thomas Laroche <tho.laroche@gmail.com>
# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=gogs-git
_pkgname=gogs
_branch=master
pkgver=3834.d6b09c3
pkgrel=1
epoch=1
pkgdesc="Gogs(Go Git Service) is a Self Hosted Git Service in the Go Programming Language. This is the current git version from branch ${_branch}."
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
makedepends=('go>=1.4' 'git>=1.7.1' 'patch')
conflicts=('gogs-bin' 'gogs' 'gogs-git')
options=('!strip' '!emptydirs')
backup=('srv/gogs/conf/app.ini')

install=gogs.install

_gourl=github.com/gogits/$_pkgname
source=('gogs.service.patch'
        'app.ini.patch'
        'helper.sh'
        "$_pkgname::git+https://${_gourl}.git#branch=${_branch}")

sha512sums=(834e95fe9bcfa291a573ad1fa43f41bbed844658a918ff4fcf53ab8a44a296206ee4003eab1d9a2785c9126be077022f4907846d2eb6c5d64050b5e81ce47f44
            bd378fac1c9a37e9d96d84529fce5b95351e631e0ac0f461c4d9ca3e2d9903400d03f83fcfbf701a93d5531e0d9fa0061d877a226cceb36387db76061533bdf6
            e45775adafeecad5deaf24a98cd85b25a8383cb0e89905b2927c13fe7f0ec9918a42071ce43eabc429d8a826db93bb75ffb1927dce9c431ed88b0b5c619fd60d
            'SKIP')

_goroot="/usr/lib/go"

pkgver(){
  cd "$srcdir/../$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

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
#  go_get github.com/macaron-contrib/oauth2 "$GOPATH/src/github.com/macaron-contrib/oauth2"

  msg2 "Workaround dependencies"
  cd "$GOPATH/src/github.com/gogits/go-gogs-client/"
  git checkout -q master

  # Execute patch
  msg2 "Execute patches"
  patch -Np1 -i "$srcdir/app.ini.patch" "$GOPATH/src/${_gourl}/conf/app.ini"
  patch -Np1 -i "$srcdir/gogs.service.patch" "$GOPATH/src/${_gourl}/scripts/systemd/gogs.service"
}

build() {
  cd $GOPATH/src/${_gourl}

  msg2 "Build program"
  go fix
  go build -x -tags='sqlite'
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
