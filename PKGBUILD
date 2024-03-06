#!/hint/bash
# Maintainer  : bartus <arch-user-repo(at)bartus.33mail.com>
# Contributor : Johannes Sauer <joh.sauer(at)gmail(dot)com>
# Contributor : Danilo Bargen <aur at dbrgn dot ch>
# shellcheck disable=SC2034,SC2154 # allow unused/uninitialized variables.

## Configuration env vars:
_fragment=#${FRAGMENT:-branch=master}
# Use CMAKE_FLAGS=xxx:yyy:zzz to define extra CMake flags
[[ -v CMAKE_FLAGS ]] && mapfile -t -d: CMAKE_FLAGS < <(echo -n "$CMAKE_FLAGS")

name=cloudcompare
#_fragment="#branch="
options=('!strip') # strip would also remove plugins, for some reason
pkgname=${name}-git
pkgver=2.12.1.r92.g597daac8
pkgrel=1
pkgdesc="A 3D point cloud (and triangular mesh) processing software"
arch=('i686' 'x86_64')
url="http://www.danielgm.net/cc/"
license=('GPL2')
depends=('cgal' 'fbx-sdk' 'ffmpeg4.4' 'glew' 'glu' 'mesa' 'mpir' 'pcl' 'pdal' 'laszip' 'qt5-base' 'qt5-tools' 'qt5-svg' 'qt5-websockets' 'shapelib' 'tbb' 'opencascade' 'opencv' 'gdal')
#fix pcl:>vtk:>vtkm:>openmp missing deps
depends+=(openmpi)
depends+=(nlohmann-json fmt jsoncpp)
depends+=(utf8cpp fast_float)
makedepends=('clang' 'cmake' 'doxygen' 'git' 'laz-perf' 'libharu' 'ninja' 'proj' 'python')
conflicts=('cloudcompare')
provides=('cloudcompare')
source=("${name}::git+https://github.com/CloudCompare/CloudCompare.git${_fragment}"
        "${name}-cork::git+https://github.com/CloudCompare/cork.git"
        CloudCompare.desktop
        ccViewer.desktop
        )
sha256sums=('SKIP'
            'SKIP'
            '14096df9cf7aca3099d5df1585d1cf669544e9b10754dce3d2507100dd7034fe'
            '821ac2540e1196774e26f8033946ce7b36223dae7a2a7c78f4a901b4177f68cc'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  git -C "${srcdir}/${name}" describe --long --tag | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  prepare_submodule
# sed "/CXX_STANDARD/s/14/17/" -i "${srcdir}/${name}"/cmake/CMakeSetCompilerOptions.cmake
}

build() {
  export CCACHE_BASEDIR="$srcdir"
# shellcheck disable=SC2191
  CMAKE_FLAGS+=(
        -Wno-dev
        -DPCL_QHULL_REQUIRED_TYPE=SHARED
        -DCMAKE_CXX_STANDARD=14
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -fpermissive -DSUPPORT_TOPO_STREAM_OPERATORS -Wno-deprecated-declarations"
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_INSTALL_LIBDIR=lib
        -DCMAKE_BUILD_TYPE=Release
        -DCCCORELIB_USE_CGAL=ON
        -DCCCORELIB_USE_TBB=ON
        -DPOISSON_RECON_WITH_OPEN_MP:BOOL=ON
        -DPLUGIN_EXAMPLE_GL:BOOL=OFF # no need to bundle examples
        -DPLUGIN_EXAMPLE_IO:BOOL=OFF
        -DPLUGIN_EXAMPLE_STANDARD:BOOL=OFF
        -DPLUGIN_GL_QEDL:BOOL=ON
        -DPLUGIN_GL_QSSAO:BOOL=ON
        -DPLUGIN_IO_QADDITIONAL:BOOL=ON
        -DPLUGIN_IO_QCORE:BOOL=ON
        -DPLUGIN_IO_QCSV_MATRIX:BOOL=ON
        -DPLUGIN_IO_QE57:BOOL=ON
        -DPLUGIN_IO_QFBX:BOOL=ON # requires update of AUR/fbx-sdk (https://www.autodesk.com/content/dam/autodesk/www/adn/fbx/2020-1-1/fbx202011_fbxsdk_linux.tar.gz)
        -DFBX_SDK_INCLUDE_DIR:PATH=/usr/include
        -DFBX_SDK_LIBRARY_FILE:FILEPATH=/usr/lib/libfbxsdk.so
        -DPLUGIN_IO_QLAS:BOOL=ON
        -DPLUGIN_IO_QPHOTOSCAN:BOOL=ON
        -DPLUGIN_IO_QRDB:BOOL=OFF # requires rdblib (package for AUR from http://www.riegl.com/products/software-packages/rdblib/)
        -DPLUGIN_IO_QSTEP=ON # requires opencascade
        -DOPENCASCADE_INC_DIR="/usr/include/opencascade"
        -DOPENCASCADE_LIB_DIR="/usr/lib"
        -DPLUGIN_STANDARD_QCANUPO:BOOL=ON 
        -DPLUGIN_STANDARD_QCOMPASS:BOOL=ON
        -DPLUGIN_STANDARD_QCORK:BOOL=ON # require mpir, cork (cork-git is not enough)
        -DMPIR_INCLUDE_DIR:PATH=/usr/include # required by qcork plugin
        -DCORK_INCLUDE_DIR:PATH="${srcdir}/${name}-cork/src" # required by qcork plugin
        -DFFMPEG_INCLUDE_DIR:PATH=/usr/include/ffmpeg4.4 # required by qAnimation plugin
        -DFFMPEG_LIBRARY_DIR:PATH=/usr/lib/ffmpeg4.4 # required by qAnimation plugin
        -DCORK_RELEASE_LIBRARY_FILE:FILEPATH="${srcdir}/${name}-cork/lib/libcork.a" # required by qcork plugin
        -DMPIR_RELEASE_LIBRARY_FILE:FILEPATH=/usr/lib/libmpir.so # require by qcork plugin
        -DPLUGIN_STANDARD_QCSF:BOOL=ON
        -DPLUGIN_STANDARD_QFACETS:BOOL=ON # requires shapelib
        -DOPTION_USE_SHAPE_LIB:BOOL=ON
        -DOPTION_USE_GDAL=ON
        -DPLUGIN_STANDARD_QHOUGH_NORMALS:BOOL=ON
        -DPLUGIN_STANDARD_QHPR:BOOL=ON
        -DPLUGIN_STANDARD_QM3C2:BOOL=ON
        -DPLUGIN_STANDARD_QPCL:BOOL=ON
        -DPLUGIN_STANDARD_QPCV:BOOL=ON
        -DPLUGIN_STANDARD_QPOISSON_RECON:BOOL=ON
        -DPLUGIN_STANDARD_QRANSAC_SD:BOOL=ON
        -DPLUGIN_STANDARD_QSRA:BOOL=ON
        -DOPTION_USE_DXF_LIB:BOOL=ON # required by qsra plugin
        -DPLUGIN_STANDARD_MASONRY_QAUTO_SEG=ON
        -DPLUGIN_STANDARD_MASONRY_QMANUAL_SEG=ON
        -DPLUGIN_STANDARD_QANIMATION=ON
        -DQANIMATION_WITH_FFMPEG_SUPPORT=ON
        -DPLUGIN_STANDARD_QBROOM=ON
        -DPLUGIN_STANDARD_QCANUPO=ON
        -DPLUGIN_STANDARD_QCOLORIMETRIC_SEGMENTER=ON
        -DPLUGIN_STANDARD_QJSONRPC=ON
        -DPLUGIN_STANDARD_QMPLANE=ON
        -DEIGEN_ROOT_DIR=/usr/include/eigen3
        
        
  )
  msg2 "Build Cork lib"
  make -C "${srcdir}/${name}-cork" CXXFLAGS="$CXXFLAGS -DSUPPORT_TOPO_STREAM_OPERATORS"
  msg2 "Build CloudCompare"
  cmake -B build -S "${srcdir}/${name}" -G Ninja "${CMAKE_FLAGS[@]}"
# shellcheck disable=SC2086 # allow slitting for MAKEFLAGS carrying multiple flags.
  ninja -C build ${MAKEFLAGS:--j1}
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # install *.desktop files
  install -D -m 644 "${srcdir}"/*.desktop -t "${pkgdir}"/usr/share/applications/

  # copy icons for *.desktop files
  for size in 16 32 64 256; do
    install -D -m 644 ${name}/qCC/images/icon/cc_icon_${size}.png "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/cc_icon.png
    install -D -m 644 ${name}/qCC/images/icon/cc_viewer_icon_${size}.png "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/cc_viewer_icon.png
  done 
  install -D -m 644 ${name}/qCC/images/icon/cc_icon.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/cc_icon.svg
  install -D -m 644 ${name}/qCC/images/icon/cc_viewer_icon.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/cc_viewer_icon.svg
}
# vim:set sw=2 ts=2 et:

# Generated with git_submodule_PKGBUILD_conf.sh ( https://gist.github.com/bartoszek/41a3bfb707f1b258de061f75b109042b )
# Call prepare_submodule in prepare() function

prepare_submodule() {
  git -C "$srcdir/CCCoreLib" config submodule.extern/nanoflann.url "$srcdir/nanoflann"
  git -C "$srcdir/cloudcompare" config submodule.plugins/core/IO/qE57IO/extern/libE57Format.url "$srcdir/libE57Format"
  git -C "$srcdir/cloudcompare" config submodule.extern/CCCoreLib.url "$srcdir/CCCoreLib"
  git -C "$srcdir/cloudcompare" config submodule.plugins/core/Standard/qPoissonRecon/extern/PoissonRecon.url "$srcdir/PoissonRecon"
  git -C "$srcdir/cloudcompare" config submodule.plugins/core/Standard/qMPlane.url "$srcdir/mplane-plugin"
  git -C "$srcdir/cloudcompare" config submodule.plugins/core/Standard/qColorimetricSegmenter.url "$srcdir/ptrans"
  git -C "$srcdir/cloudcompare" config submodule.plugins/core/Standard/qMasonry.url "$srcdir/masonry-cc"
  git -C "$srcdir/cloudcompare" config submodule.plugins/core/Standard/qJSonRPCPlugin.url "$srcdir/JSonRPCPlugin"
  git -C "$srcdir/cloudcompare" config submodule.plugins/core/Standard/qCanupo/contrib/dlib.url "$srcdir/dlib"
  git -C "$srcdir/cloudcompare" config submodule.plugins/core/Standard/cc-treeiso-plugin.url "$srcdir/cc-treeiso-plugin"
  git -C "$srcdir/cloudcompare" config submodule.plugins/core/Standard/q3DMASC.url "$srcdir/q3DMASC"
  git -C "$srcdir/libE57Format" config submodule.test/extern/googletest.url "$srcdir/googletest"
  git -C "$srcdir/cloudcompare" -c protocol.file.allow=always submodule update --init --recursive
}
source+=(
  "nanoflann::git+https://github.com/jlblancoc/nanoflann"
  "libE57Format::git+https://github.com/asmaloney/libE57Format"
  "CCCoreLib::git+https://github.com/CloudCompare/CCCoreLib"
  "PoissonRecon::git+https://github.com/cloudcompare/PoissonRecon"
  "mplane-plugin::git+https://github.com/hvs-ait/mplane-plugin"
  "ptrans::git+https://gitlab.univ-nantes.fr/E164955Z/ptrans"
  "masonry-cc::git+https://github.com/CyberbuildLab/masonry-cc"
  "JSonRPCPlugin::git+https://gitlab.com/theadib/JSonRPCPlugin"
  "dlib::git+https://github.com/davisking/dlib"
  "cc-treeiso-plugin::git+https://github.com/truebelief/cc-treeiso-plugin"
  "q3DMASC::git+https://github.com/dgirardeau/q3DMASC"
  "googletest::git+https://github.com/google/googletest"
)
