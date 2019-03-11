pkgname=mrpt
pkgver=1.5.6
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
        "https://raw.githubusercontent.com/majorx234/FindNumPy.cmake/master/FindNumPy.cmake")
sha256sums=('SKIP' 
         '4c755c5fecd2f6bca94b02cf2695bcc1c06bd11d34a85f7b2a90bc9f1ebdf4c7'
         'e8cbe6841595d594659d9a16464af2386efd0dce2947e8f348e2c47fad1d022f')

prepare() {
  cp ${srcdir}/FindNumPy.cmake ${srcdir}/$pkgname-$pkgver/cmakemodules/
  cd "${srcdir}/$pkgname-$pkgver"
  patch -Np1 -i "${srcdir}/mrpt_CmakeLists.patch"
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
