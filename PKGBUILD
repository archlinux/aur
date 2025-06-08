# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=mingw-w64-libplacebo
pkgver=7.351.0
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives (mingw-w64)'
url='https://github.com/haasn/libplacebo'
arch=('any')
license=('LGPL-2.1-or-later')
depends=('mingw-w64-crt' 'mingw-w64-libdovi' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-glslang' 'mingw-w64-lcms2' 'mingw-w64-shaderc' 'mingw-w64-spirv-cross')
options=(!strip !buildflags staticlibs !debug)
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'mingw-w64-wine' 'ninja' 'mingw-w64-vulkan-headers'
             'glad' 'nuklear' 'python' 'python-setuptools' 'python-mako' 'python-markupsafe' 'python-jinja')
#provides=('libplacebo.so')
source=(https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz
        skip-vulkan-test.patch)
sha512sums=('325e14b783aafdd0120abc6125d3949d60e2336fba3cd8d9aefececf93005a8333e5e6c53d6e54bb4c19e4a29981c9014f303fb48b5b89383ca948f64e7e6449'
            '9828cf93bdc0502a2ace4d143058bfb85244573118a008ed3c768e13f2ac35a586e46668032656e7488a51416500515b1f0c0ae339cb93cc8ab8825bb74b835a')
b2sums=('631b292b789b44e51a1b7352f07c6eb8010c372e3562af49b670b7bac3f41b1a1b0100bd6b15988626831ecfad5bc328cbca1fccae45cb053172417f29673a00'
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
