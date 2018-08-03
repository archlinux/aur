# Maintainer: redfish <redfish at galactica dot pw>

pkgname='transmission-i2p-git'
_gitname='transmission-i2p'
pkgver=2.82
pkgrel=1
arch=('any')
url="http://bioq5jbcnfopqwvk7qssaxcl7avzeta6mu72jmxjeowflpcrhf6q.b32.i2p/transmission"
depends=('i2pd' 'openssl-1.0' 'intltool')
#('curl' 'libidn2' 'libnghttp2' 'libssh2' 'libpsl') # TODO: are these deps transitive?
makedepends=('git')
license=('MIT')
pkgdesc="Standalone I2P BitTorrent Client over I2P network"
provides=(transmission-i2p)
conflicts=(transmission-i2p)
source=("git+https://github.com/l-n-s/transmission-i2p.git"
        "m4-glib-gettext.patch"
        "utp-debug.patch"
        "settings.json"
        "transmission-i2p.service")
md5sums=('SKIP'
         'e8b2a730396b9e1e90acb4424d704063'
         'f554af5f5b1c200f1464122fad1c2272'
         'e801960cbf81ceb246108ca7edd8086f'
         'a5952b62a60d951948f9776aefa4715c')
install="transmission-i2p.install"

#options=(debug)

pkgver() {
  cd "$srcdir/$_gitname"
  #echo $(git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  printf "$(echo $pkgver | sed 's/\.r.*//').r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"

  patch -p1 < ../m4-glib-gettext.patch
  patch -p1 < ../utp-debug.patch

  rm missing

  autoreconf || automake --add-missing
  autoreconf
}

build() {
  cd "$srcdir/$_gitname"

  if check_option "debug" "y"
  then
        DEBUG_CFLAGS="-D_DEBUG "
  fi

  CFLAGS="$DEBUG_CFLAGS -D_LINUX_QUOTA_VERSION=2 " \
  LDFLAGS="-L/usr/lib/openssl-1.0" \
  OPENSSL_CFLAGS="-I/usr/include/openssl-1.0" \
  ./configure --prefix=$pkgdir/usr \
        --enable-utp --enable-cli --enable-daemon

  make
}

package() {
   cd "$srcdir/$_gitname"

   make install

   for t in create edit show daemon remote cli
   do
       mv $pkgdir/usr/bin/transmission{,-i2p}-$t
       mv $pkgdir/usr/share/man/man1/transmission{,-i2p}-$t.1
   done
   mv $pkgdir/usr/share/transmission{,-i2p}

   #install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
   install -D -m644 "$srcdir/settings.json"    "$pkgdir/usr/share/transmission-i2p/settings.json.example"

   install -D -m644 "$srcdir/transmission-i2p.service" "$pkgdir/usr/lib/systemd/system/transmission-i2p.service"
}
