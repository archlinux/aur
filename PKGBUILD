# Maintainer: Mathieu Westphal <mathieu.westphal@kitware.com>
pkgname=paraview-git
pkgrel=3
pkgver=v5.4.1.r618.7ac67aad77
pkgdesc="Open-source, multi-platform data analysis and visualization application"
arch=('i686' 'x86_64')
url="https://www.paraview.org/"
license=('custom')
depends=('python2' 'intel-tbb' 'openmpi' 'libxt' 'qt5-x11extras' 'qt5-tools' 'ffmpeg')
optdepends=('python2-numpy: numpy support'
            'python2-matplotlib: matplotlib drawing support'
            'python2-scipy: scipy support')
makedepends=('git' 'ninja' 'cmake')
source=("git+https://gitlab.kitware.com/paraview/paraview.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  git submodule update --init
  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}/build"
  cmake -G Ninja \
    -DCMAKE_INSTALL_PREFIX:STRING="$pkgdir/usr/" \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DPARAVIEW_ENABLE_PYTHON:BOOL=ON \
    -DPARAVIEW_USE_MPI:BOOL=ON \
    -DPARAVIEW_ENABLE_FFMPEG:BOOL=ON \
    -DVTK_SMP_IMPLEMENTATION_TYPE:STRING=TBB \
    -DPARAVIEW_INSTALL_DEVELOPMENT_FILES:BOOL=ON \
    ../
  ninja
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  ninja install

  # Install license
  install -Dm644 "${srcdir}/${pkgname%-git}/License_v1.2.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Rename hdf5 settings to avoid potential conflicts
   mv "${pkgdir}/usr/share/cmake/hdf5" "${pkgdir}/usr/share/cmake/paraview-git_hdf5"
}
