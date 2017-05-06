# Maintainer: boosterdev@linuxmail.org
# Contributor: Martchus <martchus@gmx.net>>

pkgname=gogs
_pkgname=${pkgname}
pkgver=0.11.4
pkgrel=4
epoch=1
pkgdesc='Self Hosted Git Service written in Go'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://gogs.io/'
license=('MIT')
provides=('gogs')
depends=('git>=1.7.1')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support')
makedepends=('go>=1.3')
conflicts=('gogs-bin' 'gogs-git' 'gogs-git-dev')
options=('!strip' '!emptydirs')
backup=('etc/gogs/app.ini')
install=gogs.install
_gourl=github.com/gogits/$_pkgname
source=("$_pkgname-$pkgver::https://${_gourl}/archive/v${pkgver}.tar.gz"
        '0001-Adjust-config-for-Arch-Linux-package.patch'
        '0002-Adjust-service-file-for-Arch-Linux-package.patch')
sha512sums=('e262cdd2409dd846a1473993c222a7b9692c694ac9620a5dcd576a17714bfee76212935dcfbf0ad83b7b95623c075f1622613524f347d24d7530732e966c733f'
            '1df73da8962605369bbefcf6ad2b2cf1594b628b182f9ef591089da9324d134b352a0cd3999748bf52b42a260421f08f128a8b61c9f89f70ef11c6c3bc92786c'
            '9a869febcdd74e7cb81c4fb5f23d23e6ec70c94e88849fefe6e9c34902de380e5dd3aabced302a5c6b1eab061252b046aa3878caa69893a6240ae14984a0341c')
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

  mkdir -p "$GOPATH/src/github.com/gogits"
  mv "$srcdir/$_pkgname-${pkgver}" "$GOPATH/src/${_gourl}"

  msg2 'Patch config and service file'
  cd "$GOPATH/src/${_gourl}"
  patch -Np1 -i "$srcdir/0001-Adjust-config-for-Arch-Linux-package.patch"
  patch -Np1 -i "$srcdir/0002-Adjust-service-file-for-Arch-Linux-package.patch"
}

build() {
  cd "$GOPATH/src/${_gourl}"

  go fix
  go build -x -tags='sqlite pam cert'
}

package() {
  install -Dm0755 "$srcdir/build/src/${_gourl}/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  mkdir -p "$pkgdir/usr/share/${_pkgname}"
  cp -r "$srcdir/build/src/${_gourl}/conf" "$pkgdir/usr/share/${_pkgname}"
  cp -r "$srcdir/build/src/${_gourl}/public" "$pkgdir/usr/share/${_pkgname}"
  cp -r "$srcdir/build/src/${_gourl}/templates" "$pkgdir/usr/share/${_pkgname}"

  install -Dm0644 "$pkgdir/usr/share/$_pkgname/conf/app.ini" "$pkgdir/etc/$_pkgname/app.ini"
  install -Dm0644 "$srcdir/build/src/${_gourl}/scripts/systemd/gogs.service" "$pkgdir/usr/lib/systemd/system/gogs.service"
  install -Dm0644 "$srcdir/build/src/${_gourl}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"
}
