# Maintainer : Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Daniel Micay <danielmicay at gmail dot com>

pkgname=mingw-w64-portaudio
_pkgname=portaudio
pkgver=19.7.0
pkgrel=1
epoch=1
pkgdesc="A free, cross-platform, open source, audio I/O library. (mingw-w64)"
arch=('any')
url="https://github.com/portaudio/portaudio"
license=("custom")
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!libtool' '!strip' '!buildflags' '!makeflags' 'staticlibs')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	fix-cxx-build.patch)
#        "wdmks-wasapi-dsound.patch.tar.gz"
#        "fix-memmove-chk-error.patch")
sha512sums=('7e347a174109b661a685bcd617cc8fe00929c6fbf28f142fd7709a8ddbb9b5ed6e805be6647a44b4b9441b79e3474561de6f8e351b4ffc024952ed3e0e27ac1c'
            '8df1c70ac030c06e6e3a4048af70be054a70883a7e3ff2f0f186a15f30a8f47944233ad539a85e8183751843f791a2738023905d830bbcf64c678cf710f8a9e0')
b2sums=('db16882e97e60ab47b37c6d8851aa29e16e321531f3890f70390d89364aee2c1a9b42be09e7534f38d1c9ca48dd466b512874731049e42759a674571d6054220'
        'e431f030ba5e9bbdab898e73ece7203d397b47d2522f580d1d6620ba0f4b43e5be709352ef0f33027064416690da19f45ab599316516f969519d9c741a519d58')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${_pkgname}-${pkgver}"
  
  #patch -p0 -i ${srcdir}/wdmks-wasapi-dsound.patch
  #patch -Np1 -i ${srcdir}/fix-memmove-chk-error.patch
  patch -Np1 -i ${srcdir}/fix-cxx-build.patch

  (
    cd bindings/cpp
    autoreconf -fiv
  )

  autoreconf -fiv
}

build() {
  export lt_cv_deplibs_check_method='pass_all'
  
  cd ${srcdir}/"${_pkgname}-${pkgver}"
  
  for _arch in ${_architectures}; do
    # static
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    DLL_LIBS+=" -lssp" ${_arch}-configure \
      --enable-static \
      --disable-shared \
      --enable-cxx \
      --with-dxdir=/usr/${_arch} \
      --with-winapi=wmme,directx,wasapi,wdmks \
      ..
    make
    popd
    
    # shared
    mkdir -p build-${_arch}-shared && pushd build-${_arch}-shared
    DLL_LIBS+=" -lssp" ${_arch}-configure \
      --disable-static \
      --enable-shared \
      --enable-cxx \
      --with-dxdir=/usr/${_arch} \
      --with-winapi=wmme,directx,wasapi,wdmks \
      ..
    make
    popd
  done
}

package() {
  cd ${srcdir}/"${_pkgname}-${pkgver}"

  for _arch in ${_architectures}; do
    # static
    pushd "build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    popd
    # shared
    pushd "build-${_arch}-shared"
    make DESTDIR="${pkgdir}" install
    popd
    
    # move DLL to bin directory
    mkdir -p "$pkgdir"/usr/${_arch}/bin
    find "$pkgdir"/usr/${_arch}/lib -iname '*.dll' -exec mv --target-directory="$pkgdir"/usr/${_arch}/bin {} \;
    
    # strip executables and libraries
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
