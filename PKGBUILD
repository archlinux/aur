# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Filip Brcic < brcha at gna dot org >

# Thanks to the patch from the MXE project <mxe.cc>

_basever=8.2
_patchlevel=001
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-readline
pkgver=${_basever}.${_patchlevel}
pkgrel=1
pkgdesc="GNU readline library (mingw-w64)"
arch=('any')
url="https://tiswww.case.edu/php/chet/readline/rltop.html"
license=('GPL')
depends=('mingw-w64-crt'
         'mingw-w64-pdcurses'
         'mingw-w64-termcap')
makedepends=('mingw-w64-configure')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://ftp.gnu.org/gnu/readline/readline-${_basever}.tar.gz"{,.sig}
  readline-1-fixes.patch)
if [ ${_patchlevel} -gt 00 ]; then
    for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
        source=(${source[@]} "https://ftp.gnu.org/gnu/readline/readline-${_basever}-patches/readline${_basever//./}-$(printf "%03d" ${_p})"{,.sig})
    done
fi

sha256sums=('3feb7171f16a84ee82ca18a36d7b9be109a52c04f492a053331d7d1095007c35'
            'SKIP'
            '7e1fea150da3b4c446a3d8b8ce3f449ded5f44e0856b3c9c43d33766f9634f7e'
            'bbf97f1ec40a929edab5aa81998c1e2ef435436c597754916e6a5868f273aff7'
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

  patch -Np1 -i ../readline-1-fixes.patch
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
