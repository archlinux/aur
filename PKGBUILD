pkgname=brlcad
pkgver=7.42.2
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
)
sha512sums=(
  '6f6d139e60c6adb4cf31894b8892e5ea5ab13e494e8a55843914bc7e1c5063c97f584f50a7edac9acf7493ec1493952dc6f5780cb5d839c8e0453fb400367bd4'
)

_build_config='Release'
_prefix="/opt/${pkgname}"

prepare() {
  cd "${srcdir}/${pkgname}-${_tag_name}"
  sed -i 's/g_target/#g_target/' db/nist/CMakeLists.txt
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
    # System library locations
    -DPNG_PNG_INCLUDE_DIR=/usr/include \
    -DLMDB_LIBRARY=/usr/lib/liblmdb.so \
    -DLMDB_INCLUDE_DIR=/usr/include \
    -DUTAHRLR_LIBRARY=/usr/lib/libutahrle.so \
    -DUTAHRLR_INCLUDE_DIR=/usr/include \
    -DSTEPCODE_DAI_DIR=/usr/include/stepcode \
    -DSTEPCODE_EDITOR_DIR=/usr/lib/cmake/stepcode \
    -DSTEPCODE_STEPCORE_DIR=/usr/lib/cmake/stepcode \
    -DSTEPCODE_UTILS_DIR=/usr/lib/cmake/stepcode \
    -DSTEPCODE_EXPPP_DIR=/usr/lib/cmake/stepcode \
    -DSTEPCODE_EXPRESS_DIR=/usr/lib/cmake/stepcode \
    -DSTEPCODE_INCLUDE_DIR=/usr/include/stepcode \
    -DSTEPCODE_EXPRESS_LIBRARY=/usr/lib/libstepcode_express.so \
    -DSTEPCODE_EXPPP_LIBRARY=/usr/lib/libstepcode_exppp.so \
    -DSTEPCODE_CORE_LIBRARY=/usr/lib/libstepcode_core.so \
    -DSTEPCODE_EDITOR_LIBRARY=/usr/lib/libstepcode_editor.so \
    -DSTEPCODE_DAI_LIBRARY=/usr/lib/libstepcode_dai.so \
    -DSTEPCODE_UTILS_LIBRARY=/usr/lib/libstepcode_utils.so \
    -DEXPP2CXX_EXECUTABLE=/usr/bin/expp2cxx \
    -DCLIPPER2_DIR=/usr/lib/cmake/Clipper2 \
    -DGTE_INCLUDE_DIR=/usr/include/GTE \
    -DMMESH_LIBRARY=/usr/lib/libmmesh.so \
    -DMMESH_INCLUDE_DIR=/usr/include/mmesh \
    -DOPENMESH_CORE_LIBRARY=/usr/lib/libOpenMeshCore.so \
    -DOPENMESH_TOOLS_LIBRARY=/usr/lib/libOpenMeshTools.so \
    -DOPENMESH_INCLUDE_DIR=/usr/include/OpenMesh \
    -DMANIFOLD_LIBRARY=/usr/lib/libmanifold.so \
    -DMANIFOLD_INCLUDE_DIR=/usr/include/manifold \
    -DOPENNURBS_LIBRARY=/usr/lib/libopennurbs.so \
    -DOPENNURBS_INCLUDE_DIR=/usr/include/opennurbs \
    -DOPENNURBS_X_INCLUDE_DIR=/usr/include/opennurbs/x \
    -DPERPLEX_EXECUTABLE=/usr/bin/perplex \
    -DPERPLEX_TEMPLATE=/usr/share/perplex/template \
    -DREGEX_LIBRARY=/usr/lib/libregex.so \
    -DSWIG_EXECUTABLE=/usr/bin/swig \
    -DSWIG_DIR=/usr/share/swig \
    -DDOXYGEN_EXECUTABLE=/usr/bin/doxygen \
    -DMPI_C_LIB_NAMES=mpi \
    -DMPI_C_HEADER_DIR=/usr/include \
    -DMPI_C_WORKS=ON

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
