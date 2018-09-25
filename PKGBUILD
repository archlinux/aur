# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ohmyarch

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# Includes dynamic and static versions; if only one version is requried, just
# set $NO_STATIC_LIBS or $NO_SHARED_LIBS.

# All patches are managed at https://github.com/Martchus/qtdeclarative

_qt_module=qtdeclarative
pkgname=mingw-w64-qt5-declarative
pkgver=5.11.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Classes for QML and JavaScript languages (mingw-w64)'
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' 'python')
options=('!strip' '!buildflags' 'staticlibs')
groups=('mingw-w64-qt5')
license=('GPL3' 'LGPL3' 'FDL' 'custom')
url='https://www.qt.io/'
_pkgfqn="${_qt_module}-everywhere-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Ensure-QML-dev-tools-is-built-as-static-library.patch'
        '0002-Ensure-static-plugins-are-exported.patch'
        '0003-Prevent-exporting-QML-parser-symbols-on-static-build.patch')
sha256sums=('220d86f8031e9d45f3c369c3fd517aaa4c5783ad62c843a21fa7cc3c0a36f2cd'
            '4544a494437fd73a17053738d38bbd857a081846ad2cd4db0047706961aa4cee'
            '4d5799f9cc322ba5379b3e7ec57ead3001e1dbd2bc6b9d225e6fb1d8a9b4cab6'
            'e390fc1f78f9e752f6f41bd2f15a7470c6359b21954e08c9bfba89514f7a89d5')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
[[ $NO_STATIC_LIBS ]] || \
  makedepends+=('mingw-w64-qt5-base-static') \
  optdepends+=('mingw-w64-qt5-base-static: use of static libraries') \
  _configurations+=('CONFIG+=no_smart_library_merge CONFIG+=static')
[[ $NO_SHARED_LIBS ]] || \
  _configurations+=('CONFIG+=actually_a_shared_build CONFIG+=shared')

prepare() {
  cd "${srcdir}/${_pkgfqn}"

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    patch -p1 -i "$patch"
  done
}

build() {
  cd "${srcdir}/${_pkgfqn}"
  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      msg2 "Building ${_config##*=} version for ${_arch}"
      mkdir -p build-${_arch}-${_config##*=} && pushd build-${_arch}-${_config##*=}
      ${_arch}-qmake-qt5 ../${_qt_module}.pro ${_config}

      # search paths for host standard library (/usr/lib) and for Qt5Bootstrap (/usr/$_arch/lib) are not set correctly by qmake
      # hence we need insert those paths manually
      make qmake_all
      find ./src/qmldevtools -type f -iname 'Makefile' -exec sed -i "s|-L/usr/$_arch/lib -lQt5Bootstrap|-L/usr/lib /usr/$_arch/lib/libQt5Bootstrap.so|g" {} \;
      find . -type f -iname 'Makefile' -exec sed -i "s|-L$PWD/lib -L/usr/$_arch/lib -lQt5Bootstrap|-L/usr/lib -L$PWD/lib /usr/$_arch/lib/libQt5Bootstrap.so|g" {} \;
      find . -type f -iname 'Makefile' -exec sed -i "s|-L/usr/$_arch/lib -lQt5Bootstrap|-L/usr/lib /usr/$_arch/lib/libQt5Bootstrap.so|g" {} \;
      #[ ${_config##*=} == 'shared' ] && local _ext='so' || local _ext='a'
      local _ext='a'
      find . -type f -iname 'Makefile' -exec sed -i "s|-L$PWD/lib -lQt5QmlDevTools|-L/usr/lib -L$PWD/lib ${srcdir}/${_pkgfqn}/build-${_arch}-${_config##*=}/lib/libQt5QmlDevTools.${_ext}|g" {} \;
      find . -type f -iname 'Makefile' -exec sed -i "s|-lQt5QmlDevTools|-L/usr/lib ${srcdir}/${_pkgfqn}/build-${_arch}-${_config##*=}/lib/libQt5QmlDevTools.${_ext}|g" {} \;
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

      # use prl files from build directory since installed prl files seem to have incorrect QMAKE_PRL_LIBS_FOR_CMAKE
      if [[ -d 'lib' ]]; then
        pushd 'lib'
        find -iname '*.static.prl' -exec cp --target-directory "${pkgdir}/usr/${_arch}/lib" --parents {} +
        popd
      fi
      if [[ -d 'plugins' ]]; then
        pushd 'plugins'
        find -iname '*.static.prl' -exec cp --target-directory "${pkgdir}/usr/${_arch}/lib/qt/plugins" --parents {} +
        popd
      fi

      # replace library path in *.prl files so it points to the installed location and not the build directory
      find "${pkgdir}/usr/${_arch}/lib" \( -type f -name '*.prl' -o -name '*.pc' \) -exec sed -i -e "s:$PWD/lib:/usr/$_arch/lib:g" {} \;

      # remove prl files for debug version
      if ! [[ $MINGW_W64_QT_DEBUG_BUILD ]]; then
        for file in $(find "${pkgdir}/usr/${_arch}" -name '*d.prl' -o -name '*d.static.prl'); do
          [ -f "${file%d*}${file##*d}" ] && rm "${file}";
        done
      fi

      find "${pkgdir}/usr/${_arch}/lib" -maxdepth 1 -name '*.dll' -delete
      [ "$NO_STATIC_EXECUTABLES" -a "${_config##*=}" = static -o "$NO_EXECUTABLES" ] && \
        find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete || \
        find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
      find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
      find "${pkgdir}/usr/${_arch}" \( -name '*.a' -not -name 'libQt5QmlDevTools.a' -not -name 'libQt5Bootstrap.a' \) -exec ${_arch}-strip -g {} \;
      [[ -d "${pkgdir}/usr/${_arch}/lib/qt/bin/" ]] && \
        find "${pkgdir}/usr/${_arch}/lib/qt/bin/" -exec strip --strip-all {} \;
      find "${pkgdir}/usr/${_arch}/lib/" -iname "*.so.$pkgver" -exec strip --strip-unneeded {} \;
      popd
    done

    # strip native static libraries
    find "${pkgdir}/usr/${_arch}" -name 'libQt5QmlDevTools.a' -exec strip -g {} \;

    # drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "${pkgdir}/usr/${_arch}/lib" -type f -name '*.prl' -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
  done

  # make sure the executables don't conflict with their mingw-qt4 counterpart
  # (Actually only qmlplugindump.exe conflicts, but for consistency all executables
  #  will be suffixed.)
  for _arch in ${_architectures}; do
    for exe_file in "${pkgdir}/usr/${_arch}/bin/"*.exe; do
      [[ -f $exe_file ]] && mv "${exe_file}" "${exe_file%.exe}-qt5.exe"
    done
  done
}
