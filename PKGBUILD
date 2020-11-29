# Maintainer: Mladen Milinkovic <maxrd2@smoothware.net>

_pkgname=kconfigwidgets
pkgname=mingw-w64-$_pkgname
pkgver=5.76.0
pkgrel=1
arch=(any)
pkgdesc="Widgets for KConfig (mingw-w64)"
license=("LGPL")
depends=(mingw-w64-kauth mingw-w64-kcodecs mingw-w64-kconfig mingw-w64-kguiaddons mingw-w64-ki18n mingw-w64-kwidgetsaddons)
groups=(mingw-w64-kf5)
makedepends=(mingw-w64-extra-cmake-modules mingw-w64-qt5-tools)
options=(staticlibs !strip !buildflags)
url="https://community.kde.org/Frameworks"
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/$_pkgname-${pkgver}.tar.xz"{,.sig})
sha256sums=('f8eed399008a041df2da9cc3f2313df11376b94c85472900b39b9d6abcabe6d4'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd $_pkgname-$pkgver
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
