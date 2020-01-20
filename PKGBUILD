# Maintainer: Robert Sprunk <arch-aur@sprunk.me>
# Contributor: Bryn Edwards <bryn.edwards@gmail.com>
pkgname=supysonic
pkgver=0.5.0
pkgrel=1
pkgdesc="A Python implementation of the Subsonic server API."
arch=('any')
url="https://github.com/spl0k/$pkgname"
license=('AGPL')
depends=(
  'python-flask'
  'python-pony'
  'python-pillow'
  'python-requests'
  'python-mutagen'
  'python-watchdog'
  'python-zipstream'
)
makedepends=(
  'git'
  'python-setuptools'
  'python-pip'
)
optdepends=('ffmpeg: Transcoder support'
            'mpv: Jukebox support'
            'mariadb: MariaDB database'
            'python-mysqlclient: MySQL compatible database support'
            'mod_wsgi: Apache WSGI module'
            'postgresql: PostgreSQL database'
            'python-psycopg2: PostgreSQL database support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/spl0k/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname.ini"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "$pkgname-daemon.service"
        "apache-wsgi.conf")
sha256sums=('5bc10c8928228bc0534c66b9b620fe300b8ac18693b3ae110ae3271184f5ddfe'
            'e8a10b2be1c3b6757cee8928f2e585351da9e9b6eadfa68c8905913108a26b80'
            'b4b723d30fb45f86a15ec218910cd3935aac4546d5e2f9a1e1bc79cccfb98480'
            '430eba10de5381a425074b89d0a46fb770be5112b26e81ac6a2b55765675cb13'
            'a5222df6f6c15fafc7e20ccc97c365bbb29112a60d58c9a31129e581f482819b'
            '153b01e713b8520036d6d25b3e5cee36498772c0d696078324996570046a1a11')
backup=("etc/$pkgname")
install=$pkgname.install

prepare() {
  cd $pkgname-$pkgver
  cp cgi-bin/server.py $pkgname/server.py
  cp "cgi-bin/$pkgname.wsgi" $pkgname/wsgi.py
  cp "cgi-bin/$pkgname.fcgi" $pkgname/fcgi.py
  cp "cgi-bin/$pkgname.cgi" $pkgname/cgi.py
}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm664 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -m664 -t "$pkgdir/usr/share/doc/$pkgname" docs/*.md
  # TODO generate man page from docs/man
  install -dm644 "$pkgdir/var/lib/$pkgname"

  cd $srcdir
  install -Dm664 "$pkgname.ini" "$pkgdir/etc/$pkgname"
  install -Dm664 "apache-wsgi.conf" "$pkgdir/usr/share/doc/$pkgname/apache-wsgi.conf"
  install -Dm664 "$srcdir/$pkgname.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm664 "$srcdir/$pkgname.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm664 "$srcdir/$pkgname-daemon.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname-daemon.service"
}
