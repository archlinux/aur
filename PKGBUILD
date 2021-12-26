# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=mingw-w64-libplacebo
pkgver=4.157.0
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
sha512sums=('efa909fe8e6f053322bdda64834038218ee313e7df7f6f03d049b38318f1627543b60d4902f968c67dd00ece4db0c8d2eb20e3dc7a43dd05a16700723cba1d5f')
b2sums=('32b348bee195e95f503cea3cc26a7de18e8c40ea793c70649a6d1dea157ab233c2422cdf8d84b8449bce4594e4457a30753f51b1c38a76b3199769616ffa65c5')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    # avoid multiple definitions error
    sed -i -e "71ilink_args += ['-Wl,--allow-multiple-definition']" "$srcdir/libplacebo-v${pkgver}/meson.build"
}

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
