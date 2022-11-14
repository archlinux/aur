# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=mingw-w64-libplacebo
pkgver=5.229.1
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives (mingw-w64)'
url='https://github.com/haasn/libplacebo'
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('mingw-w64-crt' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-glslang' 'mingw-w64-lcms2' 'mingw-w64-shaderc' 'mingw-w64-spirv-cross')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'mingw-w64-wine' 'ninja' 'mingw-w64-vulkan-headers'
             'glad' 'nuklear' 'python' 'python-mako' 'python-markupsafe' 'python-jinja')
#provides=('libplacebo.so')
source=(https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz)
sha512sums=('45efb252d5d44e5429790f9024b1b2a153051d6d604b07fcf3e4de7d49a2e91d20457be76e08b3b9ab43248c4a2e7268c9f8dc69837783e572f9b8735c955334')
b2sums=('0a59e16b4565b10b222c5a5a8e607670bd4010a2be9b99ebdc15638827fcaf21bbf3c16a3cd2b902bcef43041dec56441494a0f618094e14db8f99a9d314c621')
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
      -D vulkan-registry="/usr/${_arch}/share/vulkan/registry/vk.xml" \
      -D demos=false

    ninja
  done
}

#FIXME d3d11 test fails with:
#Unhandled exception: page fault on read access to 0x00000000 in 32-bit code
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
