# Maintainer: Christoph Haag <christoph.haag@collabora.com>

_basename=kwin-effect-xrdesktop
pkgname="$_basename"-git
pkgver=0.16.0.r15.gd10c341
pkgrel=1
pkgdesc='xrdesktop effect for KWin.'
arch=('x86_64')
url='https://gitlab.freedesktop.org/xrdesktop/kwin-effect-xrdesktop'
license=('GPL-2.0-or-later')
depends=('kwin' 'libinputsynth-git' 'xrdesktop-git' 'gcc-libs' 'glibc' 'g3k-git' 'gxr-git' 'graphene' 'gulkan-git')
makedepends=('extra-cmake-modules' 'git' 'vulkan-headers')
source=('git+https://gitlab.freedesktop.org/xrdesktop/kwin-effect-xrdesktop.git#branch=main')
md5sums=('SKIP')

pkgver() {
  cd "$_basename"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_basename"
  mkdir -p build
}

build() {
  cd "$_basename"/build
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
  cd "$_basename"/build
  make DESTDIR="$pkgdir" install
}
