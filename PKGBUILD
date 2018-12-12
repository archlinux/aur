# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>

_pkgname=gogs
_orga=gogs
_gourl=github.com/$_orga/$_pkgname
_userid=511
_confdir=conf
_scriptsdir=scripts

pkgname=$_pkgname
pkgver=0.11.79
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
makedepends=('go>=1.3')
conflicts=("$_pkgname-bin" "$_pkgname-git" "$_pkgname-dev-git")
options=('!strip')
backup=("etc/$_pkgname/app.ini")
source=("$_pkgname-$pkgver::https://github.com/$_orga/$_pkgname/archive/v${pkgver}.tar.gz"
        '0001-Adjust-config-for-Arch-Linux-package.patch'
        '0002-Adjust-service-file-for-Arch-Linux-package.patch')
sha512sums=('0534439c7b8ece9c2f88ace8d5247a735c5f6c0c6153d2d4db8a01a147c4443e0b77ab3516e9faa6c5895c0c40cbfdcacaf158822635d3e0c0f1983f859e4f94'
            'b1ae473eba5bfb693e507ce82f2a81beb066ab5869d8d089963f8d4740cc77e203b8653cbeeb196a86e65d04e2a288056fb3196364e247dd11906b77fd7ace8b'
            '71c38f86b3e351f8f69504835082618cf5f63897246ee0691f1b7d518e164bd68681e14134e97fcfb369c960c6a81da92c86bc40b5c9ee6f171af1f1a1a7e8a4')
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

  # build sysusers file
  echo "u $_pkgname $_userid \"$_pkgname user\" /var/lib/$_pkgname /bin/bash" > "$srcdir/$_pkgname.sysusers"

  # build tmpfiles file
  echo "d /var/lib/$_pkgname 0755 $_pkgname $_pkgname
d /var/log/$_pkgname 0755 $_pkgname $_pkgname
d /etc/$_pkgname 0775 root $_pkgname" > "$srcdir/$_pkgname.tmpfiles"

  # build wrapper script for Gogs' backup command
  if [[ $pkgname == 'gogs' ]]; then
    echo "#!/usr/bin/bash
if [[ \$USER != $_pkgname ]]; then
    echo \"Must run as user $_pkgname!\"
    exit -1
fi
export GOGS_CUSTOM=/var/lib/$_pkgname/custom
/usr/bin/$_pkgname backup --config /etc/$_pkgname/app.ini \$@" > "$srcdir/$_pkgname-backup.sh"
  fi
}

package() {
  install -Dm0755 "$srcdir/build/src/${_gourl}/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  if [[ $pkgname == 'gogs' ]]; then
    install -Dm0755 "$srcdir/$_pkgname-backup.sh" "$pkgdir/usr/bin/$_pkgname-backup"
  fi

  mkdir -p "$pkgdir/usr/share/${_pkgname}"
  cp -r "$srcdir/build/src/${_gourl}/${_confdir}" "$pkgdir/usr/share/${_pkgname}"
  cp -r "$srcdir/build/src/${_gourl}/public" "$pkgdir/usr/share/${_pkgname}"
  cp -r "$srcdir/build/src/${_gourl}/templates" "$pkgdir/usr/share/${_pkgname}"

  mkdir -p "$pkgdir/etc/$_pkgname"
  install -Dm0664 -g "$_userid" "$pkgdir/usr/share/$_pkgname/conf/app.ini"* "$pkgdir/etc/$_pkgname/app.ini"
  install -Dm0644 "$srcdir/build/src/${_gourl}/${_scriptsdir}/systemd/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm0644 "$srcdir/build/src/${_gourl}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm0644 "${srcdir}/$_pkgname.sysusers" "${pkgdir}/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm0644 "${srcdir}/$_pkgname.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -dm0700 -o "$_userid" -g "$_userid" "$pkgdir/var/lib/$_pkgname"
  install -dm0700 -o "$_userid" -g "$_userid" "$pkgdir/var/log/$_pkgname"
  for subdir in avatars repos certs data/sessions data/tmp; do
    install -dm0700 -o "$_userid" -g "$_userid" "$pkgdir/var/lib/$_pkgname/$subdir"
  done
  if [[ $pkgname == 'gitea' ]]; then
    install -dm0700 -o "$_userid" -g "$_userid" "$pkgdir/var/lib/$_pkgname/conf"
    cp -r "$srcdir/build/src/${_gourl}/options/locale" "$pkgdir/var/lib/$_pkgname/conf"
  fi
}
