# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=mingw-w64-libplacebo
pkgver=6.338.1
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives (mingw-w64)'
url='https://github.com/haasn/libplacebo'
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('mingw-w64-crt' 'mingw-w64-libdovi' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-glslang' 'mingw-w64-lcms2' 'mingw-w64-shaderc' 'mingw-w64-spirv-cross')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'mingw-w64-wine' 'ninja' 'mingw-w64-vulkan-headers'
             'glad' 'nuklear' 'python' 'python-setuptools' 'python-mako' 'python-markupsafe' 'python-jinja')
#provides=('libplacebo.so')
source=(https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz
        skip-vulkan-test.patch)
sha512sums=('a538a26552bda77af98264abde0e721c967f0c5eba73c0ffdff3cc7f52a4505ee5b618b99884becf502546261ff6e48881900ce7c782c5495ee3a6728dca9eb1'
            '9828cf93bdc0502a2ace4d143058bfb85244573118a008ed3c768e13f2ac35a586e46668032656e7488a51416500515b1f0c0ae339cb93cc8ab8825bb74b835a')
b2sums=('4f8df9c6f052eeb3b23cf9d22814cf6b244197d6b9c3ec529c89be3411d22b7d29ff0c9ee14af7a86f830ecfba7b1be308251dca96824f1a1eb74c3a0a3f84b3'
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
