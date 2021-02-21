# Maintainer: wuxb <wuxb45 at gmail dot com>
pkgname=spdk-git
pkgver=r0.0   # pkgver() updates this
pkgrel=9
pkgdesc='spdk-git: headers, libs, and scripts'
arch=('x86_64')
license=('BSD')
url='https://spdk.io/'
depends=('glibc')
makedepends=('cmake' 'meson')
provides=('spdk')
conflicts=('spdk' 'dpdk')
source=("$pkgname::git+https://github.com/spdk/spdk.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
prepare () {
  cd "$srcdir/$pkgname"
  git submodule update --init
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --with-shared --disable-tests --disable-unit-tests --enable-lto
  make
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p $pkgdir/usr/lib/
  mkdir -p $pkgdir/usr/include/spdk/
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/spdk/bin/
  mkdir -p $pkgdir/usr/share/spdk/examples/

  # programs and examples in /usr/share/spdk/
  cp -a build/bin/* $pkgdir/usr/share/spdk/bin/
  cp -a build/examples/* $pkgdir/usr/share/spdk/examples/

  # shared libs
  cp -a build/lib/* $pkgdir/usr/lib/
  cp -a dpdk/build/lib/* $pkgdir/usr/lib/
  # discard .pc files
  rm -rf $pkgdir/usr/lib/pkgconfig

  # header files
  cp -a include/spdk/* $pkgdir/usr/include/spdk/
  cp -rL dpdk/build/include/* $pkgdir/usr/include/

  # self-contained /usr/bin/spdk-setup
  echo '#!/usr/bin/env bash' >$pkgdir/usr/bin/spdk-setup
  cat scripts/{common,setup}.sh     >>$pkgdir/usr/bin/spdk-setup
  sed -ri '/^rootdir/d;/^source/d;s,\$rootdir,/usr,' $pkgdir/usr/bin/spdk-setup
  chmod +x $pkgdir/usr/bin/spdk-setup
}
