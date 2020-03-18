# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu
_pkgbase=util-linux
pkgbase=$_target-util-linux
pkgname=($_target-util-linux $_target-libutil-linux)
_pkgmajor=2.35
pkgver=$_pkgmajor.1
pkgrel=1
pkgdesc='Miscellaneous system utilities for Linux (ARM64)'
url='https://www.kernel.org/pub/linux/utils/util-linux/'
arch=(any)
makedepends=($_target-configure)
license=(GPL2)
options=(!buildflags)
source=(
  https://www.kernel.org/pub/linux/utils/util-linux/v$_pkgmajor/$_pkgbase-$pkgver.tar.{xz,sign}
)
sha256sums=(
  'd9de3edd287366cd908e77677514b9387b22bc7b88f45b83e1922c3597f1d7f9'
  'SKIP'
)
validpgpkeys=(
  'B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284' # Karel Zak
)

_srcdir=$_pkgbase-$pkgver

build() {
  cd $_srcdir

  mkdir -p build-$_target && pushd build-$_target
  $_target-configure \
    --enable-fs-paths-default=/usr/$_target/bin \
    --enable-usrdir-path \
    --enable-raw \
    --enable-vipw \
    --enable-newgrp \
    --enable-write \
    --enable-mesg \
    --disable-hardlink

  make
  popd
}

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

package_util-linux() {
  depends=($_target-libutil-linux)

  cd $_srcdir

  pushd build-$_target
  make DESTDIR="$pkgdir" install
  popd

  ### runtime libs are shipped as part of libutil-linux
  rm "$pkgdir"/usr/$_target/lib/lib*.{a,so}*
}

package_libutil-linux() {
  pkgdesc="util-linux runtime libraries (ARM64)"

  cd $_srcdir

  pushd build-$_target
  make DESTDIR="$pkgdir" install-usrlib_execLTLIBRARIES
  popd

}

# define target package functions
for p in "${pkgname[@]}"; do
  eval "package_${p}() { package_${p/${_target}-/} "'"$@"'"; }"
done
