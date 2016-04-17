pkgname=mingw-w64-kunitconversion
pkgver=5.21.0
pkgrel=1
arch=(any)
pkgdesc="Support for unit conversion (mingw-w64)"
license=("LGPL")
depends=(mingw-w64-ki18n)
groups=(mingw-w64-kf5)
makedepends=(mingw-w64-cmake mingw-w64-extra-cmake-modules python)
options=(staticlibs !strip !buildflags)
url="https://projects.kde.org/projects/frameworks/kunitconversion"
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/kunitconversion-${pkgver}.tar.xz")
md5sums=('b926ae0d615f52a2314c3d0935ea8953')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd kunitconversion-$pkgver
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
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -rf "$pkgdir/usr/${_arch}/share"
  done
}
