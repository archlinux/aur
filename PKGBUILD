# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=plocate-git
pkgver=1.1.11.r2.ga2a3c6f
pkgrel=1
pkgdesc="A locate(1) based on posting lists, completely replacing mlocate with a much faster (and smaller) index"
arch=('i686' 'x86_64')
url="https://plocate.sesse.net/"
license=('GPL')
depends=('glibc' 'liburing' 'systemd' 'zstd')
makedepends=('git' 'meson')
provides=('plocate')
conflicts=('plocate' 'mlocate')
backup=('etc/updatedb.conf')
source=("git+https://git.sesse.net/plocate"
        "plocate.sysusers::https://github.com/archlinux/svntogit-community/blob/packages/plocate/trunk/plocate.sysusers"
        "plocate.tmpfiles::https://github.com/archlinux/svntogit-community/blob/packages/plocate/trunk/plocate.tmpfiles"
        "updatedb.conf::https://github.com/archlinux/svntogit-community/blob/packages/plocate/trunk/updatedb.conf")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "plocate"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "plocate"

  meson \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    -Dlocategroup=locate \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "plocate"

  meson test -C "_build"
}

package() {
  cd "plocate"

  DESTDIR="$pkgdir" meson install -C "_build"

  chgrp 21 "$pkgdir/usr/bin/plocate"
  chmod 2755 "$pkgdir/usr/bin/plocate"

  install -Dm644 "$srcdir/plocate.sysusers" "$pkgdir/usr/lib/sysusers.d/plocate.conf"
  install -Dm644 "$srcdir/plocate.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/plocate.conf"
  install -Dm644 "$srcdir/updatedb.conf" -t "$pkgdir/etc"
}
