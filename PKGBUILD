# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

# Thanks to the patch from the MXE project <mxe.cc>

_basever=7.0
_patchlevel=005
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-readline
pkgver=${_basever}.${_patchlevel}
pkgrel=1
pkgdesc="GNU readline library (mingw-w64)"
arch=('any')
url="https://tiswww.case.edu/php/chet/readline/rltop.html"
license=('GPL')
depends=('mingw-w64-crt'
         'mingw-w64-pdcurses')
makedepends=('mingw-w64-configure')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://ftp.gnu.org/gnu/readline/readline-${_basever}.tar.gz"{,.sig}
        "readline-1.patch")
if [ ${_patchlevel} -gt 00 ]; then
    for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
        source=(${source[@]} "https://ftp.gnu.org/gnu/readline/readline-${_basever}-patches/readline${_basever//./}-$(printf "%03d" ${_p})"{,.sig})
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
            'SKIP'
            'f925683429f20973c552bff6702c74c58c2a38ff6e5cf305a8e847119c5a6b64'
            'SKIP'
            'ca159c83706541c6bbe39129a33d63bbd76ac594303f67e4d35678711c51b753'
            'SKIP')
validpgpkeys=(7C0135FB088AAF6C66C650B9BB5869F064EA74AB) # Chet Ramey <chet@cwru.edu>

prepare() {
  cd "${srcdir}/readline-${_basever}"

  for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
    msg "applying patch readline${_basever//./}-$(printf "%03d" ${_p})"
    patch -Np0 -i ${srcdir}/readline${_basever//./}-$(printf "%03d" ${_p})
  done

  msg "applying the patch from MXE project"
  patch -Np1 -i ${srcdir}/readline-1.patch

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
