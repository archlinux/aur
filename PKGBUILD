# Maintainer: Christoph Haag <christoph.haag@collabora.com>

pkgname=("openxr-loader-git" "openxr-headers-git")
_dirname="openxr-loader"
pkgver=r70.992061d
pkgrel=1
pkgdesc='OpenXR Loader and headers'
arch=('i686' 'x86_64')
url='https://github.com/KhronosGroup/OpenXR-SDK'
depends=()
provides=("openxr-loader")
makedepend=('cmake' 'git')
license=('apache')
source=("$_dirname::git+https://github.com/KhronosGroup/OpenXR-SDK.git"
	"support_installing_the_loader.diff")
md5sums=('SKIP'
         'c996468fee9d384626e563e483fba51f')

#options=('debug' '!strip')

prepare() {
  cd "$_dirname"
  git apply -vvv "$srcdir"/support_installing_the_loader.diff
}

pkgver() {
  cd "$_dirname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$_dirname"-build
  cd "$_dirname"-build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTS=OFF \
    -DPRESENTATION_BACKEND=xlib \
    -DDYNAMIC_LOADER=ON \
    ../"$_dirname"
  make
}

package_openxr-loader-git() {
  cd "$_dirname"-build
  make DESTDIR="$pkgdir" install openxr_loader

  rm -rf "$pkgdir"/usr/include/
}

package_openxr-headers-git() {
  cd "$_dirname"-build
  # TODO install target for headers
  install -d "$pkgdir"/usr/include/openxr/
  cp -ra include/openxr/*.h "$pkgdir"/usr/include/openxr/
}
