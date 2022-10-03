# https://github.com/archlinux/svntogit-packages/tree/packages/rsync

_pkgname=rsync
pkgname=rsync-reflink
_tag='40695f1e31d29e5d715d986a53cdad1fe0ce0210' # git rev-parse v${pkgver}
pkgver=3.2.6
pkgrel=2
pkgdesc='A fast and versatile file copying tool for remote and local files - with reflink support'
arch=('x86_64')
url='https://rsync.samba.org/'
license=('GPL3')
depends=('acl' 'libacl.so' 'lz4' 'openssl' 'perl' 'popt' 'xxhash' 'libxxhash.so' 'zlib' 'zstd')
makedepends=('git' 'python-commonmark')
backup=(
  'etc/rsyncd.conf'
  'etc/xinetd.d/rsync'
)
source=(
  "git+https://github.com/WayneD/rsync#tag=${_tag}"
  'https://github.com/WayneD/rsync-patches/raw/master/clone-dest.diff'
  'rsyncd.conf'
)
sha256sums=(
  'SKIP'
  'SKIP'
  '733ccb571721433c3a6262c58b658253ca6553bec79c2bdd0011810bb4f2156b'
)

_backports=(
  # Fix really silly bug with --relative rules.
  '464555ea923b32f3504678d05bc7de9205e5c8da'

  # Fix bug with validing remote filter rules.
  '950730313de994d191ba2d5be575e97690b355e8'
)

_reverts=(
)

prepare() {
  cd "$srcdir/rsync"

  local _c
  for _c in "${_backports[@]}"; do
    if [[ $_c == *..* ]]; then
      git log --oneline --reverse "${_c}"
    else
      git log --oneline -1 "${_c}"
    fi
    git cherry-pick -n -m1 "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    git log --oneline -1 "${_c}"
    git revert -n "${_c}"
  done

  # patch to add reflink support
  patch -p1 < "$srcdir/clone-dest.diff"
}

build() {
  cd "$srcdir/rsync"

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --with-included-popt=no \
    --with-included-zlib=no
  make
}

check() {
  cd "$srcdir/rsync"

  make test
}

package() {
  cd "$srcdir/rsync"

  make DESTDIR="$pkgdir" install
  install -Dm0644 ../rsyncd.conf "$pkgdir/etc/rsyncd.conf"
  install -Dm0644 packaging/lsb/rsync.xinetd "$pkgdir/etc/xinetd.d/rsync"
  install -Dm0644 packaging/systemd/rsync.service "$pkgdir/usr/lib/systemd/system/rsyncd.service"
  install -Dm0644 packaging/systemd/rsync.socket "$pkgdir/usr/lib/systemd/system/rsyncd.socket"
  install -Dm0644 packaging/systemd/rsync@.service "$pkgdir/usr/lib/systemd/system/rsyncd@.service"
  install -Dm0755 support/rrsync "$pkgdir/usr/lib/rsync/rrsync"
}
