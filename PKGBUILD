pkgname=mingw-w64-c-ares
pkgver=1.14.0
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
sha256sums=('62dd12f0557918f89ad6f5b759f0bf4727174ae9979499f5452c02be38d9d3e8'
            'f00faa8723fd530b027f96b987ef19138628a49afdf52ffb0554b36156fc9d74'
            'dc785a9786172ca64aea3c90b3b491089bf952dae1317be0d757f2dcc5645996'
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
