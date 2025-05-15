pkgname=vpinball-bgfx.cmake
_pkgname=bgfx.cmake
pkgver=r8879.384e514
pkgrel=1
pkgdesc="Fork of bgfx with patches for vpinball (DO NOT INSTALL IF YOU DO NOT NEED IT)"
arch=('x86_64')
url="https://github.com/bkaradzic/bgfx.cmake"
license=('BSD-2-Clause')
conflicts=('bgfx' 'bgfx-git')
depends=('gcc-libs' 'glibc' 'libx11' 'mesa')
makedepends=('git' 'cmake')
provides=('bgfx' 'vpinball-bgfx.cmake')
source=('https://github.com/bkaradzic/bgfx.cmake/releases/download/v1.129.8866-492/bgfx.cmake.v1.129.8866-492.tar.gz'
	'git+https://github.com/vbousquet/bgfx.git')
sha256sums=('3fd915643b1405f824c3aef4a747731189a0eada51bcecf438f3572a703537c9' 'SKIP')

pkgver() {
    cd "${srcdir}/bgfx"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}  # pkgver

build() {
  cd "${srcdir}/${_pkgname}"
  [ -d "${srcdir}/${_pkgname}/bgfx" ] && rm -r "${srcdir}/${_pkgname}/bgfx"
  mv "${srcdir}/bgfx" "${srcdir}/${_pkgname}/bgfx" 
  #
  cmake -S. \
    -DBGFX_LIBRARY_TYPE=SHARED \
    -DBGFX_BUILD_TOOLS=OFF \
    -DBGFX_BUILD_EXAMPLES=OFF \
    -DBGFX_CONFIG_MULTITHREADED=ON \
    -DBGFX_CONFIG_MAX_FRAME_BUFFERS=256 \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -B build
  cmake --build build
}  # build

package() {
  cd "${srcdir}/${_pkgname}/build"
  mkdir -p "${pkgdir}/usr/bin"
  DESTDIR="${pkgdir}" make install
  rmdir "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}  # package
