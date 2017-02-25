# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

# Thanks to the patch from the MXE project <mxe.cc>

pkgname=mingw-w64-readline
_basever=7.0
_patchlevel=003
pkgver=$_basever.$_patchlevel
pkgrel=1
pkgdesc="MinGW port of readline for editing typed command lines (mingw-w64)"
arch=('any')
depends=('mingw-w64-crt' 'mingw-w64-pdcurses')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
license=('GPL')
url="https://cnswww.cns.cwru.edu/php/chet/readline/rltop.html"
source=("http://ftp.gnu.org/gnu/readline/readline-${_basever}.tar.gz"{,.sig}
        "readline-1.patch")
if [ $_patchlevel -gt 00 ]; then
    for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
        source=(${source[@]} http://ftp.gnu.org/gnu/readline/readline-$_basever-patches/readline${_basever//./}-$(printf "%03d" $p){,.sig})
    done
fi

md5sums=('205b03a87fc83dab653b628c59b9fc91'
         'SKIP'
         'e1564909905d0670fca91da3dc4053f7'
         'e299384458a4cbefaaac3f30e9cc2bba'
         'SKIP'
         'f9071a353e2fd52a91d32667b23715d6'
         'SKIP'
         '03595464cf0283286a6e07f4f01c4a70'
         'SKIP')
validpgpkeys=(7C0135FB088AAF6C66C650B9BB5869F064EA74AB)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/readline-${_basever}"

  for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
    msg "applying patch readline${_basever//./}-$(printf "%03d" $p)"
    patch -Np0 -i $srcdir/readline${_basever//./}-$(printf "%03d" $p)
  done

  msg "applying the patch from MXE project"
  patch -Np1 -i $srcdir/readline-1.patch

  # Remove RPATH from shared objects (FS#14366)
  sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf
}

build() {
  cd "${srcdir}/readline-${_basever}"

  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    bash_cv_wcwidth_broken=no ${_arch}-configure \
      --target=${_arch} \
      --enable-multibyte \
      --without-purify \
      --with-curses
    make SHLIB_LIBS="-lpdcurses"
    popd
  done
}

package() {
  for _arch in ${_architectures} ; do
    cd "${srcdir}/readline-${_basever}/build-${_arch}"
    make install DESTDIR="${pkgdir}" SHLIB_LIBS="-lpdcurses"
    rm -r "${pkgdir}"/usr/${_arch}/share/
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-debug "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2 et:
