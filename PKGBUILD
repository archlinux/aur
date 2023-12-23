# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Filip Brcic < brcha at gna dot org >

# Thanks to the patch from the MXE project <mxe.cc>

_basever=8.2
_patchlevel=007
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
            '3b5576e51471b248f5c89e0d4c01ac0bc443a239169fa19e25980f9a923f659a'
            'bbf97f1ec40a929edab5aa81998c1e2ef435436c597754916e6a5868f273aff7'
            'SKIP'
            'e06503822c62f7bc0d9f387d4c78c09e0ce56e53872011363c74786c7cd4c053'
            'SKIP'
            '24f587ba46b46ed2b1868ccaf9947504feba154bb8faabd4adaea63ef7e6acb0'
            'SKIP'
            '79572eeaeb82afdc6869d7ad4cba9d4f519b1218070e17fa90bbecd49bd525ac'
            'SKIP'
            '622ba387dae5c185afb4b9b20634804e5f6c1c6e5e87ebee7c35a8f065114c99'
            'SKIP'
            'c7b45ff8c0d24d81482e6e0677e81563d13c74241f7b86c4de00d239bc81f5a1'
            'SKIP'
            '5911a5b980d7900aabdbee483f86dab7056851e6400efb002776a0a4a1bab6f6'
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
