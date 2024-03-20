# Maintainer: Lubosz Sarnecki < lubosz at gmail dot com >

basename=draco
pkgname=$basename-git
pkgver=1.5.7.r1.g7d58126
pkgrel=1
pkgdesc="Draco is a library for compressing and decompressing 3D geometric meshes and point clouds. It is intended to improve the storage and transmission of 3D graphics."
arch=('x86_64')
url="https://google.github.io/draco/"
license=('Apache')
makedepends=('cmake' 'git')
depends=(gcc-libs)
source=("git+https://github.com/google/draco.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${basename}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${basename}"
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=on \
    -DBUILD_WITH_STATIC_CRT=off
  make
}

package() {
  cd "${srcdir}/${basename}/build"
  DESTDIR="${pkgdir}" make install
}
