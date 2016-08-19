# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: jellysheep <max.mail@dameweb.de>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# There currently three variants of the package:
# - mingw-w64-qt5-base: includes dynamic libs only, using native OpenGL
# - mingw-w64-qt5-base-angle: includes dynamic libs only, using ANGLE, conflicts with OpenGL version
# - mingw-w64-qt5-base-static: includes static libs only, relies on mingw-w64-qt5-base for headers and tools

# By default CMake and qmake will link against the dynamic libary.

# To use the static variant with CMake set the following variable before calling find_package for finding a Qt module:
#  set(USE_STATIC_QT_BUILD ON)
# To use a static plugin, add the corresponding imported target, eg.
#  target_link_libraries(target ... Qt5::QWindowsIntegrationPlugin)
# Automatically importing static plugins is currently not possible, though. Hence it is required to use Q_IMPORT_PLUGIN, eg.
#  #include<QtPlugin>
#  Q_IMPORT_PLUGIN(QWindowsIntegrationPlugin)

# To use the static variant with qmake set the following variables (either inside the *.pro file or as qmake argument):
#  CONFIG+=static

# Further Qt modules (those not found in the base repository and hence not included in this package) include by default
# static and dynamic libraries; if only one version is requried, just
# set $NO_STATIC_LIBS or $NO_SHARED_LIBS.

# By default, executables will not be removed because I find them useful when testing. To remove executables
# set $NO_EXECUTABLES or $NO_STATIC_EXECUTABLES to remove statically linked executables only.
# However, if Qt modules containing tools are built as static and as dynamic library only the dynamically linked
# tools will be present in the package.

# Qt packages can be built in the following order (for example):
#  qt5-base qt5-declarative qt5-tools qt5-xmlpatterns qt5-script qt5-location qt5-multimedia qt5-sensors qt5-webchannel qt5-3d qt5-imageformats qt5-quickcontrols qt5-quickcontrols2 qt5-translations qt5-svg qt5-websockets qt5-winextras qt5-serialport qt5-canvas3d qt5-connectivity qt5-charts qt5-gamepad qt5-scxml qt5-datavis3s qt5-virtualkeyboard qt5-activeqt qt5-webkit

# Helper functions for the split builds
isStatic() {
  [[ $pkgname = "mingw-w64-qt5-base-static" ]] || \
   [[ $pkgname == 'mingw-w64-qt5-base-angle-static' ]] || \
   [[ $pkgname == 'mingw-w64-qt5-base-noopengl-static' ]]
}
isOpenGL() {
  [[ $pkgname = "mingw-w64-qt5-base" ]] || [[ $pkgname = "mingw-w64-qt5-base-static" ]]
}
isANGLE() {
  [[ $pkgname == 'mingw-w64-qt5-base-angle' ]] || [[ $pkgname == 'mingw-w64-qt5-base-angle-static' ]]
}
isNoOpenGL() {
  [[ $pkgname == 'mingw-w64-qt5-base-noopengl' ]] || [[ $pkgname == 'mingw-w64-qt5-base-noopengl-static' ]]
}

pkgname=mingw-w64-qt5-base
pkgver=5.7.0
pkgrel=4
pkgdesc="A cross-platform application and UI framework (mingw-w64)"
# the static variant doesn't contain any executables which need to be executed on the build machine
isStatic && arch=('any') || arch=('i686' 'x86_64')
url='https://www.qt.io/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-libdbus' 'mingw-w64-harfbuzz')
groups=('mingw-w64-qt' 'mingw-w64-qt5')
optdepends=('mingw-w64-postgresql-libs: PostgreSQL support' 'mingw-w64-mariadb-connector-c: MySQL support'
            'qtchooser')
makedepends=('mingw-w64-gcc' 'mingw-w64-postgresql-libs' 'mingw-w64-mariadb-connector-c' 'mingw-w64-pkg-config')
options=(!strip !buildflags staticlibs !emptydirs)
_pkgfqn="qtbase-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        "qt5-add-angle-support.patch"
        "qt5-use-external-angle-library.patch"
        "qt5-workaround-pkgconfig-install-issue.patch"
        "qt5-merge-static-and-shared-library-trees.patch"
        "qt5-fix-linking-against-static-pcre.patch"
        "qt5-rename-qtmain-to-qt5main.patch"
        "qt5-dont-build-host-libs-static.patch"
        "qt5-enable-rpath-for-host-tools.patch"
        "qt5-dont-add-resource-files-to-qmake-libs.patch"
        "qt5-prevent-debug-library-names-in-pkgconfig-files.patch"
        "qt5-fix-linking-against-static-dbus.patch"
        "qt5-use-win32-g++-mkspecs-profile.patch"
        "qt5-use-system-zlib-in-host-libs.patch"
        "qt5-fix-opengl-to-many-sections.patch"
        "qt5-fix-static-psql-mysql.patch"
        "qt5-fixes-from-mxe.patch"
        "qt5-fix-implib-ext.patch"
        "qt5-disable-default-lib-include-detection.patch"
        "qt5-win32-static-cmake-link-ws2_32-and--static.patch"
        "qt5-allow-usage-of-static-qt-with-cmake.patch"
        "qt5-customize-extensions-for-static-build.patch"
        "qt5-use-correct-pkg-config-static-flags.patch"
        "qt5-use-pkgconfig-for-harfbuzz.patch")
md5sums=('184f9460b40752d71b15b827260580c2'
         'bab00ccc19d888997f323c80354a7c3f'
         'f7e1487de6e85116d9c6bde2eac4fb73'
         'bc99c4cc6998295d76f37ed681c20d47'
         '370218fd439f25ab3f35bd1f14652988'
         '4fe6523dd1c34398df3aa5a8763530cc'
         'f32a768e1acb9785c79c8e93aa266db2'
         '3bd322551924543553a2bf81b4419a09'
         '30fa9ddf8d842b1392e8d63868940657'
         '99bb9f51ec684803768f36e407baf486'
         '6a6bc88f35ac8080869de39bc128ce5b'
         '261d9071a6af3f1d5c3f955da3781573'
         'f28edb1fe61c575522d3df814e680f9a'
         'c15d9f480d0248648fa52aeacb46e3c7'
         '612a4dfb9f1a3898a1920c28bb999159'
         'd0eb81aef1a21c65813fe4ddabbc4206'
         '1e8c03872062fe8499ed7786475ed4e0'
         '83139869355c2d46921adb25e47cf0fa'
         'b9565219e9252a17fc1b8fb9ee30662c'
         '20de722808e8a3fb684b0212bef8de46'
         '1dc792faa7761d8d7d2f17170da04d6b'
         '41ec67d9e5e70e0d6d93b42aebd0e12a'
         '61c0f9d0095c5a6dec8d14e9ec35a608'
         'bba65d27704cf36e148d8f18ad02ad15')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

isStatic && depends+=(${pkgname%-static})
isANGLE && depends+=('mingw-w64-angleproject')
if ! isOpenGL; then
  provides+=('mingw-w64-qt5-base')
  if isStatic; then
    conflicts+=('mingw-w64-qt5-base-static' 'mingw-w64-qt5-base-angle-static' 'mingw-w64-qt5-base-noopengl-static')
  else
    conflicts+=('mingw-w64-qt5-base' 'mingw-w64-qt5-base-angle' 'mingw-w64-qt5-base-noopengl')
  fi
fi

patch() {
  local input_found=
  local patch_file=
  for arg in $@; do
    if [[ $input_found ]]; then
      patch_file="$arg"
      break
    fi
    [[ $arg == -i ]] && input_found=1
  done
  msg2 "Applying patch $patch_file"
  /usr/bin/patch $@
}

prepare() {
  cd "${srcdir}/${_pkgfqn}"

  # include fixes from MXE
  patch -p1 -b -i ../qt5-fixes-from-mxe.patch

  if isANGLE; then
    # Add support for Angle
    patch -p1 -i ../qt5-add-angle-support.patch
    # Make sure our external Angle package is used instead of the bundled one
    patch -p1 -i ../qt5-use-external-angle-library.patch
  fi

  # Fix opengl to many sections error
  isOpenGL && patch -p0 -i ../qt5-fix-opengl-to-many-sections.patch

  # Make sure the .pc files of the Qt5 modules are installed correctly
  patch -p0 -i ../qt5-workaround-pkgconfig-install-issue.patch

  # Prevents resource files from being added to the LIBS parameter
  # This solves an issue where the generated pkg-config files contained
  # invalid Libs.private references like .obj/debug/Qt5Cored_resource_res.o
  patch -p1 -i ../qt5-dont-add-resource-files-to-qmake-libs.patch

  # qmake generates the pkgconfig .pc files two times, once for the
  # release build and once for the debug build (which we're not actually
  # building in this package). For both generations the exact same
  # pkgconfig file name is used. This causes references to the debug
  # build ending up in the .pc files which are unwanted
  # Prevent this from happening by giving the pkgconfig .pc
  # files for the debug build an unique file name
  patch -p1 -i ../qt5-prevent-debug-library-names-in-pkgconfig-files.patch

  # Fix linking against static DBus
  patch -p0 -i ../qt5-fix-linking-against-static-dbus.patch

  # Patch the win32-g++ mkspecs profile to match our environment
  patch -p0 -i ../qt5-use-win32-g++-mkspecs-profile.patch

  # Use pkgconfig for harfbzz dependency
  # (must be applied after qt5-use-win32-g++-mkspecs-profile.patch)
  patch -p0 -i ../qt5-use-pkgconfig-for-harfbuzz.patch

  # The bundled pcre is built as static library by default
  # As we're not using the bundled copy but our own copy
  # we need to do some fiddling to fix compilation issues
  # when trying to build static qmake projects
  patch -p1 -i ../qt5-fix-linking-against-static-pcre.patch

  # Make sure the qtmain (static) library doesn't conflict with the one
  # provided by the mingw-qt (qt4) package. The mkspecs profile is already
  # updated by patch100 to reflect this change
  # https://bugzilla.redhat.com/show_bug.cgi?id=1092465
  patch -p1 -i ../qt5-rename-qtmain-to-qt5main.patch

  # Upstream always wants the host libraries to be static instead of
  # shared libraries. This causes issues and is against the Fedora
  # packaging guidelines so disable this 'feature'
  patch -p0 -i ../qt5-dont-build-host-libs-static.patch

  # Build host tools with rpath enabled
  # We have to use rpath here as the library which the
  # various tools depend on (libQt5Bootstrap.so) resides
  # in the folder /usr/${_arch}/lib
  # We can't use the regular %%_libdir for this as we
  # want to avoid conflicts with the native qt5 packages
  patch -p1 -i ../qt5-enable-rpath-for-host-tools.patch

  # Build host libs with system zlib. This patch cannot be upstreamed as-is
  # due to the other host-libs patches.
  patch -p0 -i ../qt5-use-system-zlib-in-host-libs.patch

  # Determine the compiler's default include and lib directories at qmake time
  # see https://codereview.qt-project.org/#/c/157817
  patch -p1 -i ../qt5-disable-default-lib-include-detection.patch

  # Fix qmake to append .dll.a extension to import libs
  patch -p1 -i ../qt5-fix-implib-ext.patch

  # Allow use of static version via CMake
  patch -p0 -i ../qt5-win32-static-cmake-link-ws2_32-and--static.patch
  patch -p0 -i ../qt5-allow-usage-of-static-qt-with-cmake.patch

  # Allow installation of static Qt in the same prefix as the shared version
  patch -p0 -i ../qt5-merge-static-and-shared-library-trees.patch
  isStatic && patch -p0 -i ../qt5-customize-extensions-for-static-build.patch

  # Use correct pkg-config --static flag
  isStatic && patch -p1 -i ../qt5-use-correct-pkg-config-static-flags.patch

  # Fix detection of static mariadb client
  isStatic && patch -p0 -i ../qt5-fix-static-psql-mysql.patch

  # Make sure the Qt5 build system uses our external ANGLE library
  rm -rf src/3rdparty/angle include/QtANGLE/{EGL,GLES2,GLES3,KHR}

  # As well as our external PCRE library and zlib
  rm -rf src/3rdparty/{pcre,zlib}
}

build() {
  cd "${srcdir}/${_pkgfqn}"

  # Setup flags
  local mingw_flags='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4'
  export CFLAGS="$mingw_flags"
  export CXXFLAGS="$mingw_flags"
  unset LDFLAGS

  for _arch in ${_architectures}; do
    # Phonon is disabled for now because we lack the directx headers
    # The odd paths for the -hostbindir argument are on purpose
    # The qtchooser tool assumes that the tools 'qmake', 'moc' and others
    # are all available in the same folder with these exact file names
    # To prevent conflicts with the mingw-w64-qt4 package we have
    # to put these tools in a dedicated folder
    qt_configure_args="\
      -xplatform win32-g++ \
      -optimized-qmake \
      -verbose \
      -opensource \
      -confirm-license \
      -force-pkg-config \
      -force-debug-info \
      -audio-backend \
      -system-zlib \
      -system-libpng \
      -system-libjpeg \
      -system-sqlite \
      -system-harfbuzz \
      -no-fontconfig \
      -iconv \
      -openssl \
      -dbus-linked \
      -no-glib \
      -no-icu \
      -release \
      -nomake examples \
      -make tools \
      -hostprefix /usr/${_arch} \
      -hostdatadir /usr/${_arch}/lib/qt \
      -hostbindir /usr/${_arch}/lib/qt/bin \
      -prefix /usr/${_arch} \
      -bindir /usr/${_arch}/bin \
      -archdatadir /usr/${_arch}/lib/qt \
      -datadir /usr/${_arch}/share/qt \
      -docdir /usr/${_arch}/share/doc/qt \
      -examplesdir /usr/${_arch}/share/qt/examples \
      -headerdir /usr/${_arch}/include/qt \
      -libdir /usr/${_arch}/lib \
      -plugindir /usr/${_arch}/lib/qt/plugins \
      -sysconfdir /usr/${_arch}/etc \
      -translationdir /usr/${_arch}/share/qt/translations \
      -device-option CROSS_COMPILE=${_arch}-"

    # Fix include directory of dbus
    qt_configure_args+=" $(${_arch}-pkg-config --cflags-only-I dbus-1 --cflags)"

    # Configure usage of ANGLE/OpenGL
    if isOpenGL; then
      qt_configure_args+=' -opengl desktop'
    elif isNoOpenGL; then
      qt_configure_args+=' -no-opengl'
    else
      # GL_GLEXT_PROTOTYPES must be defined to enable declarations GLES functions
      qt_configure_args+=' -DGL_GLEXT_PROTOTYPES'
    fi
    # TODO: allow dynamic OpenGL configuration

    unset PKG_CONFIG_PATH

    # Fix MySQL
    if ! isStatic; then
      export QT_LFLAGS_MYSQL="-L/usr/${_arch}/lib -lmysql"
    fi
    # Qt doesn't detect mysql correctly, so use this:
    export QT_CFLAGS_MYSQL="-I/usr/${_arch}/include/mariadb"
    # Hardcode MySQL flags into configure (really nice solution :( )
    sed -e "s|^QT_CFLAGS_MYSQL=.*$|QT_CFLAGS_MYSQL=\"${QT_CFLAGS_MYSQL}\"|g" -i "${srcdir}/${_pkgfqn}/configure"
    sed -e "s|^QT_LFLAGS_MYSQL=.*$|QT_LFLAGS_MYSQL=\"${QT_LFLAGS_MYSQL}\"|g" -i "${srcdir}/${_pkgfqn}/configure"
    #sed -e "s|^QT_LFLAGS_MYSQL_R=.*$|QT_LFLAGS_MYSQL_R=\"${QT_LFLAGS_MYSQL_R}\"|g" -i "${srcdir}/${_pkgfqn}/configure"
    qt_configure_args_mysql="-mysql_config /this/file/should/not/exist"
    # TODO: test whether this workaround is still requried

    mkdir -p ../build-${_arch} && pushd ../build-${_arch}

    if isStatic; then
      ../${_pkgfqn}/configure -static $qt_configure_args $qt_configure_args_mysql
      make
    else
      # The LD_LIBRARY_PATH override is needed because libQt5Bootstrap* are shared
      # libraries which various compiled tools (like moc) use. As the libQt5Bootstrap*
      # libraries aren't installed at this point yet, we have to workaround this
      ../${_pkgfqn}/configure -shared $qt_configure_args $qt_configure_args_mysql
      LD_LIBRARY_PATH="$PWD/lib" LDFLAGS="-L$PWD/lib" make
    fi
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/${_pkgfqn}"
    make install -C ../build-${_arch} INSTALL_ROOT="${pkgdir}"

    if isStatic; then
      # The static release contains only the static libs itself but relies on the
      # shared release for Qt5Bootstrap library and tools (qmake, uic, ...)

      # Drop Qt5Bootstrap and libraries which are only provided as statically
      # and are hence already present in the shared version
      rm -f "${pkgdir}/usr/${_arch}/lib/"{lib,}qt5main* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5OpenGLExtensions* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5PlatformSupport* \
        "${pkgdir}/usr/${_arch}/lib/"libQt5Bootstrap*

      # Keep various Qt 5 plugins to be used in static builds
      pushd "${pkgdir}/usr/${_arch}/lib/" && ln -s "./qt/plugins/"*/*.a . && popd

      # Keep a couple pri files not found in base
      mv "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/modules/qt_plugin_"*.pri "${pkgdir}/usr/${_arch}"

      # remove CMake which are also in base
      find "${pkgdir}/usr/${_arch}/lib/cmake" -not -name "Static*.cmake" -exec rm {} \;

      # Delete duplicate files that are in the base package
      rm -fR "${pkgdir}/usr/${_arch}/"{include,share}
      rm -fR "${pkgdir}/usr/${_arch}/lib/"{qt/bin,qt/mkspecs}

      # Move pri files back
      mkdir -p "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/modules"
      mv "${pkgdir}/usr/${_arch}/"*.pri "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/modules"

    else # Shared release
      # The .dll's are installed in both bindir and libdir, one copy of the .dll's is sufficient
      find "${pkgdir}/usr/${_arch}/lib" -maxdepth 1 -name "*.dll" -exec rm {} \;

      # Add qtchooser support
      [[ ${_arch} == i686-w64-mingw32 ]] && mingwn='mingw32' || mingwn='mingw64'
      mkdir -p "${pkgdir}/etc/xdg/qtchooser"
      echo "/usr/${_arch}/lib/qt/bin" > "${pkgdir}/etc/xdg/qtchooser/$mingwn-qt5.conf"
      echo "/usr/${_arch}/lib" >> "${pkgdir}/etc/xdg/qtchooser/$mingwn-qt5.conf"

      # Create symlinks for tools
      mkdir -p "${pkgdir}/usr/bin"
      for tool in qmake moc rcc uic qdbuscpp2xml qdbusxml2cpp qdoc syncqt.pl; do
        ln -s "../${_arch}/lib/qt/bin/${tool}" "${pkgdir}/usr/bin/${_arch}-${tool}-qt5"
      done
    fi

    # Remove doc
    rm -rf "${pkgdir}/usr/${_arch}/share/doc"

    # Strip the binaries
    if ! isStatic; then
      strip --strip-all "${pkgdir}/usr/${_arch}/lib/qt/bin/"*[!.pl]
      strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/libQt5Bootstrap"{,DBus}.so.${pkgver}
    fi

    # Applications might be useful as well; keeping them by default will not hurt anybody I suppose
    if isStatic || [[ $NO_EXECUTABLES ]]; then
      find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec rm {} \;
    else
      find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec ${_arch}-strip --strip-all {} \;
    fi
    # No use for these files though
    find "${pkgdir}/usr/${_arch}" \( -name "*.bat" -o -name "*.def" -o -name "*.exp" \) -exec rm {} \;
    # Strip binaries
    find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name "*.a" -exec ${_arch}-strip -g {} \;
  done
}
