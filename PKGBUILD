# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>

_pkgname=gogs
_orga=gogits
_gourl=github.com/gogits/$_pkgname

pkgname=$_pkgname
pkgver=0.11.29
pkgrel=3
epoch=1
pkgdesc='Self Hosted Git Service written in Go'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://$_pkgname.io"
license=('MIT')
depends=('git>=1.7.1')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support')
makedepends=('go>=1.3')
conflicts=("$_pkgname-bin" "$_pkgname-git" "$_pkgname-dev-git")
options=('!strip')
backup=("etc/$_pkgname/app.ini")
install=$_pkgname.install
source=("$_pkgname-$pkgver::https://github.com/$_orga/$_pkgname/archive/v${pkgver}.tar.gz"
        '0001-Adjust-config-for-Arch-Linux-package.patch'
        '0002-Adjust-service-file-for-Arch-Linux-package.patch')
sha512sums=('094dd6b5010128b8a68c3b4a2be389593380be527dd1f1c37882cbd7762ae31ff8da824d047acecb9ef31233ab3c576bc5030c90763adfa32d01b5830d12c04b'
            '8aad23ec5b600a56aee4fd8db8e998d973865dd2e6432ca88e014c024a88ed5d7baa1a65b8ae752364d1e94a2d42795f5ced71b3f11dc2c57eb84ed110f2e3c1'
            '01e19a45212a066589fbedbda9a0f2ac803269b855afed422fdcefb455f8e0da993ac11f0d36028858e4516d2d017e4c29f66dcc7b2260dd24022d1501e230a3')
_goroot='/usr/lib/go'

prepare() {
  export GOROOT="$_goroot"

  msg2 'Prepare GO build enviroment'
  rm -rf build
  mkdir -p build/go
  cd build/go

  for f in "$GOROOT/"*; do
    ln -s "$f"
  done

  rm pkg && mkdir pkg && cd pkg

  for f in "$GOROOT/pkg/"*; do
    ln -s "$f"
  done

  export GOROOT="$srcdir/build/go"
  export GOPATH="$srcdir/build"

  mkdir -p "$GOPATH/src/${_gourl%/$_pkgname}"
  mv "$srcdir/$_pkgname-${pkgver}" "$GOPATH/src/${_gourl}"

  msg2 'Patch config and service file'
  cd "$GOPATH/src/${_gourl}"
  patch -Np1 -i "$srcdir/0001-Adjust-config-for-Arch-Linux-package.patch"
  patch -Np1 -i "$srcdir/0002-Adjust-service-file-for-Arch-Linux-package.patch"
}

build() {
  export GOROOT="$srcdir/build/go"
  export GOPATH="$srcdir/build"
  cd "$GOPATH/src/${_gourl}"

  go fix
  go build -x -ldflags="-s -w" -tags='sqlite pam cert'
}

package() {
  install -Dm0755 "$srcdir/build/src/${_gourl}/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  mkdir -p "$pkgdir/usr/share/${_pkgname}"
  cp -r "$srcdir/build/src/${_gourl}/conf" "$pkgdir/usr/share/${_pkgname}"
  cp -r "$srcdir/build/src/${_gourl}/public" "$pkgdir/usr/share/${_pkgname}"
  cp -r "$srcdir/build/src/${_gourl}/templates" "$pkgdir/usr/share/${_pkgname}"

  install -Dm0644 "$pkgdir/usr/share/$_pkgname/conf/app.ini" "$pkgdir/etc/$_pkgname/app.ini"
  install -Dm0644 "$srcdir/build/src/${_gourl}/scripts/systemd/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm0644 "$srcdir/build/src/${_gourl}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"

  install -dm0700 "$pkgdir/var/log/$_pkgname"
  install -dm0700 "$pkgdir/var/lib/$_pkgname"
}
