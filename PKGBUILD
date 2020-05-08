# Maintainer: Christoph Haag <christoph.haag@collabora.com>

basename=kwin-effect-xrdesktop
pkgname=$basename-git
pkgver=0.14.0.r0.g3e85e5b
pkgrel=1
pkgdesc='xrdesktop effect for KWin.'
arch=('x86_64')
url='https://gitlab.freedesktop.org/xrdesktop/kwin-effect-xrdesktop'
license=('GPL')
depends=(kwin libinputsynth-git xrdesktop-git)
makedepends=('extra-cmake-modules' 'git' 'vulkan-headers')
source=('git+https://gitlab.freedesktop.org/xrdesktop/kwin-effect-xrdesktop.git')
md5sums=('SKIP')

pkgver() {
  cd $basename
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $basename
  mkdir -p build
}

build() {
  cd $basename/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS:STRING="" \
    -DCMAKE_CXX_FLAGS:STRING="" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="" \
    -DCMAKE_SHARED_LINKER_FLAGS:STRING="" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd $basename/build
  make DESTDIR="$pkgdir" install
}
