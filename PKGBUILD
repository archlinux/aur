# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: jellysheep <max.mail@dameweb.de>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# All patches are managed at https://github.com/Martchus/qtbase

# There are different variants of the package which can be selected by simply adjusting pkgname:
# - mingw-w64-qt5-base or mingw-w64-qt5-base-opengl: using native OpenGL
# - mingw-w64-qt5-base-angle: using ANGLE rather than native OpenGL
# - mingw-w64-qt5-base-dynamic: allows choosing between ANGLE and native OpenGL dynamically at runtime
# - mingw-w64-qt5-base-noopenql: no OpenGL support
# The variants are conflicting (and hence can not be installed at the same time).
# See also: http://doc.qt.io/qt-5/windows-requirements.html#dynamically-loading-graphics-drivers

# The variants listed above only contain dynamic libraries. For building static libraries
# just append '-static' to the package name, eg. mingw-w64-qt5-base-static or mingw-w64-qt5-base-angle-static.
# The static variants rely on the corresponding dynamic variant for headers and tools.
# I only tested the static version using native OpenGL so far (mingw-w64-qt5-base-static).
# Note that ANGLE will still be loaded as dynamic library in mingw-w64-qt5-base-dynamic-static.

# By default CMake and qmake will link against the dynamic Qt libraries.

# To use the static Qt libraries with CMake prefix the Qt module with Static:
#  eg. find_package(Qt5Core) becomes find_package(StaticQt5Core)
# To use a static module, add the corresponding imported target, eg.
#  target_link_libraries(target ... Qt5::static::Core)
# This approach allows installing dynamic and static Qt in the same prefix and using
# both variants in the same CMake project.

# To use a static plugin, add the corresponding imported target, eg.
#  target_link_libraries(target ... Qt5::static::QWindowsIntegrationPlugin)
# Automatically importing static plugins is currently not possible, though. Hence it is required to use Q_IMPORT_PLUGIN, eg.
#  #include<QtPlugin>
#  Q_IMPORT_PLUGIN(QWindowsIntegrationPlugin)

# To use the static Qt libraries with qmake set the following variables (either inside the *.pro file or as qmake argument):
#  CONFIG+=static

# Further Qt modules (those not found in the base repository and hence not included in this package) include by default
# static and dynamic libraries; if only one version is requried, just set $NO_STATIC_LIBS or $NO_SHARED_LIBS when building
# the package.

# By default, executables will not be removed because I find them useful when testing. To remove executables
# set $NO_EXECUTABLES (or $NO_STATIC_EXECUTABLES to remove statically linked executables only) when building the package.
# If Qt modules containing tools are built as static and as dynamic library only the dynamically linked tools will be present
# in the package.

# Qt packages can be built in the following order (for example):
#  qt5-base qt5-base-static qt5-declarative qt5-tools qt5-xmlpatterns qt5-script qt5-location qt5-multimedia qt5-sensors qt5-webchannel qt5-3d qt5-imageformats qt5-quickcontrols qt5-quickcontrols2 qt5-translations qt5-svg qt5-websockets qt5-winextras qt5-serialport qt5-canvas3d qt5-connectivity qt5-charts qt5-gamepad qt5-scxml qt5-datavis3s qt5-virtualkeyboard qt5-activeqt qt5-webkit

# Helper functions for the split builds
isDefault() {
  [[ $pkgname = 'mingw-w64-qt5-base' ]] || [[ $pkgname = 'mingw-w64-qt5-base-static' ]]
}
isStatic() {
  [ "${pkgname##*-}" = 'static' ]
}
isOpenGL() {
  # Currently use native OpenGL by default
  isDefault || \
  [[ $pkgname = 'mingw-w64-qt5-base-opengl' ]] || [[ $pkgname = 'mingw-w64-qt5-base-opengl-static' ]]
}
isANGLE() {
  [[ $pkgname = 'mingw-w64-qt5-base-angle' ]] || [[ $pkgname = 'mingw-w64-qt5-base-angle-static' ]] || \
  [[ $pkgname = 'mingw-w64-qt5-base-dynamic' ]] || [[ $pkgname = 'mingw-w64-qt5-base-dynamic-static' ]]
  # Treat dynamic version like ANGLE version, correct?
}
isDynamic() {
  [[ $pkgname = 'mingw-w64-qt5-base-dynamic' ]] || [[ $pkgname = 'mingw-w64-qt5-base-dynamic-static' ]]
}
isNoOpenGL() {
  [[ $pkgname = 'mingw-w64-qt5-base-noopengl' ]] || [[ $pkgname = 'mingw-w64-qt5-base-noopengl-static' ]]
}

pkgname=mingw-w64-qt5-base
pkgver=5.7.1
pkgrel=1
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
# The static variant doesn't contain any executables which need to be executed on the build machine
isStatic && arch=('any') || arch=('i686' 'x86_64')
url='https://www.qt.io/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-pcre')
groups=('mingw-w64-qt' 'mingw-w64-qt5')
optdepends=('mingw-w64-postgresql: PostgreSQL support' 'mingw-w64-mariadb-connector-c: MySQL support')
makedepends=('mingw-w64-gcc' 'mingw-w64-postgresql' 'mingw-w64-mariadb-connector-c' 'mingw-w64-pkg-config')
options=(!strip !buildflags staticlibs !emptydirs)
_pkgfqn="qtbase-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Fix-qwindows-plugin-linking-with-system-freetype.patch'
        '0002-Fix-oci-config-test-on-windows.patch'
        '0003-Don-t-set-QT_NO_SYSTEMSEMAPHORE-for-Windows.patch'
        '0004-Fix-building-mysql-driver-under-mingw.patch'
        '0005-Support-ANGLE-switches-via-configure-shell-script.patch'
        '0006-Use-external-ANGLE-library.patch'
        '0007-Fix-too-many-sections-assemler-error-in-OpenGL-facto.patch'
        '0008-Make-sure-.pc-files-are-installed-correctly.patch'
        '0009-Don-t-add-resource-files-to-LIBS-parameter.patch'
        '0010-Prevent-debug-library-names-in-pkg-config-files.patch'
        '0011-Fix-linking-against-static-D-Bus.patch'
        '0012-Adjust-win32-g-mkspecs-profile.patch'
        '0013-Fix-linking-against-external-harfbuzz.patch'
        '0014-Fix-linking-against-static-pcre.patch'
        '0015-Rename-qtmain-to-qt5main.patch'
        '0016-Build-dynamic-host-libraries.patch'
        '0017-Enable-rpath-for-build-tools.patch'
        '0018-Use-system-zlib-for-build-tools.patch'
        '0019-Disable-determing-default-include-and-lib-dirs-at-qm.patch'
        '0020-Use-.dll.a-as-import-lib-extension.patch'
        '0021-Merge-shared-and-static-library-trees.patch'
        '0022-Allow-usage-of-static-version-with-CMake.patch'
        '0023-Use-correct-pkg-config-static-flag.patch'
        '0024-Use-shared-static-version-of-MariaDB.patch'
        '0025-Use-shared-static-version-of-PostgreSQL.patch'
        '0001-Fix-qwindows-plugin-linking-with-system-freetype.patch'
        '0002-Fix-oci-config-test-on-windows.patch'
        '0003-Don-t-set-QT_NO_SYSTEMSEMAPHORE-for-Windows.patch'
        '0004-Fix-building-mysql-driver-under-mingw.patch'
        '0005-Support-ANGLE-switches-via-configure-shell-script.patch'
        '0006-Use-external-ANGLE-library.patch'
        '0007-Fix-too-many-sections-assemler-error-in-OpenGL-facto.patch'
        '0008-Make-sure-.pc-files-are-installed-correctly.patch'
        '0009-Don-t-add-resource-files-to-LIBS-parameter.patch'
        '0010-Prevent-debug-library-names-in-pkg-config-files.patch'
        '0011-Fix-linking-against-static-D-Bus.patch'
        '0012-Adjust-win32-g-mkspecs-profile.patch'
        '0013-Fix-linking-against-external-harfbuzz.patch'
        '0014-Fix-linking-against-static-pcre.patch'
        '0015-Rename-qtmain-to-qt5main.patch'
        '0016-Build-dynamic-host-libraries.patch'
        '0017-Enable-rpath-for-build-tools.patch'
        '0018-Use-system-zlib-for-build-tools.patch'
        '0019-Disable-determing-default-include-and-lib-dirs-at-qm.patch'
        '0020-Use-.dll.a-as-import-lib-extension.patch'
        '0021-Merge-shared-and-static-library-trees.patch'
        '0022-Allow-usage-of-static-version-with-CMake.patch'
        '0023-Use-correct-pkg-config-static-flag.patch'
        '0024-Use-shared-static-version-of-MariaDB.patch'
        '0025-Use-shared-static-version-of-PostgreSQL.patch'
        '0026-Fix-qt5_wrap_ui-macro.patch')
md5sums=('f0809befe04160fbb73bbf38a06a2073'
         '14ea9353fcc9234a9c7cb98ef14050a3'
         '34c9df86a43132f58b18bd3061305b36'
         '94f3ec6cdb456cc9b0535bd549cf2859'
         'eb118e7a01ff8e39f608e715758ac3dd'
         'c5184ae70974aaeaf5e1996dc7af6ec0'
         '917a3439afa97afab1b0b722082d640b'
         'bea9eb1a5be8e5e1ee2592007b112fe5'
         '281a81a7c32cc2f4bfeb83f5bea29d59'
         'ec262ef6bcf2f12832f83aad30d2f728'
         '10c24aec6ca3743d01ca7e0f2704b024'
         'bfa3574a0d44f831e412befba235b2ca'
         '366b8209ba35b00e2fe4ddcf448ed015'
         '0c17f618cbee73a49d7829da7c816cd7'
         '11f26a2237acd5e78d5a3db4de2d6d90'
         '632765f81a4b72b540376255a10b4c2e'
         '1f57d40dc492822f2e931bdd3a0b7435'
         '758afe3653d7ce126ebae03e6a8f222f'
         'd616bd0fd1ac1ae0d749f93fcba0aeb1'
         '6847671b013c249aaa2dd7d7e646e4e6'
         '9e3c6cee969a55b15558f6a46f7aad20'
         '7bf4cf112551bea4c4d3dd91ed7e1461'
         '97ece0bb54a249aa0a1fc662eedc93de'
         '4bdbf113772fdfe4cc6da53c866216b2'
         '399555789f729477d65861179efaf9e3'
         '295d83b50278474289727dc49a688e95'
         '14ea9353fcc9234a9c7cb98ef14050a3'
         '34c9df86a43132f58b18bd3061305b36'
         '94f3ec6cdb456cc9b0535bd549cf2859'
         'eb118e7a01ff8e39f608e715758ac3dd'
         'c5184ae70974aaeaf5e1996dc7af6ec0'
         '917a3439afa97afab1b0b722082d640b'
         'bea9eb1a5be8e5e1ee2592007b112fe5'
         '281a81a7c32cc2f4bfeb83f5bea29d59'
         'ec262ef6bcf2f12832f83aad30d2f728'
         '10c24aec6ca3743d01ca7e0f2704b024'
         'bfa3574a0d44f831e412befba235b2ca'
         '366b8209ba35b00e2fe4ddcf448ed015'
         '0c17f618cbee73a49d7829da7c816cd7'
         '11f26a2237acd5e78d5a3db4de2d6d90'
         '632765f81a4b72b540376255a10b4c2e'
         '1f57d40dc492822f2e931bdd3a0b7435'
         '758afe3653d7ce126ebae03e6a8f222f'
         'd616bd0fd1ac1ae0d749f93fcba0aeb1'
         '6847671b013c249aaa2dd7d7e646e4e6'
         '9e3c6cee969a55b15558f6a46f7aad20'
         '7bf4cf112551bea4c4d3dd91ed7e1461'
         '97ece0bb54a249aa0a1fc662eedc93de'
         '4bdbf113772fdfe4cc6da53c866216b2'
         '399555789f729477d65861179efaf9e3'
         '295d83b50278474289727dc49a688e95'
         '541413adc439b0650ad236f13c47e28e')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
#_architectures='x86_64-w64-mingw32 i686-w64-mingw32'

isStatic && depends+=(${pkgname%-static})
if isANGLE; then
  if isDynamic; then
    makedepends+=('mingw-w64-angleproject')
    optdepends+=('mingw-w64-angleproject: use ANGLE instead of native OpenGL')
  else
    depends+=('mingw-w64-angleproject')
  fi
fi
if ! isDefault; then
  if isStatic; then
    provides+=('mingw-w64-qt5-base-static')
    conflicts+=('mingw-w64-qt5-base-static' 'mingw-w64-qt5-base-angle-static' 'mingw-w64-qt5-base-noopengl-static'
                'mingw-w64-qt5-base-dynamic-static' 'mingw-w64-qt5-base-openql-static')
  else
    provides+=('mingw-w64-qt5-base')
    conflicts+=('mingw-w64-qt5-base' 'mingw-w64-qt5-base-angle' 'mingw-w64-qt5-base-noopengl'
                'mingw-w64-qt5-base-dynamic' 'mingw-w64-qt5-base-openql')
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

  # Apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    patch -p1 -i "$patch"
  done

  # Make sure the Qt5 build system uses our external ANGLE library
  rm -rf src/3rdparty/angle include/QtANGLE/{EGL,GLES2,GLES3,KHR}

  # As well as our external PCRE library and zlib
  rm -rf src/3rdparty/{pcre,zlib}
}

build() {
  cd "${srcdir}/${_pkgfqn}"

  # Do not set any flags here, flags are configured via mkspec
  # Setting flags here is not appropriate as it does not allow to
  # distinguish between flags for native compiler and cross compiler
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS

  for _arch in ${_architectures}; do
    # Phonon is disabled for now because we lack the directx headers
    # FIXME: check whether this is still the case

    # To prevent conflicts with the mingw-w64-qt4 package we have
    # to put tools in a dedicated folder

    # The last device option allows using ccache though the use of
    # pre-compile header
    # (sloppiness must be set to pch_defines,time_macros in ccache config)

    local qt_configure_args="\
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
      -system-freetype \
      -system-harfbuzz \
      -system-pcre \
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
      -device-option CROSS_COMPILE=${_arch}- \
      -device-option CROSS_COMPILE_CFLAGS=-fpch-preprocess"

    # Fix include directory of freetype2 and dbus
    qt_configure_args+=" $(${_arch}-pkg-config --cflags-only-I freetype2 dbus-1)"

    # Configure usage of ANGLE/OpenGL
    if isOpenGL; then
      msg2 'Using native OpenGL backend'
      qt_configure_args+=' -opengl desktop'
    elif isNoOpenGL; then
      msg2 'Building without OpenGL support'
      qt_configure_args+=' -no-opengl'
    elif isANGLE; then
      if isDynamic; then
        msg2 'Using dynamic OpenGL backend'
        qt_configure_args+=' -opengl dynamic'
      else
        msg2 'Using ANGLE as OpenGL backend'
        qt_configure_args+=' -opengl angle'
      fi
      # GL_GLEXT_PROTOTYPES must be defined to enable declarations of GLES functions
      qt_configure_args+=' -DGL_GLEXT_PROTOTYPES'
    fi

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

      # Drop Qt5Bootstrap and libraries which are only provided as static lib
      # and are hence already present in shared build (such as Qt5OpenGLExtensions)
      rm -f "${pkgdir}/usr/${_arch}/lib/"{lib,}qt5main* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5OpenGLExtensions* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5PlatformSupport* \
        "${pkgdir}/usr/${_arch}/lib/"libQt5Bootstrap* \
        "${pkgdir}/usr/${_arch}/lib/"libqtpng.a \
        "${pkgdir}/usr/${_arch}/lib/"qtpng.static.prl

      # Also ensure config files don't conflict with shared version
      pushd "${pkgdir}/usr/${_arch}/lib/cmake"
      for cmake_dir in $(find . ! -path . -type d ! -name 'Static*'); do
        mkdir -p "./Static${cmake_dir:2}";
        mv "${cmake_dir}/"* "./Static${cmake_dir:2}";
        rm -r "${cmake_dir}"
      done
      rm -r "./StaticQt5OpenGLExtensions"
      popd
      rm "${pkgdir}/usr/${_arch}/lib/pkgconfig/StaticQt5OpenGLExtensions.pc"

      # Keep various Qt 5 plugins to be used in static builds
      pushd "${pkgdir}/usr/${_arch}/lib/" && ln -s "./qt/plugins/"*/*.a . && popd

      # Keep a couple pri files not found in base
      mv "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/modules/qt_plugin_"*.pri "${pkgdir}/usr/${_arch}"

      # Delete duplicate files that are in the base package
      rm -fR "${pkgdir}/usr/${_arch}/"{include,share}
      rm -fR "${pkgdir}/usr/${_arch}/lib/"{qt/bin,qt/mkspecs}

      # Move pri files back
      mkdir -p "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/modules"
      mv "${pkgdir}/usr/${_arch}/"*.pri "${pkgdir}/usr/${_arch}/lib/qt/mkspecs/modules"

    else # Shared release
      # The .dll's are installed in both bindir and libdir, one copy of the .dll's is sufficient
      find "${pkgdir}/usr/${_arch}/lib" -maxdepth 1 -name "*.dll" -exec rm {} \;

      # The Qt5OpenGLExtensions module is only available as static library and hence part of the
      # shared build

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
