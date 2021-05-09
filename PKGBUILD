# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=mingw-w64-libplacebo
pkgver=3.120.3
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives (mingw-w64)'
url='https://github.com/haasn/libplacebo'
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('mingw-w64-crt' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-glslang' 'mingw-w64-lcms2' 'mingw-w64-shaderc' 'mingw-w64-libepoxy')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'mingw-w64-wine' 'ninja' 'mingw-w64-vulkan-headers')
#provides=('libplacebo.so')
source=(https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz)
sha512sums=('6a2d3c6c053edc3a912a46f9c16d226d83c6f8880714f0b20a8b9417889616e4c1d4d41b8935b898cc580dc3b480ce974bb3921162165f0774ea91be1dfff520')
b2sums=('6192570dba8de6e0bb98ccf3f0e4f13c01a27c5f97873ff0e5e3212d9b7cdebd98cce3d5ee5364ca8a585ec2a16d0bafc5a863ed35f6f225d86a4410b92edfd3')
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
