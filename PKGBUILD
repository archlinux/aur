# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Based on "draco-git", formerly maintained by Lubosz Sarnecki <lubosz at gmail dot com>

_name=draco
pkgname=${_name}-3d-git
pkgver=1.5.9.r1.gd429de8
pkgrel=1
pkgdesc="Draco is a library for compressing and decompressing 3D geometric meshes and point clouds. It is intended to improve the storage and transmission of 3D graphics."
arch=('x86_64')
url="https://google.github.io/draco/"
license=('Apache-2.0')
conflicts=('draco-git')
makedepends=('cmake' 'git')
depends=('glibc' 'libstdc++' 'libgcc')

source=("git+https://github.com/google/draco.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_name}"
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
  cd "${srcdir}/${_name}/build"
  DESTDIR="${pkgdir}" make install
}
