# Contributor: Thomas Laroche <tho.laroche@gmail.com>
# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=gogs
_pkgname=${pkgname}
pkgver=0.9.13
pkgrel=5
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
            'openssh: GIT over SSH support'
            'tidb-git: TiDB support')
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
            77589148ac4afe09bb1b3f70491fa3b1838299f02216b2a24598f0f468356b2cfbaae397cc693e93f406e1c537d5ae24bc51530d9826879d201b72b19bee376c
            9639a7777323acd41bc647c55fd478abb48890e2770177dc2f70d94b0129267f6d7738f4fd8aa7deed3d9723a3fd464ef2afd8b85cfc4cf4a6f493aa9e70b431)

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
