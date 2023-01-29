# https://github.com/archlinux/svntogit-packages/tree/packages/rsync

_pkgname=rsync
pkgname="$_pkgname-reflink"
pkgver=3.2.7
pkgrel=3
pkgdesc='A fast and versatile file copying tool for remote and local files - with reflink support'
arch=('x86_64')
url='https://rsync.samba.org/'
license=('GPL3')
depends=(
  'acl'
  'libacl.so'
  'libxxhash.so'
  'popt'
  'xxhash'
  'zstd'
)
optdepends=(
  'python: for rrsync'
)
makedepends=('git' 'python-commonmark')
provides=("$_pkgname")
conflicts=(${provides[@]})
backup=(
  'etc/rsyncd.conf'
  'etc/xinetd.d/rsync'
)
source=(
  "$_pkgname"::"git+https://github.com/WayneD/rsync#tag=v${pkgver}"
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

_backports=(
)

_reverts=(
)

prepare() {
  cd "$srcdir/$_pkgname"

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

  # patches
  patch -Np1 -F100 -i "$srcdir/clone-dest.diff"
  patch -Np1 -F100 -i "$srcdir/detect-renamed.diff"
  patch -Np1 -F100 -i "$srcdir/detect-renamed-lax.diff"
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

  make DESTDIR="$pkgdir" install
  install -Dm0644 ../rsyncd.conf "$pkgdir/etc/rsyncd.conf"
  install -Dm0644 packaging/lsb/rsync.xinetd "$pkgdir/etc/xinetd.d/rsync"
  install -Dm0644 packaging/systemd/rsync.service "$pkgdir/usr/lib/systemd/system/rsyncd.service"
  install -Dm0644 packaging/systemd/rsync.socket "$pkgdir/usr/lib/systemd/system/rsyncd.socket"
  install -Dm0644 packaging/systemd/rsync@.service "$pkgdir/usr/lib/systemd/system/rsyncd@.service"
  install -Dm0755 support/rrsync "$pkgdir/usr/lib/rsync/rrsync"
}
