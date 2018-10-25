# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-c-ares
pkgver=1.15.0
pkgrel=1
pkgdesc="C library that performs DNS requests and name resolves asynchronously (mingw-w64)"
arch=('any')
url="https://c-ares.haxx.se/"
license=('custom')
makedepends=('mingw-w64-configure' 'mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/c-ares/c-ares/archive/cares-${pkgver//./_}.tar.gz"
        "0001-Use-RPM-compiler-options.patch"
        "0002-Add-static-pkg-config.patch"
        "0003-fix-cmake-targets.patch")
sha256sums=('7deb7872cbd876c29036d5f37e30c4cbc3cc068d59d8b749ef85bb0736649f04'
            'f00faa8723fd530b027f96b987ef19138628a49afdf52ffb0554b36156fc9d74'
            'f181a2556cf28a0cbc948cd58a7bcf0c3c3cef01370d0f0fa6b3915f62d05d56'
            '5810001abdd4acb8ae725dedb4d67874c3e2935775ecba30469a2a79c76fd6a0')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

# Helper macros to help make tasks easier #
apply_patch_with_msg() {
  for _patch in "$@"
  do
    msg2 "Applying $_patch"
    patch -Nbp1 -i "${srcdir}/$_patch"
  done
}

del_file_exists() {
  for _fname in "$@"
  do
    if [ -f $_fname ]; then
      rm -rf $_fname
    fi
  done
}
# =========================================== #

prepare() {
  cd "${srcdir}/c-ares-cares-${pkgver//./_}"
  del_file_exists libcares-static.pc.in
  apply_patch_with_msg 0001-Use-RPM-compiler-options.patch \
    0002-Add-static-pkg-config.patch \
    0003-fix-cmake-targets.patch

  autoreconf -fi
}

build() {
  cd "${srcdir}/c-ares-cares-${pkgver//./_}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    ${_arch}-cmake -DCARES_STATIC=ON -DCARES_SHARED=ON ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/c-ares-cares-${pkgver//./_}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    
    cp ${srcdir}/c-ares-cares-${pkgver//./_}/nameser.h ${pkgdir}/usr/${_arch}/include
    
    # provide pkgconfig files
    sed -i -e "s|Version: -|Version: ${pkgver}|g" libcares.pc libcares-static.pc
    install -Dm644 libcares.pc ${pkgdir}/usr/${_arch}/lib/pkgconfig/libcares.pc
    install -Dm644 libcares-static.pc ${pkgdir}/usr/${_arch}/lib/pkgconfig/libcares-static.pc
    
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
