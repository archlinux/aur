# Contributor: Thomas Laroche <tho.laroche@gmail.com>
# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=gogs-git-dev
_pkgname=gogs
_branch=dev
pkgver=20150116
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
            'openssh: GIT over SSH support')
makedepends=('go>=1.2' 'git' 'mercurial' 'patch')
conflicts=('gogs-bin' 'gogs' 'gogs-git')
options=('!strip' '!emptydirs')
backup=('srv/gogs/conf/app.ini')

install=gogs.install

_gourl=github.com/gogits/$_pkgname
source=('gogs.service'
        'app.ini.patch'
        'start.sh'
        'helper.sh'
        "$_pkgname::git+https://${_gourl}.git#branch=${_branch}")

sha512sums=('65bd06d530809917134b4fa2668136ada3e0cdc5a9c684ac422a973ad1c40c341d62cebf2ef14ee6275a134979d67cb314ec801a5a35ff1fb4e823aab671a151'
            'a09134a50b7369715f65553003db954ca3193ee2556fc3d8aa98c717aa2f2b275d691f1c7c62464ec8f32e800d8ddf814c75546317ab623d2bd9331c5702380d'
            'd759778b73d78fb705dad7b3cb486a2e366fdf3222bd170823579407a9aba9d281423b1026a22d142fc9abf620a40a14880254105129071956870e3048dd8bc3'
            '1e83441ebb24efe00e80f35eea6ed6d64a48194df3a3c90b02cd52a65099e8dfe046e0f914ac3dac7e4a30c854d967e2d5c928ee801f44053208dde2728fa17f'
            'SKIP')

_goroot="/usr/lib/go"

pkgver(){
  cd "$srcdir/$_pkgname"
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

#  go_get code.google.com/p/go.crypto "$GOPATH/src/go.crypto"

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
  install -Dm0755 "$srcdir/start.sh" "$pkgdir/usr/share/$_pkgname/start.sh"
  install -Dm0755 "$srcdir/build/src/${_gourl}/$_pkgname" "$pkgdir/usr/share/$_pkgname/$_pkgname"

  cp -r "$srcdir/build/src/${_gourl}/conf" "$pkgdir/usr/share/$_pkgname"
  mkdir -p "$pkgdir/usr/share/themes/gogs/default/"
  cp -r "$srcdir/build/src/${_gourl}/public" "$pkgdir/usr/share/themes/gogs/default"
  cp -r "$srcdir/build/src/${_gourl}/templates" "$pkgdir/usr/share/themes/gogs/default"

  install -Dm0644 "$pkgdir/usr/share/$_pkgname/conf/app.ini" "$pkgdir/srv/$_pkgname/conf/app.ini"
  install -Dm0644 "$srcdir/gogs.service" "$pkgdir/usr/lib/systemd/system/gogs.service"
  install -Dm0644 "$srcdir/build/src/${_gourl}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"
}
