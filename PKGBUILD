pkgname=mingw-w64-extra-cmake-modules
pkgver=5.12.0
pkgrel=1
arch=(any)
pkgdesc="Extra modules and scripts for CMake (mingw-w64)"
license=("LGPL")
makedepends=(mingw-w64-cmake)
options=(staticlibs !strip !buildflags)
url="https://projects.kde.org/projects/kdesupport/extra-cmake-modules"
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/extra-cmake-modules-${pkgver}.tar.xz"
"set-AUTOSTATICPLUGINS.patch")
md5sums=('e4042cf258b545267d74b0cf7d756150'
         '0d249754247382f3b8dda80d6833aac4')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd extra-cmake-modules-$pkgver
	patch -p1 -i "${srcdir}"/set-AUTOSTATICPLUGINS.patch
}

build() {
	cd extra-cmake-modules-$pkgver
	for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_HTML_DOCS=OFF \
      ..
    make
    popd
  done
}

package() {
	for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname#mingw-w64-}-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
  done
}
