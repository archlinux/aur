# Contributor: Miguel Rasero <skuda21@gmail.com>
# Contributor: Philip A Reimer <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

pkgname=mingw-w64-qt4
pkgver=4.8.7
pkgrel=2
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
arch=('i686' 'x86_64')
url="https://www.qt.io/"
license=('GPL3' 'LGPL')
depends=(
  'mingw-w64-crt'
  'mingw-w64-zlib'
  'mingw-w64-libjpeg-turbo'
  'mingw-w64-libiconv'
  'mingw-w64-libtiff'
  'mingw-w64-sqlite'
  'mingw-w64-libpng'
  'mingw-w64-openssl'
  'mingw-w64-dbus')
makedepends=('mingw-w64-gcc' 'mingw-w64-mariadb-connector-c' 'mingw-w64-postgresql' 'mingw-w64-pkg-config')
optdepends=('mingw-w64-postgresql: PostgreSQL driver'
            'mingw-w64-mariadb-connector-c: MariaDB driver')
options=(!strip !buildflags !libtool staticlibs)
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("http://download.qt.io/archive/qt/4.8/${pkgver}/${_pkgfqn}.tar.gz"
        'qmake.conf.win32'
        'qmake.conf.win64'
        'qplatformdefs.h'
        'qt-merge-static-and-shared-library-trees.patch'
        'mingw32-qt-4.8.0-no-webkit-tests.patch'
        'qt-dont-perform-ipc-checks-for-win32.patch'
        'qt-4.8.0-fix-include-windows-h.patch'
        'qt-4.8.0-build-qtuitools-dynamically.patch'
        'qt-fix-javascript-jit-on-mingw-x86_64.patch'
        'qt-4.8.1-fix-activeqt-compilation.patch'
        'qt-dont-set-qt-dll-define-for-static-builds.patch'
        'qt4-fix-linking-against-static-dbus.patch'
        'qt-everywhere-opensource-src-4.8.7-gcc6.patch'
         qt4-openssl-1.1.patch)
sha256sums=('e2882295097e47fe089f8ac741a95fef47e0a73a3f3cdf21b56990638f626ea0'
            '71f6e368bd7b14089d1e312f86970d1d5aa649b8e5c7f1f55b7381ec5d841755'
            '59d9355c66a810f56d56c3debc2c8f93412cea0e047f08745589e7a2492693e8'
            '73916d59566843f6b9ab8b9091a328b6443e09ca0478bb5c0f8a64777b69d4f5'
            '321603e3993efabc4dce5c4369d87ad407b7b95a6e63327a7e9ca832ee218666'
            '1e0eb85e1a88438ee1f99b5d27b775bf7d077bebf5de2e57fe831d0e39ce6df1'
            '08a98118a235681209848dfa204d9bf8a57248b58ad1670b5d1d42677c647cf2'
            '5e6a61ced784d7d24c65d81e769b67b8f6066a33581c8b17cdf374a4c723cd23'
            '21a36a92b988ed0054d07d97933d0392c4bbd651e005dab43257e0b0480a054c'
            'fba6cf2b0bd5f6229b21b1cf4adf093c216a10c97255527d71979599b7047be8'
            '4a758b90b2768cef4877ae1b5bafca69902b88633a18d5ec3d5c6bb0064510a5'
            '9a8ad8953e465a141b53e9b925eb0bcd34832b2fe88d6a5237fb3abcaa4fa1a5'
            '5f9286d16cce0a1b1585102074cc06007053751fe7e351773c173be768e6c957'
            'aaa073195b6fc47ebdc241574da4a29e7ba0a1ae51bdf9a64b866c683f30684a'
            'ff3ddb5428cd2ff243558dc0c75b35f470077e9204bbc989ddcba04c866c1b68')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

# Helper functions for the split builds
isRelease() {
  [ $pkgname = "mingw-w64-qt4" ]
}
isDebug() {
  [ $pkgname = "mingw-w64-qt4-debug" ]
}
isStatic() {
  [ $pkgname = "mingw-w64-qt4-static" ]
}
isShared() {
  ! isStatic
}

isDebug && depends+=('mingw-w64-qt4')
isStatic && depends+=('mingw-w64-qt4') && makedepends+=('mingw-w64-qt4-dummy')

prepare() {
  cd "${srcdir}"/"${_pkgfqn}"
  
  # When building Qt as static library some files have a different content
  # when compared to the static library. Merge those changes manually.
  # This patch also applies some additional changes which are required to make
  # linking against the static version of Qt work without any manual fiddling  
  patch -Np1 -i "${srcdir}"/qt-merge-static-and-shared-library-trees.patch

  # When linking against the static dbus library, the #define DBUS_EXPORT must be set
  patch -Np1 -i "${srcdir}"/qt4-fix-linking-against-static-dbus.patch

  # Disable WebKit tests that are failing (as of Qt 4.8.0 rc1) with
  # out of source builds.
  patch -Np1 -i "${srcdir}"/mingw32-qt-4.8.0-no-webkit-tests.patch

  # The configure script thinks that there is no IPC/shared memory support
  # for this platform, while there is support. Fix the configure script
  patch -Np0 -i "${srcdir}"/qt-dont-perform-ipc-checks-for-win32.patch

  # Fix compilation of the designer tool
  patch -Np1 -i "${srcdir}"/qt-4.8.0-fix-include-windows-h.patch

  # Make sure the QtUiTools are built as a shared library
  # https://bugreports.qt.nokia.com/browse/QTBUG-20498
  patch -Np1 -i "${srcdir}"/qt-4.8.0-build-qtuitools-dynamically.patch

  # Javascript-JIT fails to link on mingw x86_64
  patch -Np1 -i "${srcdir}"/qt-fix-javascript-jit-on-mingw-x86_64.patch

  # As of qt 4.8.1 the qt build system tries to build a activeqt module for
  # the designer component. However, this fails to compile:
  # In file included from ../../../../../include/ActiveQt/qaxselect.h:1:0,
  #                 from /home/erik/fedora/mingw-qt/qt-everywhere-opensource-src-4.8.1/tools/designer/src/plugins/activeqt/qaxwidgettaskmenu.cpp:55:
  # ../../../../../include/ActiveQt/../../../qt-everywhere-opensource-src-4.8.1/src/activeqt/container/qaxselect.h:47:26: fatal error: ui_qaxselect.h: No such file or directory
  # Workaround this for now until a proper fix has been found
  patch -Np1 -i "${srcdir}"/qt-4.8.1-fix-activeqt-compilation.patch

  # When building static binaries, make sure the gcc argument -DQT_DLL isn't used
  patch -Np1 -i "${srcdir}"/qt-dont-set-qt-dll-define-for-static-builds.patch

  # GCC 6
  patch -Np1 -i "${srcdir}"/qt-everywhere-opensource-src-4.8.7-gcc6.patch

  # Fix build with OpenSSL 1.1 (Debian + OpenMandriva)
  patch -p1 -i "$srcdir"/qt4-openssl-1.1.patch
  # qsslsocket_openssl_symbols.cpp:312:11: error: ‘_q_CRYPTO_free’ was not declared
  sed -i "123iDEFINEFUNC(void, CRYPTO_free, void *a, a, return, DUMMYARG)" src/network/ssl/qsslsocket_openssl_symbols.cpp

  # Cross-compilation qmake target.
  mkdir -p mkspecs/win32-g++-cross
  mkdir -p mkspecs/win32-g++-cross-x64
  install -m644 "${srcdir}"/qmake.conf.win32 mkspecs/win32-g++-cross/qmake.conf
  install -m644 "${srcdir}"/qmake.conf.win64 mkspecs/win32-g++-cross-x64/qmake.conf
  install -m644 "${srcdir}"/qplatformdefs.h mkspecs/win32-g++-cross/
  install -m644 "${srcdir}"/qplatformdefs.h mkspecs/win32-g++-cross-x64/
  
  # MySQL lib is -lmysql not mysqlclient, so fix that in config tests
  sed -e 's|lmysqlclient_r|lmysql|g' -i "${srcdir}/${_pkgfqn}/config.tests/unix/mysql_r/mysql_r.pro"
  sed -e 's|lmysqlclient|lmysql|g' -i "${srcdir}/${_pkgfqn}/config.tests/unix/mysql/mysql.pro"
  # fix configure to not fails in case you have system's libmariadbclient installed
  sed -e "s|mysql_config|mysql_config_doesnt_exists|g" -i "${srcdir}/${_pkgfqn}/configure"
}

build() {
  cd "${srcdir}"/"${_pkgfqn}"

  # Setup flags
  export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CPLUS_INCLUDE_PATH="/usr/i686-w64-mingw32/include/mysql"
  unset LDFLAGS PKG_CONFIG_PATH

  # workaround for class std::auto_ptr' is deprecated with gcc-6
  export CXXFLAGS="$CXXFLAGS -std=gnu++98 -Wno-deprecated"

  for _arch in ${_architectures}; do

    if [ ${_arch} = 'i686-w64-mingw32' ]; then
      platform='win32-g++-cross'
    else
      platform='win32-g++-cross-x64'
    fi

    qt_configure_args="\
      -qt3support \
      -optimized-qmake \
      -verbose \
      -opensource \
      -exceptions \
      -fast \
      -confirm-license \
      -force-pkg-config \
      -little-endian \
      -xmlpatterns \
      -multimedia \
      -audio-backend \
      -webkit \
      -script \
      -scripttools \
      -declarative \
      -no-phonon \
      -javascript-jit \
      -qt-libmng \
      -system-zlib \
      -system-libtiff \
      -system-libpng \
      -system-libjpeg \
      -system-sqlite \
      -iconv \
      -openssl \
      -dbus-linked \
      -make libs \
      -make tools \
      -nomake demos \
      -nomake docs \
      -nomake examples \
      -prefix /usr/${_arch} \
      -plugin-sql-psql \
      -plugin-sql-mysql \
      -bindir /usr/${_arch}/bin \
      -datadir /usr/${_arch}/share/qt4 \
      -demosdir /usr/${_arch}/share/qt4/demos \
      -docdir /usr/${_arch}/share/doc/qt4 \
      -examplesdir /usr/${_arch}/share/qt4/examples \
      -headerdir /usr/${_arch}/include \
      -libdir /usr/${_arch}/lib \
      -plugindir /usr/${_arch}/lib/qt4/plugins \
      -sysconfdir /usr/${_arch}/etc \
      -translationdir /usr/${_arch}/share/qt4/translations \
      -xplatform ${platform}"

    if isStatic; then
      mkdir -p ../${_arch}-static
      pushd ../${_arch}-static
      ../${_pkgfqn}/configure \
        -release \
        -static \
        $qt_configure_args
      make
      popd
    fi

    if isDebug; then
      mkdir -p ../${_arch}-debug
      pushd ../${_arch}-debug
      ../${_pkgfqn}/configure \
        -debug \
        -shared \
        $qt_configure_args
      make
      popd
    fi

    if isRelease; then
      mkdir -p ../${_arch}
      pushd ../${_arch}
      ../${_pkgfqn}/configure \
        -release \
        -shared \
        $qt_configure_args
      make
      popd
    fi
  
  done
}

package() {
  cd "$srcdir"/"${_pkgfqn}"

  for _arch in ${_architectures}; do

    if [ ${_arch} = 'i686-w64-mingw32' ]; then
      platform='win32-g++-cross'
    else
      platform='win32-g++-cross-x64'
    fi

    if isRelease; then
      make install -C ../${_arch} INSTALL_ROOT="${pkgdir}"
      # Also install the lrelease tool
      make -C ../${_arch}/tools/linguist/lrelease install INSTALL_ROOT="${pkgdir}"
      # move QtUiTools4.dll from lib/ to bin/
      mv "${pkgdir}"/usr/${_arch}/lib/QtUiTools4.dll "${pkgdir}"/usr/${_arch}/bin/
      # add links with version suffix for convenience
      ln -s libqtmain.a "${pkgdir}"/usr/${_arch}/lib/libqtmain4.a

      # install qmake and other native tools
      mkdir -p "${pkgdir}"/usr/bin
      mkdir -p "${pkgdir}"/usr/${_arch}/bin

      install -m0755 ../${_arch}/bin/qmake "${pkgdir}"/usr/${_arch}/bin
      ln -s ../${_arch}/bin/qmake "${pkgdir}"/usr/bin/${_arch}-qmake

      for tool in lrelease moc rcc uic ; do
        ln -s ../${_arch}/bin/$tool "${pkgdir}"/usr/bin/${_arch}-$tool
      done

      # An argument in the mkspecs profile needs to be un-commented in order to be
      # useful for developers who wish to use the Qt libraries
      sed -i s@'#QT_LIBINFIX'@'QT_LIBINFIX'@ "${pkgdir}"/usr/${_arch}/share/qt4/mkspecs/${platform}/qmake.conf

      # Remove some duplicate mkspecs data
      rm -rf "${pkgdir}"/usr/${_arch}/share/qt4/mkspecs/${platform}/default
      rm -rf "${pkgdir}"/usr/${_arch}/share/qt4/mkspecs/${platform}/${platform}

      # Workaround a bug where building against the debug binaries will always fail:
      # https://bugreports.qt.nokia.com/browse/QTBUG-14467
      sed -i s@'$${QT_LIBINFIX}d'@'d$${QT_LIBINFIX}'@ "${pkgdir}"/usr/${_arch}/share/qt4/mkspecs/features/win32/windows.prf
      sed -i s@'$${QT_LIBINFIX}d'@'d$${QT_LIBINFIX}'@ "${pkgdir}"/usr/${_arch}/share/qt4/mkspecs/features/qt_functions.prf

      # xmlpatterns.exe, xmlpatternsvalidator.exe conflict with qt5 ones
      mv "${pkgdir}"/usr/${_arch}/bin/xmlpatterns.exe "${pkgdir}"/usr/${_arch}/bin/xmlpatterns-qt4.exe
      mv "${pkgdir}"/usr/${_arch}/bin/xmlpatternsvalidator.exe "${pkgdir}"/usr/${_arch}/bin/xmlpatternsvalidator-qt4.exe
    fi

    if isDebug; then
      make install -C ../${_arch}-debug INSTALL_ROOT="${pkgdir}"
      # Drop the debug version of the tool qmlplugindumpd.exe
      rm -f "${pkgdir}"/usr/${_arch}/bin/qmlplugindumpd.exe
      # add links with version suffix for convenience
      ln -s libqtmaind.a "${pkgdir}"/usr/${_arch}/lib/libqtmaind4.a
      
      # Remove debug binaries, includes, data, ...
      rm -rf "${pkgdir}"/usr/${_arch}/{bin/*.exe,include,share,imports/{Qt/labs/*/qmldir,QtWebKit/qmldir}}
      # tools are installed in the release build
      rm -f "${pkgdir}"/usr/${_arch}/bin/{lrelease,moc,qmake,rcc,uic}
      # qaxwidget plugin is named the same in debug and release versions, so remove it
      rm -f "${pkgdir}"/usr/${_arch}/lib/qt4/plugins/designer/qaxwidget.dll
    fi

    if isStatic; then
      # Install the static libraries in a temporary prefix so we can merge everything together properly
      make install -C ../${_arch}-static INSTALL_ROOT="${pkgdir}"

      # Drop the qtmain static library from the static tree as
      # it's already part of the main tree
      rm -f "${pkgdir}"/usr/${_arch}/lib/libqtmain*

      # Give the real static libraries the correct filename to avoid future conflicts with Qt5
      for FN in "${pkgdir}"/usr/${_arch}/lib/*.a ; do
        FN_NEW=$(echo $FN | sed s/'.a$'/'4.a'/)
        mv $FN $FN_NEW
      done

      # Delete files already provided by the base package
      rm -rf "${pkgdir}"/usr/${_arch}/{bin,include,share,lib/pkgconfig}
      rm -f  "${pkgdir}"/usr/${_arch}/imports/Qt/labs/*/qmldir
      # I'm assuming these prl files aren't needed
      rm -f  "${pkgdir}"/usr/${_arch}/{lib,lib/qt4/plugins/*,imports/Qt/labs/*}/*.prl

      # Move imports to lib/qt4, just like the plugins
      mv "${pkgdir}"/usr/${_arch}/imports "${pkgdir}"/usr/${_arch}/lib/qt4/
    fi

    if isShared; then

      # Remove the ActiveQt pieces from the shared build as they aren't build as shared library so
      # it's good enough to only bundle the static libraries originating from the static build
      rm -f "${pkgdir}"/usr/${_arch}/lib/libQAx*

      # Rename the .a files to .dll.a as they're actually import libraries and not static libraries
      for FN in "${pkgdir}"/usr/${_arch}/lib/*.a ; do
          # Ignore libqtmain*.a
          echo $FN | grep -q qtmain && continue
          # Rename the file
          FN_NEW=$(echo $FN | sed s/'.a$'/'.dll.a'/)
          mv $FN $FN_NEW
      done

      # The .dll's are installed in both bindir and libdir
      # One copy of the .dll's is sufficient
      rm -f "${pkgdir}"/usr/${_arch}/lib/*.dll

      # Drop all the files which we don't need
      rm -f  "${pkgdir}"/usr/${_arch}/lib/*.prl
      rm -rf "${pkgdir}"/usr/${_arch}/share/qt4/q3porting.xml
      rm -rf "${pkgdir}"/usr/${_arch}/share/qt4/phrasebooks/

      # Move imports to lib/qt4, just like the plugins
      mv "${pkgdir}"/usr/${_arch}/imports "${pkgdir}"/usr/${_arch}/lib/qt4/
    fi

    # And finaly, strip the binaries
    if isRelease; then
      ${_arch}-strip --strip-all "${pkgdir}"/usr/${_arch}/bin/*.exe
      ${_arch}-strip --strip-debug "${pkgdir}"/usr/${_arch}/lib/*.a
      ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
      ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/lib/qt4/plugins/*/*.dll
      ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/lib/qt4/imports/Qt/labs/*/*.dll
      ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/lib/qt4/imports/QtWebKit/*.dll
    fi
    if isStatic; then
      ${_arch}-strip --strip-debug "${pkgdir}"/usr/${_arch}/lib/*.a
      ${_arch}-strip --strip-debug "${pkgdir}"/usr/${_arch}/lib/qt4/plugins/*/*.a
      ${_arch}-strip --strip-debug "${pkgdir}"/usr/${_arch}/lib/qt4/imports/Qt/labs/*/*.a
    fi
    
  done
}
