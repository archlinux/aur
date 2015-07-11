pkgname=mingw-w64-kimageformats
pkgver=5.12.0
pkgrel=1
arch=(any)
pkgdesc="Image format plugins for Qt5 (mingw-w64)"
license=("LGPL")
depends=(mingw-w64-qt5-base)
makedepends=(mingw-w64-cmake mingw-w64-extra-cmake-modules mingw-w64-openexr)
optdepends=("mingw-w64-openexr: EXR plugins")
options=(staticlibs !strip !buildflags)
url="https://projects.kde.org/projects/frameworks/kimageformats"
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/kimageformats-${pkgver}.tar.xz")
md5sums=('36e1a6fc39c73670b744429a1b3ef288')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd kimageformats-$pkgver
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
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip -g {} \;
    rm -rf "$pkgdir/usr/${_arch}/share"
  done
}
