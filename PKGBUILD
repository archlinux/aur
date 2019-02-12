# Contributor: luigoalma <at gmail>
# Contributor: PedroHLC <root@pedrohlc.com>
# Contributor: J. Peter Mugaas <jpmugaas@suddenlink.net>
# Contributor: wirx6 <wirx654@gmail.com>
# based of https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/vulkan-headers @ be8e4b4

pkgname=mingw-w64-vulkan-headers
_pkgname=Vulkan-Headers
pkgver=1.1.97
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
sha512sums=('c5bc949c8185a9396a79bb4dab1ae8f9b17805e123504d320d953d9b087ead5b43d7f4340325c7acab7d731c421978e9e44b41a991576803bdfa3150cecfbab9')

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
