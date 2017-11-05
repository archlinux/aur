# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>

_pkgname=gogs
_orga=gogits
_gourl=github.com/gogits/$_pkgname

pkgname=$_pkgname
pkgver=0.11.29
pkgrel=4
epoch=1
pkgdesc='Self Hosted Git Service written in Go'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://$_pkgname.io"
license=('MIT')
depends=('git>=1.7.1' 'pam')
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
        '0002-Adjust-service-file-for-Arch-Linux-package.patch'
        '0003-SECURITY-HTML-injection-in-user-search-API.patch'
        '0004-SECURITY-fix-branch-name-persistent-XSS.patch')
sha512sums=('094dd6b5010128b8a68c3b4a2be389593380be527dd1f1c37882cbd7762ae31ff8da824d047acecb9ef31233ab3c576bc5030c90763adfa32d01b5830d12c04b'
            '43a337ccc0932a8e6f538d24ec8e13a7b509d1e7c4da40d2e76339a67b043090ab648b323c08311f5a62f81db19911138b6ff2c74fb9a869a401571d9b3770c5'
            '969a29c3d1a9667e285ebd3490a83c5a684fa037a540ba242dcd86fe8294eef0b1247fc996a4926832ba0d8c56b5d843a117c14c7696899cb813b847b861a5cc'
            'dca31ee707586a2c055f549a36cdfd113def1436dfbb8eaf2358347d66c968fdb265e8832f1c8f8041d0fbddda708f5eac37719ab85040024cdf6eb82568a219'
            'afafb48f86906db3c1385541eba3d02e028cda087067f4ec467b538cc215d5662ba0af8fe488f4ecbb1f6dff96520c47868c1584239540fb41db8781af6eb792')
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
  patch -Np1 -i "$srcdir/0003-SECURITY-HTML-injection-in-user-search-API.patch"
  patch -Np1 -i "$srcdir/0004-SECURITY-fix-branch-name-persistent-XSS.patch"
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
