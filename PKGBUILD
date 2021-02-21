# Maintainer: wuxb <wuxb45 at gmail dot com>
pkgname=spdk
pkgver=21.01
pkgrel=1
pkgdesc='spdk: headers, libs, and scripts'
arch=('x86_64')
license=('BSD')
url='https://spdk.io/'
depends=('glibc')
makedepends=('cmake' 'meson')
provides=('spdk')
conflicts=('spdk' 'dpdk')
source=("$pkgname::git+https://github.com/spdk/spdk.git#tag=v${pkgver}")
sha256sums=('SKIP')

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

  cp -a build/lib/* $pkgdir/usr/lib/
  cp -a dpdk/build/lib/* $pkgdir/usr/lib/
  cp -a include/spdk/* $pkgdir/usr/include/spdk/
  cp -rL dpdk/build/include/* $pkgdir/usr/include/

  echo '#!/usr/bin/env bash' >$pkgdir/usr/bin/spdk-setup
  cat scripts/{common,setup}.sh     >>$pkgdir/usr/bin/spdk-setup
  sed -ri '/^rootdir/d;/^source/d;s,\$rootdir,/usr,' $pkgdir/usr/bin/spdk-setup
  chmod +x $pkgdir/usr/bin/spdk-setup

  find examples/ app/ -type f -executable -execdir install -T -m 00755 {} $pkgdir/usr/share/spdk/bin/{} \;
}
