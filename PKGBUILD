# Maintainer: bartus <aur@bartus.33mail.com>
pkgname=openmvs-git
pkgver=0.7.r9.g8cbeda1
pkgrel=1
pkgdesc="open Multi-View Stereo reconstruction library with simple and automatic set of tools"
arch=('i686' 'x86_64')
url="http://cdcseacave.github.io/openMVS"
license=('GPL')
depends=('opencv' 'cgal' 'nvidia-utils')
makedepends=('git' 'cmake' 'cuda' 'boost' 'eigen' 'ceres-solver')
options=()
source=("${pkgname}::git+https://github.com/cdcseacave/openMVS.git"
        "vcglib::git+https://github.com/cdcseacave/VCG.git"
        "cuda.patch"
        )
md5sums=('SKIP'
         'SKIP'
         '39ab7cf21b8ca42ad9dd28d80e71b323')

pkgver() {
  cd "$pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

prepare() {
  cd ${srcdir}/${pkgname}
  patch -Np1 -i ../cuda.patch
}


build() {
  cd ${srcdir}
  mkdir -p build
  cd build
  cmake ../${pkgname} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DINSTALL_BIN_DIR=/usr/bin -DVCG_DIR="../vcglib"
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
