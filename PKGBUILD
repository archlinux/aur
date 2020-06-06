# Maintainer: Markus Näther <naetherm@informatik.uni-freiburg.de>

pkgname=bforartists
pkgver=2.1.0
pkgrel=2
pkgdesc="A fully integrated 3D graphics creation suite (development)"
arch=('i686' 'x86_64')
url="www.bforartists.de"
license=('GPL')
depends=('alembic' 'libgl' 'python' 'desktop-file-utils' 'hicolor-icon-theme'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openshadinglanguage' 'libtiff' 'libpng' 'python-numpy' 'llvm')
makedepends=('git' 'cmake' 'boost' 'mesa' 'llvm')
optdepends=('cuda')
provides=('bforartists')
conflicts=('bforartists-git')
replaces=('bforartists')
backup=()
options=()
srcver="$pkgver"
install=bforartists.install
source=("https://github.com/Bforartists/Bforartists/archive/v$srcver.tar.gz")
md5sums=('1486365b5ee56b92f00dad66d65574f1')
noextract=()

# determine whether we can precompile CUDA kernels
_CUDA_PKG=`pacman -Qq cuda 2>/dev/null` || true
if [ "$_CUDA_PKG" != "" ]; then
    _EXTRAOPTS="-DWITH_CYCLES_CUDA_BINARIES=ON \
                -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda"
fi

prepare() {
  cd "$srcdir/Bforartists-$srcver"
}

build() {

  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "python version detected: ${_pyver}"
  
  mkdir -p $srcdir/bforartists-build
  cd $srcdir/bforartists-build
  cmake $srcdir/Bforartists-$srcver \
    -DPYTHON_NUMPY_PATH=/usr/lib/python3.8/site-packages \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DWITH_INSTALL_PORTABLE=OFF \
    -DWITH_PYTHON_INSTALL=OFF \
    -DWITH_OPENCOLORIO=ON \
    -DWITH_FFTW3=ON \
    -DWITH_SYSTEM_GLEW=ON \
    -DWITH_CODEC_FFMPEG=ON \
    -DWITH_LLVM=ON \
    -DWITH_CYCLES_OSL=ON \
    -DPYTHON_VERSION=3.8 \
    $_EXTRAOPTS
#    -DWITH_OPENCOLLADA:BOOL=OFF \

  make
}

package() {
  cd $srcdir/bforartists-build
  make DESTDIR="$pkgdir" install
  python -m compileall \
  $pkgdir/usr/share/bforartists/$bfa_version/scripts/startup \
  $pkgdir/usr/share/bforartists/$bfa_version/scripts/modules \
  $pkgdir/usr/share/bforartists/$bfa_version/scripts/addons
  
  msg "add -${pkgver} suffix to desktop shortcut"
  sed -i "s/=blender/=blender-${pkgver}/g" "${pkgdir}/usr/share/applications/bforartists.desktop"
  sed -i "s/=Blender/=Blender-${pkgver}/g" "${pkgdir}/usr/share/applications/bforartists.desktop"
  mv "${pkgdir}/usr/share/applications/bforartists.desktop" "${pkgdir}/usr/share/applications/bforartists-${pkgver}.desktop"
}
