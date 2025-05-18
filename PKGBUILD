# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="qt"
pkgver=2.3.2
_name="${_basename}${pkgver%%.*}"
pkgname="lib32-${_name}"
pkgrel=1
pkgdesc="A cross-platform application and UI framework (32-bit)"
arch=('x86_64')
url="https://www.qt.io"
license=('QPL-1.0 OR GPL-2.0-only')
depends=('lib32-fontconfig' 'lib32-gcc-libs' 'lib32-glibc' 'lib32-libgl'
         'lib32-libice' 'lib32-libjpeg-turbo' 'lib32-libmng' 'lib32-libpng'
         'lib32-libsm' 'lib32-libx11' 'lib32-libxext' 'lib32-libxft'
         'lib32-libxmu' 'lib32-zlib' "${_name}>=${pkgver}")
makedepends=('byacc' 'cmake>=3.2' 'lib32-glu' 'lib32-freeglut' 'libxft')
provides=("lib${_name}.so")
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://download.qt.io/archive/${_basename}/${pkgver%%.*}/${_basename}-x11-${pkgver}.tar.gz"
        "${_name}_heliocastro.p1.patch::https://github.com/heliocastro/qt2/commit/080df684e1a5d9a76f1355b542e6b49a2c9cec3c.patch?full_index=1"
        "${_name}_heliocastro.p2.patch::https://github.com/heliocastro/qt2/compare/Original_Qt2...c47756733f1ad6f30065a3ff8d2c1ef02602b789.patch?full_index=1"
        "${_name}_sandsmark.patch::https://github.com/sandsmark/qt2/compare/3a0c5d71d20ea5b3d001a6d4c2cf2e1f1646f14b...367a986220ea1c4d01268f0c0e74cd1e7c888298.patch?full_index=1")
sha256sums=('0d7511c3a055f6ed89e6606bafa52510b9da33e96db1d2086642c49aea46b9fa'
            'dbb22b2ab128a48bf0ba55902c61fae3fa7f04c6ff3ba6222d6e6b513ada8945'
            '627740f0294596df6063f857700c7462c9f14c551c05784839031ba5e3ff9fe5'
            '36633cb6092f0524ee83aac5f6651dd7c0bff7b166352e0270d57042d4d09817')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  find . -type d -exec chmod 755 {} +
  find . -type f -exec chmod 644 {} +

  patch -Np1 -i "${srcdir}/${_name}_heliocastro.p1.patch" || true
  patch -Np1 -i "${srcdir}/${_name}_heliocastro.p2.patch" || true
  patch -Np1 -i "${srcdir}/${_name}_sandsmark.patch" || true

  sed -e '/set(CMAKE_VERBOSE_MAKEFILE ON)/d' \
      -e '/add_subdirectory(tools)/d' \
      -e '/add_subdirectory(doc)/d' \
      -i 'CMakeLists.txt'
  
  cd "src"
  sed -i '/add_subdirectory(moc)/d' 'CMakeLists.txt'
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR='lib32'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
