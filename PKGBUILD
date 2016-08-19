# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=linux-test-project
pkgver=20160510
pkgrel=1
pkgdesc="A collection of tools for testing the Linux kernel and related features"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://linux-test-project.github.io/"
depends=('acl' 'bash' 'gawk' 'libcap' 'libtirpc' 'python2')
source=("https://github.com/linux-test-project/ltp/releases/download/$pkgver/ltp-full-$pkgver.tar.bz2"
        "trace_sched_build_fix.diff")
md5sums=('baa738d00b53d734c0515b2979a9577e'
         '852a73b5614df7ab6dbf6293136512de')

prepare() {
  cd "$srcdir/ltp-full-$pkgver"

  # fix compilation
  patch -Np1 < "$srcdir/trace_sched_build_fix.diff"
  # fix python scripts
  find . -type f -exec sed -i 's|^#!.*python$|#!/usr/bin/env python2|' '{}' ';'
}

build() {
  cd "$srcdir/ltp-full-$pkgver"

  ./configure --mandir=/usr/share/man --with-bash
  make all
}

package() {
  cd "$srcdir/ltp-full-$pkgver"

  make DESTDIR="$pkgdir" install
}

