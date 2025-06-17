# Maintainer: Thomas Hügel <thomas huegel -a-t- aquilenet fr>

pkgname=typedb-all-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="TypeDB server & console"
arch=('x86_64')
url="https://typedb.com/"
license=('MPL-2.0')
depends=('java-runtime>=17')
source=("https://repo.typedb.com/public/public-release/raw/names/typedb-all-linux-x86_64/versions/$pkgver/typedb-all-linux-x86_64-$pkgver.tar.gz"
        "typedb.service"
        "typedb.sysusers")
sha256sums=('a2d20beb45115bcbcb3c583c1fa634d3267bbc02e5ed6dfb41c1003f3b3e7cc5'
            'c1dad3f686e5127745a99ea27f454585955b672449f4cfc0c812cc5ca3521adc'
            '81456a9300c50ea1aa5ed82df653e0821438bed9a29fe97f44699861072667eb')

_pkgdir="typedb-all-linux-x86_64-$pkgver"

prepare() {
  cd "$srcdir/$_pkgdir"
  chmod -x LICENSE
  chmod +x typedb 
  chmod +x server/typedb_server_bin
}

package() {
  # Main directory
  install -d -m755 "$pkgdir/usr/lib/typedb"
  cp -a $srcdir/$_pkgdir/* "$pkgdir/usr/lib/typedb"

  # Symbolic links executables
  install -d -m755 "$pkgdir/usr/bin"
  ln -s /usr/lib/typedb/typedb "$pkgdir/usr/bin/typedb"
  ln -s /usr/lib/typedb/typedb-console "$pkgdir/usr/bin/typedb-console"

  # Data and logs
  install -d -m755 "$pkgdir/var/lib/typedb"
  install -d -m755 "$pkgdir/var/log/typedb"

  # Systemd files
  install -Dm644 "$srcdir/typedb.service" "$pkgdir/usr/lib/systemd/system/typedb.service"
  install -Dm644 "$srcdir/typedb.sysusers" "$pkgdir/usr/lib/sysusers.d/typedb.conf"
}