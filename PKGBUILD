# Maintainer: Pellegrino Prevete <pellegrinoprevete[at]gmail[dot]com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=libplacebo
pkgname="${_pkgname}4.208"
_pkgver=4.208
pkgver="${_pkgver}.0"
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives'
url='https://github.com/haasn/libplacebo'
arch=('x86_64')
license=('LGPL2.1')
depends=('vulkan-icd-loader' 'libvulkan.so' 'glslang' 'lcms2' 'liblcms2.so' 'shaderc' 'libshaderc_shared.so'
         'libepoxy' 'libglvnd' 'glibc' 'gcc-libs')
makedepends=('meson' 'ninja' 'vulkan-headers' 'python' 'python-mako')
provides=('libplacebo.so')
source=(https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/libplacebo-v${pkgver}.tar.gz)
sha512sums=('5d4b9a9d61dcd61c716bf9bbb22b9a0976f5d42069a46993da9b9b5625a6c75c352b353f74ec74f80f91f6bb1acb96dd7809d36e80ad1a8e64aab62d07107ffa')
b2sums=('1ad2b10f007dc26b51621dc54b93f1d9d4dd970b79181dee6a3ce103b5fccf4cabfdbb2b446084c18e5e80b4f22b137d8a05efd5f857513f1fbe3d9b6af4e3bb')

build() {
  cd ${_pkgname}-v${pkgver}
  CXXFLAGS+=" -I/usr/include/glslang"
 
  arch-meson build \
    --libdir="/usr/lib/${_pkgname}-${_pkgver}" \
    --includedir="/usr/include/${_pkgname}-${_pkgver}" \
    -D tests=true \
    -D vulkan=disabled \
    -D glslang=disabled \
    -D shaderc=enabled \
    -D lcms=enabled \
    -D d3d11=disabled
  ninja -C build
}

check() {
  cd ${_pkgname}-v${pkgver}
  ninja -C build test
}

package() {
  cd ${_pkgname}-v${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}-${_pkgver}"
  cd "${pkgdir}/usr"
  mv "bin/plplay" "bin/plplay-${_pkgver}"
}

# vim: ts=2 sw=2 et:
