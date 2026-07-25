pkgname=brlcad
pkgver=7.44.0
pkgrel=1
pkgdesc='Extensive 3D solid modeling system'
url='https://brlcad.org'
license=('LGPL-2.1-only' 'BSD-3-Clause' 'LicenseRef-BDL')
arch=(i686 x86_64)
depends=(gdal libgl libxft libxi)
makedepends=(cmake ninja git lemon re2c astyle geogram zlib netpbm libpng lmdb eigen3 sqlite proj gdal pugixml assimp opencv manifold tcl tk itk)
install="${pkgname}.install"
_tag_name="rel-${pkgver//./-}"
source=(
  "${pkgname}-${_tag_name}.tar.gz::https://github.com/BRL-CAD/${pkgname}/archive/refs/tags/${_tag_name}.tar.gz"
  "bext::git+https://github.com/BRL-CAD/bext.git"
  "fix-utahrle-gcc15.patch"
)
sha512sums=('c2c4c6be526f99179d3577b32c070438a4d60a1fb73c2ad96e0176d3529c5d21b2944d98d2dcc5e1172c23cbf97f0898b83e16c4125fba953d46587b6745386b'
            'SKIP'
            'f19a38ed643af14f761bdd535b75456266bccfdc5fbc2454b7be75a90e38e3884e72eb012b528acf7e6a2266c525b1e817acfacbc523f6124e4c94d92ae4fa2b')

_build_config='Release'
_prefix="/opt/${pkgname}"

prepare() {
  cd "${srcdir}/${pkgname}-${_tag_name}"
  sed -i 's/g_target/#g_target/' db/nist/CMakeLists.txt

  # Initialize only utahrle submodule in bext
  cd "${srcdir}/bext"
  git submodule update --init utahrle
  # Apply patches
  patch -Np1 -i "${srcdir}/fix-utahrle-gcc15.patch"
}

build() {
  cmake \
    -G Ninja \
    -S "${srcdir}/${pkgname}-${_tag_name}" \
    -B "${srcdir}/build" \
    -Wno-dev \
    "-DCMAKE_INSTALL_PREFIX=${_prefix}" \
    "-DCMAKE_BUILD_TYPE=${_build_config}" \
    -DBUILD_STATIC_LIBS=OFF \
    -DBRLCAD_ENABLE_COMPILER_WARNINGS=OFF \
    -DBRLCAD_ENABLE_STRICT=OFF \
    -DBRLCAD_FLAGS_DEBUG=OFF \
    -DBRLCAD_BUNDLED_LIBS=SYSTEM \
    -DBRLCAD_ENABLE_MINIMAL=ON \
    -DBRLCAD_GDAL=OFF \
    -DBRLCAD_PNG=OFF \
    -DBRLCAD_REGEX=OFF \
    -DBRLCAD_ZLIB=OFF \
    -DBRLCAD_ENABLE_OPENGL=OFF \
    -DBRLCAD_ENABLE_QT=OFF \
    -DBRLCAD_ENABLE_TCL=OFF \
    "-DBRLCAD_EXT_PARALLEL=$(nproc)" \
    # Only specify paths for makedepends that are not found automatically
    -DPNG_PNG_INCLUDE_DIR=/usr/include \
    -DLMDB_LIBRARY=/usr/lib/liblmdb.so \
    -DLMDB_INCLUDE_DIR=/usr/include \
    -DMANIFOLD_LIBRARY=/usr/lib/libmanifold.so \
    -DMANIFOLD_INCLUDE_DIR=/usr/include/manifold \
    -DSQLite3_LIBRARY=/usr/lib/libsqlite3.so \
    -DSQLite3_INCLUDE_DIR=/usr/include \
    "-DBRLCAD_EXT_SOURCE_DIR=${srcdir}/bext"

  cmake --build "${srcdir}/build" --config "${_build_config}"

  echo "export PATH=\"\$PATH:${_prefix}/bin\"" >"${srcdir}/build/${pkgname}.sh"
}

package() {
  cmake \
    --install "${srcdir}/build" \
    --config "${_build_config}" \
    --prefix "${pkgdir}${_prefix}"

  install \
    -D \
    -m644 \
    "${srcdir}/build/share/doc/legal/"{bdl,bsd}.txt \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install \
    -D \
    -m755 \
    "${srcdir}/build/${pkgname}.sh" \
    "${pkgdir}/etc/profile.d/${pkgname}.sh"
}
