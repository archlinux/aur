# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Filip Brcic < brcha at gna dot org >

# Thanks to the patch from the MXE project <mxe.cc>

_basever=8.0
_patchlevel=004
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-readline
pkgver=${_basever}.${_patchlevel}
pkgrel=2
pkgdesc="GNU readline library (mingw-w64)"
arch=('any')
url="https://tiswww.case.edu/php/chet/readline/rltop.html"
license=('GPL')
depends=('mingw-w64-crt'
         'mingw-w64-pdcurses'
         'mingw-w64-termcap')
makedepends=('mingw-w64-configure')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://ftp.gnu.org/gnu/readline/readline-${_basever}.tar.gz"{,.sig})
if [ ${_patchlevel} -gt 00 ]; then
    for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
        source=(${source[@]} "https://ftp.gnu.org/gnu/readline/readline-${_basever}-patches/readline${_basever//./}-$(printf "%03d" ${_p})"{,.sig})
    done
fi

sha256sums=('e339f51971478d369f8a053a330a190781acb9864cf4c541060f12078948e461'
            'SKIP'
            'd8e5e98933cf5756f862243c0601cb69d3667bb33f2c7b751fe4e40b2c3fd069'
            'SKIP'
            '36b0febff1e560091ae7476026921f31b6d1dd4c918dcb7b741aa2dad1aec8f7'
            'SKIP'
            '94ddb2210b71eb5389c7756865d60e343666dfb722c85892f8226b26bb3eeaef'
            'SKIP'
            'b1aa3d2a40eee2dea9708229740742e649c32bb8db13535ea78f8ac15377394c'
            'SKIP')
validpgpkeys=(7C0135FB088AAF6C66C650B9BB5869F064EA74AB) # Chet Ramey <chet@cwru.edu>

prepare() {
  cd "${srcdir}/readline-${_basever}"

  for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
    msg "applying patch readline${_basever//./}-$(printf "%03d" ${_p})"
    patch -Np0 -i ${srcdir}/readline${_basever//./}-$(printf "%03d" ${_p})
  done

  # Remove RPATH from shared objects (FS#14366)
  sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf
}

build() {
  cd "${srcdir}/readline-${_basever}"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    bash_cv_wcwidth_broken=no ${_arch}-configure \
      --target=${_arch} \
      --enable-multibyte \
      --without-purify \
      --with-curses
    make SHLIB_LIBS="-lpdcurses -ltermcap"
    popd
  done
}

package() {
  for _arch in ${_architectures} ; do
    cd "${srcdir}/readline-${_basever}/build-${_arch}"
    make install DESTDIR="${pkgdir}" SHLIB_LIBS="-lpdcurses -ltermcap"
    rm -r "${pkgdir}"/usr/${_arch}/share/
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-debug "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2 et:
