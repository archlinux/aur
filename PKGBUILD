pkgname=mingw-w64-kimageformats
pkgver=5.45.0
pkgrel=1
arch=(any)
pkgdesc="Image format plugins for Qt5 (mingw-w64)"
license=("LGPL")
depends=(mingw-w64-qt5-base mingw-w64-openexr)
groups=(mingw-w64-kf5)
makedepends=(mingw-w64-cmake mingw-w64-extra-cmake-modules mingw-w64-karchive)
optdepends=("mingw-w64-karchive: plugin for Krita and OpenRaster images")
options=(staticlibs !strip !buildflags)
url="https://community.kde.org/Frameworks"
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/kimageformats-${pkgver}.tar.xz"{,.sig})
sha256sums=('d79feea60a3b0e9f73347b7b65361c3304a533edcd389efc4b5c9b222fcdac4d'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

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
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip -g --strip-unneeded {} \;
  done
}
