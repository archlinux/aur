# Contributor: Thomas Laroche <tho.laroche@gmail.com>
# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=gogs
_pkgname=${pkgname}
pkgver=0.6.15
pkgrel=1
epoch=1
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
            'openssh: GIT over SSH support')
makedepends=('go>=1.2' 'git>=1.7.1' 'patch')
conflicts=('gogs-bin' 'gogs' 'gogs-git')
options=('!strip' '!emptydirs')
backup=('srv/gogs/conf/app.ini')

install=gogs.install

_gourl=github.com/gogits/$_pkgname
source=('gogs.service'
        'app.ini.patch'
        'helper.sh'
        "$_pkgname::git+https://${_gourl}.git#tag=v${pkgver}")

sha512sums=(2b4303f850e3b13b2fc3c9f0bc5820dae431d228002b35f01be0d4bfbcf05de8dcec2a559a85e318b609e4a4d492d44306eadf5f6508fd72333b198661bb0bb7
            cd00b1f29c0ab2eaf70647b51a7fe135aa00906dcda1b1d99c56ea3371fc6540f82bf77999018078b43294614317df253fb4217c2d84f873398c4a69ae2bfaa5
            e746dbdafc4c8d0b15a224dba95ae3151611ba9ff468ee6f0b1789e489955e4d7eaac0dbdf28a22e5b8211559af5950726f4a37d699a2490fd349f034401028c
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
#  go_get github.com/shurcooL/sanitized_anchor_name "$GOPATH/src/github.com/shurcooL/sanitized_anchor_name"

#  msg2 "Workaround dependencies"
#  cd "$GOPATH/src/github.com/gogits/go-gogs-client/"
#  git checkout -q master

  # Execute patch
  msg2 "Execute patches"
  patch -Np1 -i "$srcdir/app.ini.patch" "$GOPATH/src/${_gourl}/conf/app.ini"
}

build() {
  cd $GOPATH/src/${_gourl}

  msg2 "Build program"
  go fix
  go build -x -tags='sqlite redis memcache'
}

package() {
  install -Dm0755 "$srcdir/build/src/${_gourl}/$_pkgname" "$pkgdir/usr/share/$_pkgname/$_pkgname"

  cp -r "$srcdir/build/src/${_gourl}/conf" "$pkgdir/usr/share/$_pkgname"
  mkdir -p "$pkgdir/usr/share/themes/gogs/default/"
  cp -r "$srcdir/build/src/${_gourl}/public" "$pkgdir/usr/share/themes/gogs/default"
  cp -r "$srcdir/build/src/${_gourl}/templates" "$pkgdir/usr/share/themes/gogs/default"

  install -Dm0644 "$pkgdir/usr/share/$_pkgname/conf/app.ini" "$pkgdir/srv/$_pkgname/conf/app.ini"
  install -Dm0644 "$srcdir/gogs.service" "$pkgdir/usr/lib/systemd/system/gogs.service"
  install -Dm0644 "$srcdir/build/src/${_gourl}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"
}
