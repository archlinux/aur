# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>

_pkgname=gogs
_orga=gogits
_gourl=github.com/gogits/$_pkgname
_userid=511

pkgname=$_pkgname
pkgver=0.11.34
pkgrel=2
epoch=1
pkgdesc='Self Hosted Git Service written in Go'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://$_pkgname.io"
license=('MIT')
depends=('git>=1.7.1' 'pam')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support')
makedepends=('go>=1.3' 'patch' 'gcc')
conflicts=("$_pkgname-bin" "$_pkgname-git" "$_pkgname-dev-git")
options=('!strip')
backup=("etc/$_pkgname/app.ini")
source=("$_pkgname-$pkgver::https://github.com/$_orga/$_pkgname/archive/v${pkgver}.tar.gz"
        '0001-Adjust-config-for-Arch-Linux-package.patch'
        '0002-Adjust-service-file-for-Arch-Linux-package.patch')
sha512sums=('0de420bf2d27ab86f5efd6cb5c4a43d1f8cb0f98abe3791177c14ef9e38437571ba4491c62cf7e9f6366469294197c57cd149a6c633cc08640c612b5ee506838'
            '2763e4a2a5c98f3e75a1ddcb7c58012ce1e0fc2ad6b85110d9f28dd6c98d9e84a98529a282ffee8a1a21ef02a92b0538f2c790f62e6159b1f1f478340ddcf68a'
            '361d318ac3c846eaa6b0260baed8fe21ba5d6b079b0618962e8b67ae91928c61b1296eba2311d6bd032c8bca4a09e51d8fb73e6ff67039b35a5179701a0cd868')
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

  echo "u $_pkgname $_userid \"$_pkgname user\" /var/lib/$_pkgname" > "$srcdir/$_pkgname.sysusers"
  echo "#!/usr/bin/bash
if [[ \$USER != $_pkgname ]]; then
    echo \"Must run as user $_pkgname!\"
    exit -1
fi
export GOGS_CUSTOM=/var/lib/$_pkgname/custom
/usr/bin/$_pkgname backup --config /etc/$_pkgname/app.ini \$@" > "$srcdir/$_pkgname-backup.sh"
}

package() {
  install -Dm0755 "$srcdir/build/src/${_gourl}/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0755 "$srcdir/$_pkgname-backup.sh" "$pkgdir/usr/bin/$_pkgname-backup"

  mkdir -p "$pkgdir/usr/share/${_pkgname}"
  cp -r "$srcdir/build/src/${_gourl}/conf" "$pkgdir/usr/share/${_pkgname}"
  cp -r "$srcdir/build/src/${_gourl}/public" "$pkgdir/usr/share/${_pkgname}"
  cp -r "$srcdir/build/src/${_gourl}/templates" "$pkgdir/usr/share/${_pkgname}"

  install -Dm0664 -g "$_userid" "$pkgdir/usr/share/$_pkgname/conf/app.ini" "$pkgdir/etc/$_pkgname/app.ini"
  install -Dm0644 "$srcdir/build/src/${_gourl}/scripts/systemd/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm0644 "$srcdir/build/src/${_gourl}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm0644 "${srcdir}/$_pkgname.sysusers" "${pkgdir}/usr/lib/sysusers.d/$_pkgname.conf"
  install -dm0700 -o "$_userid" -g "$_userid" "$pkgdir/var/lib/$_pkgname"
  install -dm0700 -o "$_userid" -g "$_userid" "$pkgdir/var/log/$_pkgname"
  for subdir in avatars repos certs data/sessions data/tmp; do
    install -dm0700 -o "$_userid" -g "$_userid" "$pkgdir/var/lib/$_pkgname/$subdir"
  done
}
