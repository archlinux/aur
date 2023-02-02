# Maintainer: Joshua Ashton <joshua@froggi.es>

# This package provides a minimal instance of RenderDoc, even more
# minimal than renderdoc-minimal on SteamOS (no renderdoccmd) that
# simply provides capturing facilities for 32-bit.
#
# If you need replay, you'll need either renderdoc or renderdoc-minimal
# to host a replay server
#
# If you need a GUI, grab that from renderdoc, as it provides qrenderdoc.

pkgname=lib32-renderdoc-minimal
pkgver=1.25
pkgrel=1
pkgdesc="OpenGL and Vulkan debugging tool (minimal, capture-only, 32-bit)"
arch=(x86_64)
url="https://github.com/baldurk/renderdoc"
license=("MIT")
makedepends=("cmake" "python")
depends=("lib32-libx11" "lib32-libxcb" "lib32-mesa" "lib32-libgl" "lib32-xcb-util-keysyms")
provides=("lib32-renderdoc")
conflicts=("lib32-renderdoc")
source=("https://github.com/baldurk/renderdoc/archive/v${pkgver}.tar.gz"
        "https://github.com/baldurk/renderdoc/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc")
validpgpkeys=('1B039DB9A4718A2D699DE031AC612C3120C34695')
sha384sums=('f70eae948685b26c45c55313d0bad6d0edd5b1e61a1f4dba35d546f320777977deb2eb9ba1b002c40a0c504ab4e0a769'
            'SKIP')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib32 \
        -DLIB_SUFFIX=32 \
        -DVULKAN_JSON_SUFFIX=".32" \
        -DENABLE_RENDERDOCCMD=OFF \
        -DENABLE_QRENDERDOC=OFF \
        -DENABLE_PYRENDERDOC=OFF \
        -DBUILD_VERSION_STABLE=ON \
        -DBUILD_VERSION_DIST_CONTACT="joshua@froggi.es" \
        -DBUILD_VERSION_DIST_NAME="Arch" \
        -DBUILD_VERSION_DIST_VER="${pkgver}" \
        -B"${srcdir}/renderdoc-${pkgver}"/build \
        -H"${srcdir}/renderdoc-${pkgver}"
  cmake --build "${srcdir}/renderdoc-${pkgver}"/build
}

package() {
  make DESTDIR="${pkgdir}" -C "${srcdir}/renderdoc-${pkgver}"/build install
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/renderdoc-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Remove these or they conflict with the base renderdoc package.
  rm -r "${pkgdir}/usr/share/doc"
  rm -r "${pkgdir}/usr/include"
}

# vim:set ts=2 sw=2 et:
