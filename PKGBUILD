pkgname=mingw-w64-kservice
pkgver=5.21.0
pkgrel=1
arch=(any)
pkgdesc="Advanced plugin and service introspection (mingw-w64)"
license=("LGPL")
depends=(mingw-w64-kconfig mingw-w64-kcrash mingw-w64-kdbusaddons mingw-w64-ki18n)
groups=(mingw-w64-kf5)
makedepends=(mingw-w64-extra-cmake-modules)
options=(staticlibs !strip !buildflags)
url="https://community.kde.org/Frameworks"
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/kservice-${pkgver}.tar.xz")
md5sums=('f3dd9e0abd2a56402d28297ca4308d32')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd kservice-$pkgver
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
    rm -rf "$pkgdir/usr/${_arch}/etc"
    rm -rf "$pkgdir/usr/${_arch}/share"
  done
}
