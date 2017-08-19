# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=busybox-git
pkgver=1.30.0.r84.gd712edc6d
pkgrel=1
pkgdesc="Tiny versions of many common UNIX utilities"
arch=('i686' 'x86_64')
url="https://www.busybox.net/"
license=('GPL')
makedepends=('git' 'kernel-headers-musl' 'musl' 'ncurses')
provides=('busybox')
conflicts=('busybox')
source=("git://git.busybox.net/busybox"
        "config::https://git.archlinux.org/svntogit/community.git/plain/trunk/config?h=packages/busybox")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "busybox"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "busybox"

  cp "$srcdir/config" ".config"
  yes "" | make oldconfig

  export KCONFIG_NOTIMESTAMP=1  # reproducible build
  make CC=musl-gcc
}

check() {
  cd "busybox"

  #make check
}

package() {
  cd "busybox"

  install -Dm755 "busybox" "$pkgdir/usr/bin/busybox"

  install -Dm644 "docs/busybox.1" "$pkgdir/usr/share/man/man1/busybox.1"
  install -Dm644 "docs/BusyBox.html" "$pkgdir/usr/share/doc/busybox/BusyBox.html"
  install -Dm644 "docs/BusyBox.txt" "$pkgdir/usr/share/doc/busybox/BusyBox.txt"
}
