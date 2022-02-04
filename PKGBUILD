# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=mingw-w64-libplacebo
pkgver=4.192.1
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives (mingw-w64)'
url='https://github.com/haasn/libplacebo'
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('mingw-w64-crt' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-glslang' 'mingw-w64-lcms2' 'mingw-w64-shaderc' 'mingw-w64-libepoxy' 'mingw-w64-spirv-cross')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'mingw-w64-wine' 'ninja' 'mingw-w64-vulkan-headers')
#provides=('libplacebo.so')
source=(https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz)
sha512sums=('780dff60a31a9c7fff47522385235077cc6b1a38be32bc0276c090d89ce25754dd0b910db5be631d0065337fe4700f68adabee06f48a4935d422f09f2e0e5525')
b2sums=('19a3bee6f05632cde1739fe8c861c96035a7b1f5ed2af6bbc67776529551c88f5da63d49dede2d7ee2c8d96edd6faf733e0371714028b72eddcf4c4cf23b937f')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  export NEED_WINE=1
  export WINEDEBUG=-all

  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/libplacebo-v${pkgver}/build-${_arch}" && cd "${srcdir}/libplacebo-v${pkgver}/build-${_arch}"
    ${_arch}-meson .. --default-library both \
      -D tests=false \
      -D vulkan=enabled \
      -D glslang=enabled \
      -D shaderc=enabled \
      -D lcms=enabled \
      -D d3d11=enabled \
      -D vulkan-registry="/usr/${_arch}/share/vulkan/registry/vk.xml"

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
