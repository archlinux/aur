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
url="https://tiswww.case.edu/php/chet/readline/rltop.html"
source=("https://ftp.gnu.org/gnu/readline/readline-${_basever}.tar.gz"{,.sig}
        "readline-1.patch")
if [ $_patchlevel -gt 00 ]; then
    for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
        source=(${source[@]} https://ftp.gnu.org/gnu/readline/readline-$_basever-patches/readline${_basever//./}-$(printf "%03d" $p){,.sig})
    done
fi

sha256sums=('750d437185286f40a369e1e4f4764eda932b9459b5ec9a731628393dd3d32334'
            'SKIP'
            'c0005ee37f2cddf36692a533753653de8786f9da4df4225520550a565b197c05'
            '9ac1b3ac2ec7b1bf0709af047f2d7d2a34ccde353684e57c6b47ebca77d7a376'
            'SKIP'
            '8747c92c35d5db32eae99af66f17b384abaca961653e185677f9c9a571ed2d58'
            'SKIP'
            '9e43aa93378c7e9f7001d8174b1beb948deefa6799b6f581673f465b7d9d4780'
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
