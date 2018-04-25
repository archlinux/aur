pkgname=mingw-w64-kunitconversion
pkgver=5.45.0
pkgrel=1
arch=(any)
pkgdesc="Support for unit conversion (mingw-w64)"
license=("LGPL")
depends=(mingw-w64-ki18n)
groups=(mingw-w64-kf5)
makedepends=(mingw-w64-cmake mingw-w64-extra-cmake-modules python)
options=(staticlibs !strip !buildflags)
url="https://projects.kde.org/projects/frameworks/kunitconversion"
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/kunitconversion-${pkgver}.tar.xz"{,.sig})
sha256sums=('7906c5d3e911b6689e6aa55a5d63549658069696f2c4f89f317c3cc3862e952a'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

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
