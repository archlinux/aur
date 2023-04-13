# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xfsprogs-git
pkgver=6.2.0.r0.ga61d6360
pkgrel=1
pkgdesc="Utilities for managing the XFS filesystem"
arch=('i686' 'x86_64')
url="https://xfs.org"
license=('GPL2' 'LGPL')
depends=('glibc' 'device-mapper' 'icu' 'libinih' 'liburcu' 'libutil-linux' 'readline' 'sh')
makedepends=('git')
optdepends=('python: for xfs_scrub_all script'
            'smtp-forwarder: for xfs_scrub_fail script')
provides=("xfsprogs=$pkgver")
conflicts=('xfsprogs')
options=('staticlibs')
source=("git+https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git#branch=for-next")
sha256sums=('SKIP')


pkgver() {
  cd "xfsprogs-dev"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
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

  make \
    DIST_ROOT="$pkgdir" \
    PKG_ROOT_SBIN_DIR="/usr/bin" \
    install \
    install-dev
  chown -R root:root "$pkgdir"

  # add hack as we cannot set rootlibdir
  mv "$pkgdir/lib"/libhandle.so* "$pkgdir/usr/lib"
  rm -rf "$pkgdir/lib"
}
