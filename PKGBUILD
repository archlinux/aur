# Maintainer: Xingbo Wu <wuxb45 at gmail dot com>
pkgname=spdk-git
pkgver=r0.0   # pkgver() updates this
pkgrel=4
pkgdesc='spdk-git: headers, libs, and scripts'
arch=('x86_64')
license=('BSD')
url='https://spdk.io/'
depends=('glibc')
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

build() {
  cd "$srcdir/$pkgname"
  git submodule update --init
  ./configure --prefix=/usr --with-shared --disable-tests --disable-unit-tests --without-isal
  make
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p $pkgdir/usr/lib/
  mkdir -p $pkgdir/usr/include/spdk/
  mkdir -p $pkgdir/usr/include/dpdk/
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/spdk/bin/

  cp -a build/lib/* $pkgdir/usr/lib/
  cp -a dpdk/build/lib/* $pkgdir/usr/lib/
  cp -a include/spdk/* $pkgdir/usr/include/spdk/
  cp -rL dpdk/build/include/* $pkgdir/usr/include/dpdk/

  echo '#!/usr/bin/env bash' >$pkgdir/usr/bin/spdk-setup
  cat scripts/{common,setup}.sh     >>$pkgdir/usr/bin/spdk-setup
  sed -ri '/^rootdir/d;/^source/d;s,\$rootdir,/usr,' $pkgdir/usr/bin/spdk-setup
  chmod +x $pkgdir/usr/bin/spdk-setup

  find examples/ app/ -type f -executable -execdir install -T -m 00755 {} $pkgdir/usr/share/spdk/bin/{} \;
}
