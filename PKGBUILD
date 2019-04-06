# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xfsprogs-git
pkgver=4.20.0.r0.g413a0f0d
pkgrel=1
pkgdesc="Utilities for managing the XFS filesystem"
arch=('i686' 'x86_64')
url="https://xfs.org"
license=('GPL2' 'LGPL')
depends=('glibc' 'sh' 'libutil-linux' 'readline')
makedepends=('git')
provides=('xfsprogs')
conflicts=('xfsprogs')
options=('staticlibs')
source=("git+https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git")
sha256sums=('SKIP')


pkgver() {
  cd "xfsprogs-dev"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "xfsprogs-dev"

  make configure
  OPTIMIZER="-march=${CARCH/_/-} -O2"
  DEBUG="-DNDEBUG"
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --enable-readline
  make
}

package() {
  cd "xfsprogs-dev"

  make DIST_ROOT="$pkgdir" PKG_ROOT_SBIN_DIR="/usr/bin" install install-dev
  chown -R root:root "$pkgdir"

  # add hack as we cannot set rootlibdir
  mv "$pkgdir/lib"/libhandle.so* "$pkgdir/usr/lib"
  rm -rf "$pkgdir/lib"
}
