# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=readline
pkgname=$_target-$_pkgname
_basever=8.0
_patchlevel=004
pkgver=$_basever.$_patchlevel
pkgrel=1
pkgdesc='GNU readline library'
arch=(x86_64)
url='https://tiswww.case.edu/php/chet/readline/rltop.html'
license=(GPL)
depends=($_target-glibc $_target-ncurses)
makedepends=($_target-configure)
options=(!buildflags)
source=(
  https://ftp.gnu.org/gnu/readline/readline-$_basever.tar.gz{,.sig}
)

if [ ${_patchlevel} -gt 00 ]; then
  for ((_p = 1; _p <= $((10#${_patchlevel})); _p++)); do
    source+=("readline${_basever}-${_p}.patch::https://ftp.gnu.org/gnu/readline/readline-${_basever}-patches/readline${_basever//./}-$(printf "%03d" ${_p})"{,.sig})
  done
fi

sha256sums=(
  'e339f51971478d369f8a053a330a190781acb9864cf4c541060f12078948e461'
  'SKIP'
  'd8e5e98933cf5756f862243c0601cb69d3667bb33f2c7b751fe4e40b2c3fd069'
  'SKIP'
  '36b0febff1e560091ae7476026921f31b6d1dd4c918dcb7b741aa2dad1aec8f7'
  'SKIP'
  '94ddb2210b71eb5389c7756865d60e343666dfb722c85892f8226b26bb3eeaef'
  'SKIP'
  'b1aa3d2a40eee2dea9708229740742e649c32bb8db13535ea78f8ac15377394c'
  'SKIP'
)
validpgpkeys=(
  7C0135FB088AAF6C66C650B9BB5869F064EA74AB # Chet Ramey <chet@cwru.edu>
)

_srcdir=$_pkgname-$_basever

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

prepare() {
  cd $_srcdir

  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -Np0 -s -i "$patch"
  done

  # Remove RPATH from shared objects (FS#14366)
  sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf
}

build() {
  cd $_srcdir

  mkdir -p build-$_target && pushd build-$_target
  $_target-configure
  make SHLIB_LIBS=-lncurses
  popd
}

package() {
  cd $_srcdir

  pushd build-$_target
  make DESTDIR="$pkgdir" install
  popd
}
