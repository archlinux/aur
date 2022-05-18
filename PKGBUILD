# Maintainer: Martchus <martchus@gmx.net>
# Contributor (maintains regular package): Antonio Rojas <arojas@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_pkgname=kirigami2
pkgname=mingw-w64-$_pkgname
pkgver=5.94.0
pkgrel=1
pkgdesc="A QtQuick based components set (mingw-w64)"
arch=('any')
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(mingw-w64-crt mingw-w64-qt5-quickcontrols mingw-w64-qt5-quickcontrols2 mingw-w64-qt5-graphicaleffects)
makedepends=(mingw-w64-gcc mingw-w64-cmake mingw-w64-extra-cmake-modules mingw-w64-qt5-tools mingw-w64-qt5-svg kpackage)
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/$_pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('d7f27da3325feb339f4e1a3db78df44f05e4f505f36e15c7caeac04da0428e39'
            'SKIP')
validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>
options=(!buildflags staticlibs !strip !emptydirs)

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd $_pkgname-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}"
  done
}

build() {
  cd $_pkgname-$pkgver
  for _arch in ${_architectures}; do
    # workaround regression in CMake files of Qt (likely introduced by my patches)
    for m in Gui Core; do
      export CXXFLAGS+=" -I/usr/$_arch"/include/qt/Qt$m/$($_arch-qmake-qt5 -query QT_VERSION){/Qt$m,}
    done
    pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_TESTING=OFF \
      -DBUILD_QCH=OFF \
      ..
    make
    popd
  done
}

package() {
  cd $_pkgname-$pkgver
  for _arch in ${_architectures}; do
    pushd "build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/${_arch}/share/"
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a'   -exec ${_arch}-strip -g {} \;
    popd
  done
}
