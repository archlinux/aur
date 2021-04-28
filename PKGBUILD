# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=mingw-w64-libplacebo
pkgver=3.120.2
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives (mingw-w64)'
url='https://github.com/haasn/libplacebo'
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('mingw-w64-crt' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-glslang' 'mingw-w64-lcms2' 'mingw-w64-shaderc' 'mingw-w64-libepoxy')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'mingw-w64-wine' 'ninja' 'mingw-w64-vulkan-headers')
#provides=('libplacebo.so')
source=(https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz)
sha512sums=('68b3fd30ee082385d47e75aae10962f3d63ff9298db442ea6939328f057bf2eb387844e35a90c3c2c30f65afc8fd85366b379aefdf38e98c1338b5b35db49ce3')
b2sums=('7a125f94ddaf058830457adb9ad480e86bb7b9b91480ef3f967bd46f09a1037c8be86bfced17f0642b271918fa6339f7c8791feb4f762eea7a563928be40402c')
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
