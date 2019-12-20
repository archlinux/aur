# Maintainer: Christoph Haag <christoph.haag@collabora.com>

pkgname=("openxr-loader-git" "openxr-headers-git" "openxr-layers-git" "openxr-utils-git")
_dirname="openxr-loader"
pkgver=1.0.5.r7.ge4b4611
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/KhronosGroup/OpenXR-SDK-Source'
depends=()
makedepends=('cmake' 'git' 'vulkan-headers')
license=('apache')
source=("$_dirname::git+https://github.com/KhronosGroup/OpenXR-SDK-Source.git#branch=master")
md5sums=('SKIP')

#options=('debug' '!strip')

prepare() {
  cd "$_dirname"
}

pkgver() {
  cd "$_dirname"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "$_dirname"-build
  cd "$_dirname"-build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTS=ON \
    -DPRESENTATION_BACKEND=xlib \
    -DDYNAMIC_LOADER=ON \
    ../"$_dirname"
  make
}

package_openxr-loader-git() {
  provides=("openxr-loader")
  pkgdesc='OpenXR loader'

  cd "$_dirname"-build

  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/include/
  rm -rf "$pkgdir"/usr/bin/
  rm -rf "$pkgdir"/usr/share/openxr
  rm -rf "$pkgdir"/usr/lib/*ApiLayer*
}

package_openxr-headers-git() {
  provides=("openxr-headers")
  pkgdesc='OpenXR headers'

  cd "$_dirname"-build

  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/lib/
  rm -rf "$pkgdir"/usr/share/
  rm -rf "$pkgdir"/usr/bin/
}

package_openxr-layers-git() {
  depends=("openxr-loader")
  provides=("openxr-layers")
  pkgdesc='OpenXR Layers, including XR_APILAYER_LUNARG_core_validation'

  cd "$_dirname"-build

  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/include
  rm -rf "$pkgdir"/usr/share/doc
  rm -rf "$pkgdir"/usr/lib/pkgconfig
  rm -rf "$pkgdir"/usr/bin/
  rm -rf "$pkgdir"/usr/lib/*loader*
}

package_openxr-utils-git() {
  depends=("openxr-loader")
  provides=("openxr-utils")
  pkgdesc='OpenXR Utils: hello_xr, runtime_list'

  cd "$_dirname"-build

  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/include
  rm -rf "$pkgdir"/usr/share/
  rm -rf "$pkgdir"/usr/lib/
}
