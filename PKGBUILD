pkgname=mrpt
pkgver=1.5.8
pkgrel=1
pkgdesc="Provides an extensive set of libraries, algorithms, and applications employed in a number of mobile robotics research areas."
arch=('i686' 'x86_64' 'armv7h')
url="http://www.mrpt.org"
license=('GPL3')
depends=('opencv' 'wxgtk' 'desktop-file-utils')
makedepends=('subversion' 'cmake' 'git')
optdepends=('ffmpeg: Video Support' 'freeglut' 'zlib'
            'libftdi' 'libdc1394' 'libusb: Kinect support'
            'pcl' 'assimp')
install=mrpt.install

_dir=${pkgname}-${pkgver}
_tag=${pkgver}
source=("${_dir}"::"git+https://github.com/MRPT/mrpt.git"#tag=${_tag}
        "https://raw.githubusercontent.com/majorx234/mrpt_patch/master/mrpt_CmakeLists.patch"
        "https://raw.githubusercontent.com/majorx234/FindNumPy.cmake/master/FindNumPy.cmake"
        "opencv_and_opencv2-opt.patch"
        "prevent_gtk3_linking.patch")

sha256sums=('SKIP'
         'ec4f93431c098ef2515f6bb10358cb17dd3c804ebb295285792ad62f0826ab32' 
         'e8cbe6841595d594659d9a16464af2386efd0dce2947e8f348e2c47fad1d022f'
         'SKIP'
         'SKIP')
        
prepare() {
  cp ${srcdir}/FindNumPy.cmake ${srcdir}/$pkgname-$pkgver/cmakemodules/
  cd "${srcdir}/$pkgname-$pkgver"
  patch -Np1 -i "${srcdir}/mrpt_CmakeLists.patch"
  patch -Np1 -i "${srcdir}/opencv_and_opencv2-opt.patch"
  patch -Np1 -i "${srcdir}/prevent_gtk3_linking.patch" 
}

build() {
  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake ${srcdir}/$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_FLAGS="-fpermissive" \
        -DMRPT_OPTIMIZE_NATIVE=ON 
  make 
}

package() {
   cd "${srcdir}/build"
   make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
