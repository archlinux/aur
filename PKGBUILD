# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
_pkgbase=vsxu
pkgname=${_pkgbase}-git
pkgver=0.4.0.1.r238.gbcc7e75
pkgrel=1
pkgdesc="A free to use program that lets you create and perform real-time audio visual presets."
arch=('i686' 'x86_64')
url="http://www.vsxu.com/"
license=('GPL' 'custom')
depends=('glew' 'glfw' 'glfw2' 'opencv')
makedepends=('git' 'cmake')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
install=${pkgname}.install
source=("git://github.com/vovoid/${_pkgbase}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  _branch=master
  cd "${srcdir}/${_pkgbase}"
  git checkout ${_branch}
}

build() {
  cd "${srcdir}/${_pkgbase}"
  # Do not use /usr/lib64  
  #sed -i "s/lib64/lib/g" `grep -rl lib64 .`

  #./configure --prefix=/usr
  [[ -d build ]] || mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DGLFW_LIBRARY=/usr/lib/libglfw2.so \
           -DPNG_LIBRARY=/usr/lib/libpng12.so \
           -DPNG_PNG_INCLUDE_DIR=/usr/include/libpng12

  make
}

package() {
  cd "${srcdir}/${_pkgbase}/build"
  make DESTDIR="${pkgdir}" install

  # License.
  install -Dm644 ../COPYING \
    "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
} 
