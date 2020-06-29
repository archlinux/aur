# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=mingw-w64-libplacebo
pkgver=1.29.1
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives (mingw-w64)'
url='https://github.com/haasn/libplacebo'
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('mingw-w64-crt' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-glslang' 'mingw-w64-lcms2' 'mingw-w64-shaderc')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'mingw-w64-wine' 'ninja' 'mingw-w64-vulkan-headers')
#provides=('libplacebo.so')
source=(https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz
        libplacebo-vulkan-headers-1.2.140-compatibility.patch)
sha512sums=('9f09560832a88e670d6c31e9f5b9cbc03de437bfb19ceb0985140307b5cdf20e2050a1dab5d07f18258dfa3e5429a51f1d3d54532099be4bfc6a0dafe3ffd516'
            'f084ad43647f5d44537c8532788e8bd85a8376eca23a4896d7703bba43f425e2e018305c5344bd6b97097fc359ea7a2da9b32a6fdf70a41a8f6253ec94561053')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/libplacebo-v${pkgver}

  patch -Np1 -i "${srcdir}/libplacebo-vulkan-headers-1.2.140-compatibility.patch"
}

build() {
  export NEED_WINE=1
  export WINEDEBUG=-all

  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/libplacebo-v${pkgver}/build-${_arch}" && cd "${srcdir}/libplacebo-v${pkgver}/build-${_arch}"
    ${_arch}-meson .. --default-library both \
      -D tests=true \
      -D vulkan=enabled \
      -D glslang=enabled \
      -D shaderc=enabled \
      -D lcms=enabled
    
    ninja
  done
}

#FIXME Vulkan test fails with:
#Unhandled exception: unimplemented function vulkan-1.dll.vkEnumerateInstanceExtensionProperties@12 called in 32-bit code (0x7bc74281).
#check() {
#  for _arch in ${_architectures}; do
#    cd "${srcdir}/libplacebo-v${pkgver}/build-${_arch}"
#
#    export WINEDEBUG=-all
#    meson test
#  done
#}


package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libplacebo-v${pkgver}/build-${_arch}"

    DESTDIR="${pkgdir}" ninja install
  done

  cd "${srcdir}/libplacebo-v${pkgver}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
