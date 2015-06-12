# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

# Thanks to the patch from the MXE project <mxe.cc>

pkgname=mingw-w64-readline
_basever=6.3
_patchlevel=008
pkgver=$_basever.$_patchlevel
pkgrel=2
pkgdesc="MinGW port of readline for editing typed command lines (mingw-w64)"
arch=('any')
depends=('mingw-w64-crt' 'mingw-w64-pdcurses')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
license=('GPL')
url="http://cnswww.cns.cwru.edu/php/chet/readline/rltop.html"
source=("http://ftp.gnu.org/gnu/readline/readline-${_basever}.tar.gz"{,.sig}
        "readline-1.patch")
if [ $_patchlevel -gt 00 ]; then
    for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
        source=(${source[@]} http://ftp.gnu.org/gnu/readline/readline-$_basever-patches/readline${_basever//./}-$(printf "%03d" $p){,.sig})
    done
fi

md5sums=('33c8fb279e981274f485fd91da77e94a'
         'SKIP'
         '5e131046492793cf36ff6bf5ab61fbd7'
         '4343f5ea9b0f42447f102fb61576b398'
         'SKIP'
         '700295212f7e2978577feaee584afddb'
         'SKIP'
         'af4963862f5156fbf9111c2c6fa86ed7'
         'SKIP'
         '11f9def89803a5052db3ba72394ce14f'
         'SKIP'
         '93721c31cd225393f80cb3aadb165544'
         'SKIP'
         '71dc6ecce66d1489b96595f55d142a52'
         'SKIP'
         '062a08ed60679d3c4878710b3d595b65'
         'SKIP'
         'ee1c04072154826870848d8b218d7b04'
         'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/readline-${_basever}"

  for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
    msg "applying patch readline${_basever//./}-$(printf "%03d" $p)"
    patch -Np0 -i $srcdir/readline${_basever//./}-$(printf "%03d" $p)
  done

  msg "applying the patch from MXE project"
  patch -Nfp1 -i $srcdir/readline-1.patch

  # Remove RPATH from shared objects (FS#14366)
  sed 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf

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
