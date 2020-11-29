# Maintainer: Mladen Milinkovic <maxrd2@smoothware.net>

pkgname=mingw-w64-threadweaver
pkgver=5.76.0
pkgrel=1
arch=(any)
pkgdesc="High-level multithreading framework (mingw-w64)"
license=("LGPL")
depends=(mingw-w64-qt5-base)
groups=(mingw-w64-kf5)
makedepends=(mingw-w64-cmake mingw-w64-extra-cmake-modules)
options=(staticlibs !strip !buildflags)
url="https://projects.kde.org/projects/frameworks/threadweaver"
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/threadweaver-${pkgver}.tar.xz")
md5sums=('2f00e9874a88267c7bc31ed57b17379a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd threadweaver-$pkgver
	for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
      -DBUILD_TESTING=OFF \
      ..
    make
    popd
  done
}

package() {
	for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname#mingw-w64-}-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -rf "$pkgdir/usr/${_arch}/share"
  done
}
