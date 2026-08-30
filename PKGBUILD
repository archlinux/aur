# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Lubosz Sarnecki < lubosz at gmail dot com >

pkgname=compressonator-git
pkgdesc='Tool suite for Texture and 3D Model Compression, Optimization and Analysis.'
pkgver=4.5.52.r21.gf4b53d79
pkgrel=1
url='https://github.com/GPUOpen-Tools/Compressonator'
arch=(x86_64)
license=('MIT')
makedepends=(
  'boost'
  'cmake'
  'git'
  'python'
  'vulkan-headers'
)
depends=(
  'boost-libs'
  'draco-git'
  'opencv'
  'qt5-webengine'
)
provides=('compressonator')
conflicts=('compressonator')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd Compressonator
  # shellcheck disable=SC2312 # will render pkgver invalid on fail
  git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # only used in Windows
  mkdir -p VulkanSDK/1.4.357.0

  cd Compressonator/build

  python fetch_dependencies.py
}

build() {
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  local cmake_options=(
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_LIBDIR=lib
    -D CMAKE_INSTALL_SBINDIR=bin
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_BUILD_TYPE=RelWithDebInfo
    -D BUILD_SHARED_LIBS=ON
    -D LIBICUDATA=/usr/lib/libicudata.so
    -D LIBICUUC=/usr/lib/libicuuc.so
    -D LIBICUI18N=/usr/lib/libicui18n.so
  )
  export QT_DIR=/usr VULKAN_DIR="${srcdir}/VulkanSDK/1.4.357.0"
  cmake -B build -S Compressonator "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -vD -m644 Compressonator/license/guilicense.txt \
    -T "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
