# Maintainer: Xingbo Wu <wuxb45 at gmail dot com>
pkgname=spdk-git
pkgver=r0.0   # pkgver() updates this
pkgrel=1
pkgdesc='spdk-git with only headers/libs'
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
  ./configure --prefix=/usr --with-shared --disable-tests --without-isal
  make
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p $pkgdir/usr/lib/
  mkdir -p $pkgdir/usr/include/spdk/
  mkdir -p $pkgdir/usr/include/dpdk/

  cp -a build/lib/* $pkgdir/usr/lib/
  cp -a dpdk/build/lib/* $pkgdir/usr/lib/
  cp -a include/spdk/* $pkgdir/usr/include/spdk/
  cp -rL dpdk/build/include/* $pkgdir/usr/include/dpdk/

  #mkdir -p $pkgdir/usr/share/spdk/
  #cp -a scripts/ $pkgdir/usr/share/spdk/scripts
  #cp -a examples/ $pkgdir/usr/share/spdk/examples
  #cp -a mk/ $pkgdir/usr/share/spdk/mk
}
