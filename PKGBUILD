_pkgname=rsync-git
pkgname=rsync-reflink-git
pkgver=3.2.7pre1.r2.g00b361db
pkgrel=1
pkgdesc='A fast and versatile file copying tool for remote and local files - git checkout with reflink support'
arch=('i686' 'x86_64')
url='https://github.com/WayneD/rsync/issues/153'
license=('GPL3')
depends=('acl' 'libacl.so' 'lz4' 'openssl' 'perl' 'popt' 'xxhash' 'libxxhash.so' 'zlib' 'zstd')
makedepends=('git' 'python-commonmark')
provides=('rsync')
conflicts=('rsync')
backup=(
  'etc/rsyncd.conf'
  'etc/xinetd.d/rsync'
)
source=(
  "$_pkgname"::"git+https://github.com/WayneD/rsync"
  'https://github.com/WayneD/rsync-patches/raw/master/clone-dest.diff'
  'rsyncd.conf'
)
sha256sums=(
  'SKIP'
  'SKIP'
  '733ccb571721433c3a6262c58b658253ca6553bec79c2bdd0011810bb4f2156b'
)

pkgver() {
  cd "$srcdir/$_pkgname"

  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    printf '%s.r%s.g%s' \
      "$(sed -e "s/^${_pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
      "$(git rev-list --count ${GITTAG}..)" \
      "$(git rev-parse --short HEAD)"
  else
    printf '0.r%s.g%s' \
      "$(git rev-list --count master)" \
      "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -p1 < "$srcdir/clone-dest.diff"
}

build() {
  cd "$srcdir/$_pkgname"

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --with-included-popt=no \
    --with-included-zlib=no
  make
}

check() {
  cd "$srcdir/$_pkgname"
  make test
}


package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="${pkgdir}" install

  make DESTDIR="$pkgdir" install
  install -Dm0644 ../rsyncd.conf "$pkgdir/etc/rsyncd.conf"
  install -Dm0644 packaging/lsb/rsync.xinetd "$pkgdir/etc/xinetd.d/rsync"
  install -Dm0644 packaging/systemd/rsync.service "$pkgdir/usr/lib/systemd/system/rsyncd.service"
  install -Dm0644 packaging/systemd/rsync.socket "$pkgdir/usr/lib/systemd/system/rsyncd.socket"
  install -Dm0644 packaging/systemd/rsync@.service "$pkgdir/usr/lib/systemd/system/rsyncd@.service"
  install -Dm0755 support/rrsync "$pkgdir/usr/lib/rsync/rrsync"  
}
