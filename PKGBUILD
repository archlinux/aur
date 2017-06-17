# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>

_pkgname=gogs
_orga=go-${_pkgname}
_gourl=github.com/gogits/$_pkgname

pkgname=$_pkgname
pkgver=0.11.19
pkgrel=1
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
options=('!strip' '!emptydirs')
backup=("etc/$_pkgname/app.ini")
install=$_pkgname.install
source=("$_pkgname-$pkgver::https://github.com/$_orga/$_pkgname/archive/v${pkgver}.tar.gz"
        '0001-Adjust-config-for-Arch-Linux-package.patch'
        '0002-Adjust-service-file-for-Arch-Linux-package.patch')
sha512sums=('80339daefe9c4eb9e39af4ab90b6803e9d86648565c0f109a34c00aad9bd40e2edfc77d58e18ad1192ce2e8bc7322113a407e7a02c0116229e1cecf8e67fc8b5'
            'a3632ed26abb634711c0c51defcf7288053845dfebcf27712de49319cfe80c5f7f7ef725c1a20413b1550a866f106818b5f2fd041c5b2a9158d77eae11897ef4'
            'fbb75efd69740638cbb2ce2f0fde3710a466c1128c6afddfd54028b04bb69e7e1f983aba60bbba378c35a854ef1bc7d6fd066acf3846aa48d424784dc15beb4d')
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
}
