# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qttools

# For QQuickWidgetPlugin, add mingw-w64-qt5-declarative to dependencies (already present by default)
# For QWebViewPlugin, add mingw-w64-qt5-webkit to dependencies (mingw-w64-qt5-webkit is no longer updated)
# For QAxWidgetPlugin, add mingw-w64-qt5-activeqt to dependencies

# Note that static MySQL and PostgreSQL plugins are disabled because mariadb-connector-c and posgresql come with their own pthread
# implementation which has conflicting symbols with the pthread library Qt uses leading to errors like:
# /usr/lib/gcc/i686-w64-mingw32/8.2.0/../../../../i686-w64-mingw32/bin/ld: /usr/i686-w64-mingw32/lib/libpthread.a(libwinpthread_la-mutex.o):
# in function `pthread_mutex_lock': /build/mingw-w64-winpthreads/src/mingw-w64-v6.0.0/mingw-w64-libraries/winpthreads/src/mutex.c:187:
# multiple definition of `pthread_mutex_lock'; /usr/i686-w64-mingw32/lib/libpq.a(pthread-win32.o):(.text+0x70): first defined here

_qt_module=qttools
pkgname=mingw-w64-qt5-tools
pkgver=5.15.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A cross-platform application and UI framework (Development Tools, QtHelp; mingw-w64)"
depends=('mingw-w64-qt5-declarative')
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' 'mingw-w64-postgresql' 'mingw-w64-mariadb-connector-c' 'mingw-w64-vulkan-headers')
license=('GPL3' 'LGPL3' 'FDL' 'custom')
options=('!strip' '!buildflags' 'staticlibs')
groups=('mingw-w64-qt5')
url='https://www.qt.io/'
_pkgfqn="${_qt_module}-everywhere-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Fix-linguist-macro.patch')
sha256sums=('c189d0ce1ff7c739db9a3ace52ac3e24cb8fd6dbf234e49f075249b38f43c1cc'
            'e2ce8a553c78fd0dc6934be7d58a9bb90fe465619ac20a567d579c4c90bc01ab')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

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
      ${_arch}-qmake-qt5 ../${_qt_module}.pro ${_config} ${_additional_qmake_args}
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

      # remove '.static.prl' files
      find "${pkgdir}/usr/${_arch}" -name '.static.prl' -delete

      find "${pkgdir}/usr/${_arch}/lib" -maxdepth 1 -name '*.dll' -delete
      [ "$NO_STATIC_EXECUTABLES" -a "${_config##*=}" = static -o "$NO_EXECUTABLES" ] && \
        find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete || \
        find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
      find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
      find "${pkgdir}/usr/${_arch}" \( -name '*.a' -not -name 'libQt5QmlDevTools.a' -not -name 'libQt5Bootstrap.a' \) -exec ${_arch}-strip -g {} \;
      [[ -d "${pkgdir}/usr/${_arch}/lib/qt/bin/" ]] && \
        find "${pkgdir}/usr/${_arch}/lib/qt/bin/" -exec strip --strip-all {} \;
      find "${pkgdir}/usr/${_arch}/lib/" -iname "*.so.$pkgver" -exec strip --strip-unneeded {} \;

      # create symlinks for tools
      mkdir -p "${pkgdir}/usr/bin"
      for tool in lconvert lupdate lrelease windeployqt; do
        ln -sf "../${_arch}/lib/qt/bin/${tool}" "${pkgdir}/usr/bin/${_arch}-$tool-qt5"
      done
      popd
    done

    # drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "${pkgdir}/usr/${_arch}/lib" -type f -name '*.prl' -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
  done

  # make sure the executables don't conflict with their mingw-qt4 counterpart
  for _arch in ${_architectures}; do
    for exe_file in "${pkgdir}/usr/${_arch}/bin/"*.exe; do
      [[ -f $exe_file ]] && mv "${exe_file}" "${exe_file%.exe}-qt5.exe"
    done
    # Fix the path to executables in cmake config files
    sed -i "s|lib/qt/bin/qcollectiongenerator|bin/qcollectiongenerator-qt5.exe|g" "${pkgdir}"/usr/${_arch}/lib/cmake/Qt5Help/Qt5HelpConfigExtras.cmake
    sed -i "s|lib/qt/bin/qhelpgenerator|bin/qhelpgenerator-qt5.exe|g" "${pkgdir}"/usr/${_arch}/lib/cmake/Qt5Help/Qt5HelpConfigExtras.cmake
  done
}
