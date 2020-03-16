# Maintainer: Markus Näther <naetherm@informatik.uni-freiburg.de>

pkgname=bforartists-git
pkgver=2.0.0.99980c7
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite (development)"
arch=('i686' 'x86_64')
url="www.bforartists.de"
license=('GPL')
groups=()
depends=('libgl' 'python' 'desktop-file-utils' 'hicolor-icon-theme'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openshadinglanguage' 'libtiff' 'libpng' 'python-numpy')
makedepends=('cmake' 'git' 'boost' 'mesa')
optdepends=('cuda')
provides=('bforartists')
conflicts=('bforartists')
replaces=('bforartists')
backup=()
options=()
install=bforartists.install
source=('git://github.com/Bforartists/Bforartists.git')
md5sums=('SKIP')
noextract=()

# determine whether we can precompile CUDA kernels
_CUDA_PKG=`pacman -Qq cuda 2>/dev/null` || true
if [ "$_CUDA_PKG" != "" ]; then
    _EXTRAOPTS="-DWITH_CYCLES_CUDA_BINARIES=ON \
                -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda"
fi

prepare() {
  cd "$srcdir/Bforartists"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  # update the submodules
  git submodule update --init --recursive
  git submodule foreach git checkout master
  git submodule foreach git pull --rebase origin master
}

build() {
  mkdir -p $srcdir/bforartists-build
  cd $srcdir/bforartists-build
  cmake $srcdir/Bforartists \
    -DPYTHON_NUMPY_PATH=/usr/lib/python3.8/site-packages \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DWITH_INSTALL_PORTABLE=OFF \
    -DWITH_PYTHON_INSTALL=OFF \
    -DWITH_OPENCOLORIO=ON \
    -DWITH_FFTW3=ON \
    -DWITH_SYSTEM_GLEW=ON \
    -DWITH_CODEC_FFMPEG=ON \
    -DPYTHON_VERSION=3.8 \
    $_EXTRAOPTS
#    -DWITH_OPENCOLLADA:BOOL=OFF \

  make -j $(nproc)
}

package() {
  cd $srcdir/bforartists-build
  make DESTDIR="$pkgdir" install
  python -m compileall \
  $pkgdir/usr/share/bforartists/$bfa_version/scripts/startup \
  $pkgdir/usr/share/bforartists/$bfa_version/scripts/modules \
  $pkgdir/usr/share/bforartists/$bfa_version/scripts/addons
}
