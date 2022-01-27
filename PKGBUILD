# $Id$
# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=mingw-w64-qca-qt5
pkgname=(mingw-w64-qca-qt5 mingw-w64-qca-qt6)
pkgver=2.3.4
pkgrel=1
pkgdesc='Qt Cryptographic Architecture (mingw-w64)'
arch=('any')
url='https://userbase.kde.org/QCA'
license=(LGPL)
makedepends=('mingw-w64-cmake' 'mingw-w64-qt5-base' 'mingw-w64-qt6-5compat' 'qt6-base' 'ninja')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://download.kde.org/stable/qca/$pkgver/qca-$pkgver.tar.xz{,.sig}
        0001-Avoid-calling-setChildProcessModifier-on-Windows.patch
	0002-Fix-types-in-socket-notifier-to-fix-x86_64-Windows-b.patch)
sha256sums=('6b695881a7e3fd95f73aaee6eaeab96f6ad17e515e9c2b3d4b3272d7862ff5c4'
            'SKIP' 'SKIP')
validpgpkeys=(CB9387521E1EE0127DA804843FDBB55084CC5D84) # Harald Sitter <sitter@kde.org>

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd qca-$pkgver
  for p in "$srcdir"/*.patch ; do
    patch -p1 -i "$p"
  done
}

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -G Ninja -B build-qt5-${_arch} -S qca-$pkgver \
      -DQCA_INSTALL_IN_QT_PREFIX=ON \
      -DBUILD_TESTS=OFF
    VERBOSE=1 cmake --build build-qt5-$_arch

    ${_arch}-cmake -G Ninja -B build-qt6-${_arch} -S qca-$pkgver \
      -DQT6=ON \
      -DQCA_INSTALL_IN_QT_PREFIX=ON \
      -DQCA_PREFIX_INSTALL_DIR=/usr/${_arch} \
      -DQCA_PLUGINS_INSTALL_DIR=/usr/${_arch}/lib/qt6/plugins \
      -DQCA_BINARY_INSTALL_DIR=/usr/${_arch}/lib/qt6/bin \
      -DQCA_LIBRARY_INSTALL_DIR=/usr/${_arch}/lib \
      -DQCA_FEATURE_INSTALL_DIR=/usr/${_arch}/lib/qt6/mkspecs/features \
      -DQCA_INCLUDE_INSTALL_DIR=/usr/${_arch}/include/qt6/Qca-qt6 \
      -DQCA_PRIVATE_INCLUDE_INSTALL_DIR=/usr/${_arch}/include/qt6/Qca-qt6 \
      -DQCA_DOC_INSTALL_DIR=/usr/${_arch}/share/doc \
      -DQCA_MAN_INSTALL_DIR=/usr/${_arch}/share/man \
      -DBUILD_TESTS=OFF
    VERBOSE=1 cmake --build build-qt6-$_arch
  done
}

_cleanup() {
  # strip binaries
  local _arch=$1
  find "${pkgdir}/usr/${_arch}/lib" -maxdepth 1 -name "*.dll" -exec rm {} \;
  [ "$NO_STATIC_EXECUTABLES" -a "${_config##*=}" = static -o "$NO_EXECUTABLES" ] && \
    find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec rm {} \; || \
    find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec ${_arch}-strip --strip-all {} \;
  find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
  find "${pkgdir}/usr/${_arch}" -name "*.a" -exec ${_arch}-strip -g {} \;
  [[ -d "${pkgdir}/usr/${_arch}/lib/"qt*/bin/ ]] && \
    find "${pkgdir}/usr/${_arch}/lib/"qt*/bin/ -exec strip --strip-all {} \;
  find "${pkgdir}/usr/${_arch}/lib/" -iname "*.so.$pkgver" -exec strip --strip-unneeded {} \;
  # remove manual
  rm -r "${pkgdir}/usr/${_arch}/share"
}

package_mingw-w64-qca-qt5() {
  depends=(mingw-w64-qt5-base)

  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-qt5-$_arch
    _cleanup $_arch
  done
}

package_mingw-w64-qca-qt6() {
  depends=(mingw-w64-qt6-5compat)

  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-qt6-$_arch
    _cleanup $_arch
  done
}
