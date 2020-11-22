pkgname=asterisk-odbc-mysql
_pkgname=asterisk
pkgver=18.1.0
pkgrel=2
pkgdesc='A complete PBX solution'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
provides=("asterisk=${pkgver}")
conflicts=('asterisk')
url='https://www.asterisk.org'
license=('GPL')
depends=('alsa-lib'
         'curl'
         'jansson'
         'libedit'
         'libxml2'
         'libxslt'
         'popt'
         'myodbc')
makedepends=('gsm'
             'sqlite3')
optdepends=('dahdi'
            'opus'
            'libvorbis'
            'libpri'
            'libsrtp'
            'libss7'
            'lua51'
            'openr2'
            'postgresql'
            'speex'
            'libmysqlclient')
install=$_pkgname.install
source=("https://downloads.asterisk.org/pub/telephony/$_pkgname/releases/$_pkgname-$pkgver.tar.gz"
        "$_pkgname.sysusers"
        "$_pkgname.logrotated"
        "$_pkgname.tmpfile")
sha256sums=('cc12f6c228243fb736d0aa23f3ce11adf7be5c5b02ed1ca080db76605cb602df'
            'fc2e42f79e1672cc25b9b8ad2ba99616fbba0047641c986d30718655d0e7d4d8'
            'caa24cfec5c6b4f8cea385269e39557362acad7e2a552994c3bc24080e3bdd4e'
            '673c0c55bce8068c297f9cdd389402c2d5d5a25e2cf84732cb071198bd6fa78a')

build() {
  cd "$_pkgname-$pkgver"
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --sbindir=/usr/bin \
      --with-pjproject-bundled=yes
  make menuselect.makeopts
  ./menuselect/menuselect --disable BUILD_NATIVE
  make
}

package(){
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-headers

  mv "$pkgdir/var/run" "$pkgdir"

  pushd contrib/systemd
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "$_pkgname"*.{service,socket}

  pushd "$srcdir"
  install -Dm644 "$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$_pkgname.logrotated" "$pkgdir/etc/logrotate.d/$_pkgname"
  install -Dm644 "$_pkgname.tmpfile" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
