# Maintainer: Rebecca Jones <rebecca+aur@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: John Sowiak <john@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
pkgname=fluid-designer
pkgver=2.78a
pkgrel=1
pkgdesc="A home designer based on Blender"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.microvellum.com/products/fluid-designer/"
depends=('libpng' 'libtiff' 'openexr' 'desktop-file-utils' 'python-requests'
         'shared-mime-info' 'hicolor-icon-theme' 'xdg-utils' 'glew' 'openjpeg'
         'freetype2' 'openal' 'ffmpeg' 'fftw' 'boost-libs' 'opencollada'
         'openimageio' 'libsndfile' 'jack' 'opencolorio' 'python'
         'jemalloc' 'libspnav' 'ptex' 'opensubdiv' 'openvdb' 'log4cplus')
makedepends=('cmake' 'boost' 'mesa' 'git' 'llvm' 'gcc')
makedepends_x86_64=('cuda')
optdepends=('cuda: cycles renderer cuda support')
options=(!strip)
install=fluid-designer.install
source=("https://github.com/Microvellum/BlenderFD-2.78a/archive/master.tar.gz")
sha512sums=('SKIP')

prepare() {
  cd "BlenderFD-2.78a"

  sed -i 's|set(FFMPEG_INCLUDE_DIRS ${FFMPEG}/include)|set(FFMPEG_INCLUDE_DIRS /usr/include/ffmpeg2.8)|g' CMakeLists.txt
  sed -i 's|set(FFMPEG_LIBPATH ${FFMPEG}/lib)|set(FFMPEG_LIBPATH /usr/lib/ffmpeg2.8)|g' CMakeLists.txt
}

build() {
  cd "BlenderFD-2.78a"

  [[ -d build ]] && rm -r build
  mkdir build && cd build

  [[ $CARCH == i686 ]] && BUILDCUDA="OFF" || BUILDCUDA="ON"

  #export CC=gcc-5
  #export CXX=g++-5
  cmake -C../build_files/cmake/config/blender_full.cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_INSTALL_PORTABLE=OFF \
    -DWITH_PYTHON_INSTALL=OFF \
    -DOPENIMAGEIO_ROOT_DIR=/usr \
    -DWITH_LLVM=ON \
    -DWITH_SYSTEM_OPENJPEG=ON \
    -DWITH_GL_PROFILE_CORE=OFF \
    -DWITH_GL_PROFILE_ES20=OFF \
    -DLLVM_VERSION=4.0 \
    -DLLVM_STATIC=ON \
    -DWITH_CYCLES_OSL=OFF \
    -DWITH_CYCLES_PTEX=OFF \
    -DWITH_OPENSUBDIV=ON \
    -DPYTHON_VERSION=3.6 \
    -DPYTHON_LIBPATH=/usr/lib \
    -DPYTHON_LIBRARY=python3.6m \
    -DPYTHON_INCLUDE_DIRS=/usr/include/python3.6m
  make  # -j5 needs 48 GB of RAM while -j9 needs 64 GB
}

package() {
  cd "$srcdir/BlenderFD-2.78a/build"

  make DESTDIR="${pkgdir}" install
  python -m compileall "${pkgdir}/usr/share/blender"
  python -O -m compileall "${pkgdir}/usr/share/blender"
}
