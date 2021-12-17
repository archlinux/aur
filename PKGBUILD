pkgname=binkd
pkgver=1.1a.113
pkgrel=1
pkgdesc="Binkley protocol daemon for transferring files between Fidonet systems"
arch=('i686' 'x86_64')
url="https://github.com/pgul/binkd"
license=('GPL')
backup=("etc/binkd/binkd.conf")
_pkgcommit=9dbc1e709fb2f3060bdb4ae0d274d38823a90aab
source=("git+https://github.com/pgul/binkd.git#commit=$_pkgcommit"
        "binkd.service"
        "binkd@.service"
        "binkd.socket"
        "binkd.tmpfiles")
install="binkd.install"
sha256sums=('SKIP'
            '3f2ddf00b1552ad90a7320c7d904afab13fb2de525568190c80c7d87f67cc0c8'
            '2ebaebb7b525f9eaa1915dfeabba1626422d300f9820981225509203e6dcbc59'
            '2ddcb26a54f7a0f9a8ab5d8819431fb1f2bd961169c6fe5e7afa7f4c89e11786'
            '5032916082884a938978f0d5168fd053baab230bd34e84008ae637515e04a685')

pkgver() {
  grep Version "$srcdir/binkd/mkfls/unix/binkd.spec" | awk '{ print $2 }'
  #git describe --tags | sed 's/^binkd-//; s/-/.r/; s/[-_]/./g'
}

build() {
  cd "$srcdir/binkd"
  cp mkfls/unix/{Makefile*,configure*,install-sh,mkinstalldirs} .
  ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --mandir=/usr/share/man \
    --sysconfdir=/etc       \
    --with-debug            \
    --with-zlib             \
    ;
  make
}

package() {
  cd "$srcdir/binkd"
  make DESTDIR="$pkgdir" install

  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"

  install -dm0755 "$pkgdir/etc/binkd"
  mv "$pkgdir/etc/binkd.conf-dist" "$pkgdir/etc/binkd/binkd.conf"

  for dir in inbound{,-temp,-unsecure} outbound/fidonet longbox personalboxes nodelist; do
    mkdir -p "$pkgdir/var/spool/ftn/$dir"
  done

  cd "$srcdir"
  install -Dm0644 binkd.service   "$pkgdir/usr/lib/systemd/system/binkd.service"
  install -Dm0644 binkd@.service  "$pkgdir/usr/lib/systemd/system/binkd@.service"
  install -Dm0644 binkd.socket    "$pkgdir/usr/lib/systemd/system/binkd.socket"
  install -Dm0644 binkd.tmpfiles  "$pkgdir/usr/lib/tmpfiles.d/binkd.conf"
}

# vim: ts=2:sw=2:et
