# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=mingw-w64-libplacebo
pkgver=7.349.0
pkgrel=2
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives (mingw-w64)'
url='https://github.com/haasn/libplacebo'
arch=('any')
license=('LGPL-2.1-or-later')
depends=('mingw-w64-crt' 'mingw-w64-libdovi' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-glslang' 'mingw-w64-lcms2' 'mingw-w64-shaderc' 'mingw-w64-spirv-cross')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'mingw-w64-wine' 'ninja' 'mingw-w64-vulkan-headers'
             'glad' 'nuklear' 'python' 'python-setuptools' 'python-mako' 'python-markupsafe' 'python-jinja')
#provides=('libplacebo.so')
source=(https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz
        skip-vulkan-test.patch)
sha512sums=('94fb0ad4f6cdafc81a43f06a73e49ef8ed7f81e751ad2a028f6f91295a06d8c12f2959e2595bd654db946fc5aa89758ab9d37f985ebb82badbd517ed02f3ddca'
            '9828cf93bdc0502a2ace4d143058bfb85244573118a008ed3c768e13f2ac35a586e46668032656e7488a51416500515b1f0c0ae339cb93cc8ab8825bb74b835a')
b2sums=('4a1a667e608e559f2ac163d25183ce9cd2a3ddfa05d88219e5597db08478c883f12efb2e66fe54d9aab65f2863efbe60f0448e241a69109ea423af8222008493'
        '71e770824e4898b730b577f376c75dd29c6ef371fe8a388df5717fe539f19345bc77aff30e0bdaea8800785f553df36628b7b74b3da9a83d22d83e78fdfc8ac9')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libplacebo-v${pkgver}"

  # skip vulkan test as it fails with
  #   Unhandled exception: unimplemented function vulkan-1.dll.vkGetInstanceProcAddr@8 called in 32-bit code (0x7bd5bb78).
  patch -Np1 -i "${srcdir}"/skip-vulkan-test.patch
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
      -D lcms=enabled \
      -D d3d11=enabled \
      -D libdovi=enabled \
      -D vulkan-registry="/usr/${_arch}/share/vulkan/registry/vk.xml" \
      -D demos=false

    ninja
  done
}

check() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libplacebo-v${pkgver}/build-${_arch}"

    export WINEDEBUG=-all
    meson test
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libplacebo-v${pkgver}/build-${_arch}"

    DESTDIR="${pkgdir}" ninja install

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done

  #cd "${srcdir}/libplacebo-v${pkgver}"
  #install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
