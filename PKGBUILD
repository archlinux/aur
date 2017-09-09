# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>

_pkgname=busybox
pkgname=busybox-custom-git
pkgver=1.28.0
pkgrel=1
pkgdesc="Utilities for rescue and embedded systems"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "armv8h" "mips")
url="https://www.busybox.net"
license=('GPL')
makedepends=("make" "gcc" "sed" "ncurses" "musl" "kernel-headers-musl")
provides=("busybox" "busybox-custom-git" "busybox-custom")
conflicts=("busybox" "busybox-custom")
install=busybox.install
source=("$_pkgname::git+https://github.com/mirror/busybox.git"
	"config")
sha256sums=('SKIP'
           'SKIP')

build() {
  cd "$srcdir/$_pkgname"
  cp "$srcdir"/config .config
  sed '1,1i#include <sys/resource.h>' -i include/libbb.h
  # if you want to run menuconfig uncomment the following line:
  #make menuconfig ; return 1
  make CC=musl-gcc
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 busybox "$pkgdir"/usr/bin/busybox
  install -Dm644 docs/busybox.1 "$pkgdir"/usr/share/man/man1/busybox.1
  for doc in BusyBox.html BusyBox.txt; do
    install -Dm644 docs/$doc "$pkgdir"/usr/share/doc/$pkgname/$doc
  done
}
