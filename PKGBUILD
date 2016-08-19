# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ohmyarch

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# Includes dynamic and static versions; if only one version is requried, just
# set $NO_STATIC_LIBS or $NO_SHARED_LIBS.

_qt_module=qtdeclarative
pkgname=mingw-w64-qt5-declarative
pkgver=5.7.0
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Classes for QML and JavaScript languages (mingw-w64)"
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-gcc' 'python')
options=(!strip !buildflags staticlibs)
groups=(mingw-w64-qt mingw-w64-qt5)
license=('GPL3' 'LGPL3' 'FDL' 'custom')
url="https://www.qt.io/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        "qt5-build-qmldevtools-as-shared-library.patch"
        "qt5-declarative-gcc6.patch")
md5sums=('0d9e461aa54dba4793253fa2eb501f9b'
         '8f90ec8c2379b85de0b04847865b230c'
         'fb2a2a118b356a0a4635111f2e0b0ee6')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
[[ $NO_STATIC_LIBS ]] || \
  makedepends+=('mingw-w64-qt5-base-static') \
  optdepends+=('mingw-w64-qt5-base-static: use of static libraries') \
  _configurations+=('CONFIG+=static')
[[ $NO_SHARED_LIBS ]] || \
  _configurations+=('CONFIG+=shared')

prepare() {
  cd "${srcdir}/${_pkgfqn}"

  # Build native/non-cross library Qt5QmlDevTools as shared library
  patch -p1 -i "${srcdir}"/qt5-build-qmldevtools-as-shared-library.patch

  # Fix i686 segfaults with GCC 6 https://bugreports.qt.io/browse/QTBUG-52057 (Fedora patch)
  patch -p1 -i "${srcdir}"/qt5-declarative-gcc6.patch
}

build() {
  cd "${srcdir}/${_pkgfqn}"
  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      msg2 "Building ${_config##*=} version for ${_arch}"
      mkdir -p build-${_arch}-${_config##*=} && pushd build-${_arch}-${_config##*=}
      ${_arch}-qmake-qt5 ../${_qt_module}.pro ${_config}

      # Search paths for host standard library (/usr/lib) and for Qt5Bootstrap (/usr/$_arch/lib) are not set correctly by qmake
      # hence we need insert those paths manually
      make qmake_all
      find ./src/qmldevtools -type f -iname 'Makefile' -exec sed -i "s|-L/usr/$_arch/lib -lQt5Bootstrap|-L/usr/lib -L/usr/$_arch/lib -lQt5Bootstrap|g" {} \;
      find . -type f -iname 'Makefile' -exec sed -i "s|-L$PWD/lib -L/usr/$_arch/lib -lQt5Bootstrap|-L/usr/lib -L$PWD/lib -L/usr/$_arch/lib -lQt5Bootstrap|g" {} \;
      find . -type f -iname 'Makefile' -exec sed -i "s|-L$PWD/lib -lQt5QmlDevTools|-L/usr/lib -L$PWD/lib -L/usr/$_arch/lib -lQt5QmlDevTools|g" {} \;

      make
      popd
    done
  done
}

package() {
  cd "${srcdir}/${_pkgfqn}"
  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      pushd build-${_arch}-${_config##*=}
      make INSTALL_ROOT="$pkgdir" install
      find "${pkgdir}/usr/${_arch}/lib" -maxdepth 1 -name "*.dll" -exec rm {} \;
      [ "$NO_STATIC_EXECUTABLES" -a "${_config##*=}" = static -o "$NO_EXECUTABLES" ] && \
        find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec rm {} \; || \
        find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec ${_arch}-strip --strip-all {} \;
      find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
      find "${pkgdir}/usr/${_arch}" -name "*.a" -exec ${_arch}-strip -g {} \;
      [[ -d "${pkgdir}/usr/${_arch}/lib/qt/bin/" ]] && \
        find "${pkgdir}/usr/${_arch}/lib/qt/bin/" -exec strip --strip-all {} \;
      find "${pkgdir}/usr/${_arch}/lib/" -iname "*.so.$pkgver" -exec strip --strip-unneeded {} \;
      popd
    done
  done

  # Make sure the executables don't conflict with their mingw-qt4 counterpart
  # Actually only qmlplugindump.exe conflicts, but for consistency all executables
  # will be suffixed.
  for _arch in ${_architectures}; do
    for exe_file in "${pkgdir}/usr/${_arch}/bin/"*.exe; do
      [[ -f $exe_file ]] && mv "${exe_file}" "${exe_file%.exe}-qt5.exe"
    done
  done
}
