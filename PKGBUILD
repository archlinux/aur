# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=vsxu-git
pkgver=0.5.1.r1.gbcc7e75
pkgrel=1
pkgdesc="A free to use program that lets you create and perform real-time audio visual presets."
arch=('i686' 'x86_64')
url="http://www.vsxu.com/"
license=('GPL' 'custom')
depends=('pulseaudio' 'glew' 'glfw' 'glfw2' 'opencv' 'libpng12' 'desktop-file-utils' 'xdg-utils')
makedepends=('git' 'cmake')
optdepends=( 'jack: alternate audio source')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/vovoid/vsxu.git")
sha512sums=('SKIP')
_branch=master

pkgver() {
  cd "${srcdir}/${pkgname}"
  git checkout ${_branch} --quiet
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git checkout ${_branch}
}

build() {
  cd "${srcdir}/${pkgname}"
  [[ -d build ]] || mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
        -DGLFW_LIBRARY=/usr/lib/libglfw2.so \
        -DPNG_LIBRARY=/usr/lib/libpng12.so \
        -DPNG_PNG_INCLUDE_DIR=/usr/include/libpng12
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" install

  # License.
  install -Dm644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
