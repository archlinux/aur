# Contributor: luigoalma <at gmail>
# Contributor: PedroHLC <root@pedrohlc.com>
# Contributor: J. Peter Mugaas <jpmugaas@suddenlink.net>
# Contributor: wirx6 <wirx654@gmail.com>
# based of https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/vulkan-headers @ be8e4b4

pkgname=mingw-w64-vulkan-headers
_pkgname=Vulkan-Headers
pkgver=1.1.99
pkgrel=1
pkgdesc="Vulkan header files (mingw-w64)"
arch=(any)
url="https://www.khronos.org/vulkan/"
license=('APACHE')
makedepends=(mingw-w64-cmake)
provides=("mingw-w64-vulkan-hpp=${pkgver}")
groups=("mingw-w64-vulkan-devel")
options=(!buildflags staticlibs !strip !emptydirs)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ff4880bf75d9fb0edadc6abb68b4a29f95db73120af8fd9b0426c2caf4de002e1a479e72bc1630a5a81e916e7f1b2e2b21ad8bd366f0b1b62b322f216c2eb04f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  for _arch in ${_architectures}; do
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      ..
    make
    popd
  done
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make DESTDIR="${pkgdir}" install
    popd
    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/${_arch}/share/licenses/vulkan-headers/LICENSE"
  done
}
