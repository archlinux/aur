# Maintainer: LS-Shandong <ls-shandong at outlook dot com>

pkgname=plocate-enhanced-git
pkgver=1.1.24.r353.97396d8
pkgver_main=1.1.24
pkgrel=1
pkgdesc="LS-Shandong's plocate fork with i18n support and Simplified Chinese translation."
arch=('i686' 'x86_64' 'aarch64')
url="https://codeberg.org/LS-Shandong/plocate"
license=('GPL-2.0-or-later AND GPL-2.0-or-only')
depends=('glibc' 'liburing' 'systemd' 'zstd')
makedepends=('git' 'meson')
provides=("plocate=$pkgver")
conflicts=('plocate' 'mlocate' 'plocate-git')
backup=('etc/updatedb.conf')
source=("git+https://codeberg.org/LS-Shandong/plocate"
        "plocate.sysusers::https://gitlab.archlinux.org/archlinux/packaging/packages/plocate/-/raw/main/plocate.sysusers"
        "plocate.tmpfiles::https://gitlab.archlinux.org/archlinux/packaging/packages/plocate/-/raw/main/plocate.tmpfiles"
        "updatedb.conf::https://gitlab.archlinux.org/archlinux/packaging/packages/plocate/-/raw/main/updatedb.conf")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
            
pkgver() {
  cd "plocate"
  printf "%s.r%s.%s" $pkgver_main "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "plocate"
  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    -Dlocategroup=locate \
    "build"
  meson compile -C "build"
}

package() {
  cd "plocate"

  meson install -C "build" --destdir "$pkgdir"

  chgrp 21 "$pkgdir/usr/bin/plocate"
  chmod 2755 "$pkgdir/usr/bin/plocate"

  install -Dm644 "$srcdir/plocate.sysusers" "$pkgdir/usr/lib/sysusers.d/plocate.conf"
  install -Dm644 "$srcdir/plocate.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/plocate.conf"
  install -Dm644 "$srcdir/updatedb.conf" -t "$pkgdir/etc"
}
