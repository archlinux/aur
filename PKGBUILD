# Maintainer: envolution
# Contributor: Martchus <martchus@gmx.net>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=gogs
_orga=gogs
_gourl=github.com/$_orga/$_pkgname
_userid=511
_confdir=conf
_scriptsdir=scripts

pkgname=$_pkgname
pkgver=0.13.3
pkgrel=1
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
makedepends=('go>=1.18')
backup=("etc/$_pkgname/app.ini")
source=("$_pkgname-$pkgver::https://github.com/$_orga/$_pkgname/archive/v${pkgver}.tar.gz"
  '0001-Adjust-config-for-Arch-Linux-package.patch'
  '0002-Adjust-service-file-for-Arch-Linux-package.patch')
sha512sums=('6c5a6b61837624f74f8f8a3834c6ffa7e2d51728e5e194078a2814ce58452f44520d652e2df39055205ddb66080b38ccbc1ff01b08a2ca5e6ca629b2961e9ce3'
            '763ea6857a2bd28d1e6d95f58d67de0503b3f36ee1419dd1efce6ae187d7f529e4f1674b160a5902f16bc180983f3b29bcbe4ec8fc3c0d32de7374939ea364c5'
            '162c9dd3b5c5f2910b3887109d460dcb82631b2e5b8d906699e5a581c3350a9b0511ccc470621828f8839ad7bac240439d01461ae5fb3efdee948307ef195c2d')
_goroot='/usr/lib/go'

prepare() {
  export GOROOT="$_goroot"

  echo 'Prepare GO build enviroment'
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

  echo 'Patch config and service file'
  cd "$GOPATH/src/${_gourl}"
  patch -Np1 -i "$srcdir/0001-Adjust-config-for-Arch-Linux-package.patch"
  patch -Np1 -i "$srcdir/0002-Adjust-service-file-for-Arch-Linux-package.patch"
}

build() {
  export GOROOT="$srcdir/build/go"
  export GOPATH="$srcdir/build"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd "$GOPATH/src/${_gourl}"

  go fix
  go build -x -ldflags="-s -w" -tags='sqlite pam cert'

  # build sysusers file
  echo "u $_pkgname $_userid \"$_pkgname user\" /var/lib/$_pkgname /bin/bash" >"$srcdir/$_pkgname.sysusers"

  # build tmpfiles file
  echo "d /var/lib/$_pkgname 0755 $_pkgname $_pkgname
d /var/log/$_pkgname 0755 $_pkgname $_pkgname
d /etc/$_pkgname 0775 root $_pkgname" >"$srcdir/$_pkgname.tmpfiles"

  # build wrapper script for Gogs' backup command
  if [[ $pkgname == 'gogs' ]]; then
    echo "#!/usr/bin/bash
if [[ \$USER != $_pkgname ]]; then
    echo \"Must run as user $_pkgname!\"
    exit -1
fi
export GOGS_CUSTOM=/var/lib/$_pkgname/custom
/usr/bin/$_pkgname backup --config /etc/$_pkgname/app.ini \$@" >"$srcdir/$_pkgname-backup.sh"
  fi
}

package() {
  install -Dm0755 "$srcdir/build/src/${_gourl}/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0755 "$srcdir/$_pkgname-backup.sh" "$pkgdir/usr/bin/$_pkgname-backup"

  mkdir -p "$pkgdir/usr/share/${_pkgname}"
  cp -r "$srcdir/build/src/${_gourl}/${_confdir}" "$pkgdir/usr/share/${_pkgname}"
  cp -r "$srcdir/build/src/${_gourl}/public" "$pkgdir/usr/share/${_pkgname}"
  cp -r "$srcdir/build/src/${_gourl}/templates" "$pkgdir/usr/share/${_pkgname}"

  mkdir -p "$pkgdir/etc/$_pkgname"
  chmod 775 "$pkgdir/etc/$_pkgname"
  install -Dm0664 -g "$_userid" --target-directory="$pkgdir/etc/$_pkgname" "$pkgdir/usr/share/$_pkgname/conf/app.ini"*
  install -Dm0644 "$srcdir/build/src/${_gourl}/${_scriptsdir}/systemd/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm0644 "$srcdir/build/src/${_gourl}/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm0644 "${srcdir}/$_pkgname.sysusers" "${pkgdir}/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm0644 "${srcdir}/$_pkgname.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -dm0700 -o "$_userid" -g "$_userid" "$pkgdir/var/lib/$_pkgname"
  install -dm0700 -o "$_userid" -g "$_userid" "$pkgdir/var/log/$_pkgname"
  for subdir in avatars repos certs data/sessions data/tmp; do
    install -dm0700 -o "$_userid" -g "$_userid" "$pkgdir/var/lib/$_pkgname/$subdir"
  done
}
# vim:set ts=2 sw=2 et:
