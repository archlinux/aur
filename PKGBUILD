_pkgname=rsync
pkgname=rsync-reflink-git
pkgver=3.2.7.r8.g74028965
pkgrel=1
pkgdesc='A fast and versatile file copying tool for remote and local files - with reflink support (git)'
arch=('i686' 'x86_64')
url='https://github.com/WayneD/rsync/issues/153'
license=('GPL3')
depends=('acl' 'libacl.so' 'lz4' 'openssl' 'perl' 'popt' 'xxhash' 'libxxhash.so' 'zlib' 'zstd')
makedepends=('git' 'python-commonmark')
provides=("${_pkgname}")
conflicts=(${provides[@]})
backup=(
  'etc/rsyncd.conf'
  'etc/xinetd.d/rsync'
)
source=(
  "${_pkgname}-git"::"git+https://github.com/WayneD/rsync"
  'https://github.com/WayneD/rsync-patches/raw/master/clone-dest.diff'
  'https://github.com/WayneD/rsync-patches/raw/master/detect-renamed.diff'
  'https://github.com/WayneD/rsync-patches/raw/master/detect-renamed-lax.diff'
  'rsyncd.conf'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  '733ccb571721433c3a6262c58b658253ca6553bec79c2bdd0011810bb4f2156b'
)

pkgver() {
  cd "$srcdir/${_pkgname}-git"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${_pkgname}-git"
  patch -Np1 -F100 -i "$srcdir/clone-dest.diff"
  patch -Np1 -F100 -i "$srcdir/detect-renamed.diff"
  patch -Np1 -F100 -i "$srcdir/detect-renamed-lax.diff"
}

build() {
  cd "${srcdir}/${_pkgname}-git"

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --with-included-popt=no \
    --with-included-zlib=no
  make
}

check() {
  cd "${srcdir}/${_pkgname}-git"
  make test
}


package() {
  cd "${srcdir}/${_pkgname}-git"

  make DESTDIR="$pkgdir" install
  install -Dm0644 ../rsyncd.conf "$pkgdir/etc/rsyncd.conf"
  install -Dm0644 packaging/lsb/rsync.xinetd "$pkgdir/etc/xinetd.d/rsync"
  install -Dm0644 packaging/systemd/rsync.service "$pkgdir/usr/lib/systemd/system/rsyncd.service"
  install -Dm0644 packaging/systemd/rsync.socket "$pkgdir/usr/lib/systemd/system/rsyncd.socket"
  install -Dm0644 packaging/systemd/rsync@.service "$pkgdir/usr/lib/systemd/system/rsyncd@.service"
  install -Dm0755 support/rrsync "$pkgdir/usr/lib/rsync/rrsync"  
}
