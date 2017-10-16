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
# I only tested the static variant using native OpenGL so far (mingw-w64-qt5-base-static).
# Note that ANGLE will still be loaded as dynamic library in mingw-w64-qt5-base-dynamic-static.

# By default CMake and qmake will link against the dynamic Qt libraries.

# To use the static Qt libraries with CMake prepend the Qt module name with Static:
#  eg. find_package(Qt5Core) becomes find_package(StaticQt5Core)
# To use a static module, add the corresponding imported target, eg.
#  target_link_libraries(target ... StaticQt5::Core)
#  and using
# This approach allows installing dynamic and static Qt in the same prefix
# and using both variants in the same CMake project.

# To use a static plugin, add the corresponding imported target, eg.
#  target_link_libraries(target ... StaticQt5::QWindowsIntegrationPlugin)
# Automatically importing static plugins is currently not possible, though. Hence it is required to use Q_IMPORT_PLUGIN, eg.
#  #include<QtPlugin>
#  Q_IMPORT_PLUGIN(QWindowsIntegrationPlugin)

# It is also possible to use static Qt libraries with CMake by setting the
# variable USE_STATIC_QT_BY_DEFAULT: set(USE_STATIC_QT_BY_DEFAULT ON)
# In this case the regular imported targets (eg. Qt5::Core) will be static.
# This approach does *not* allow to use dynamic and static Qt in the same
# CMake project.

# To use the static Qt libraries with qmake add 'static' to the project config (either inside the *.pro file or as qmake argument):
#  CONFIG+=static

# Further Qt modules (those not found in the base repository and hence not included in this package) include by default
# static and dynamic libraries; if only one version is requried, just set NO_STATIC_LIBS or NO_SHARED_LIBS when building
# the package, eg. by adding 'NO_STATIC_LIBS=1' to /etc/makepkg.conf.

# By default, executables will not be removed because I find them useful when testing. To remove executables
# set NO_EXECUTABLES (or NO_STATIC_EXECUTABLES to remove statically linked executables only) when building the package.
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

pkgname=mingw-w64-qt5-base-static
pkgver=5.9.2
pkgrel=1
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
# The static variant doesn't contain any executables which need to be executed on the build machine
isStatic && arch=('any') || arch=('i686' 'x86_64')
url='https://www.qt.io/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl-1.0' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-pcre2')
groups=('mingw-w64-qt5')
optdepends=('mingw-w64-postgresql: PostgreSQL support' 'mingw-w64-mariadb-connector-c: MySQL support')
makedepends=('mingw-w64-gcc' 'mingw-w64-postgresql' 'mingw-w64-mariadb-connector-c' 'mingw-w64-pkg-config')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
_pkgfqn="qtbase-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Add-profile-for-cross-compilation-with-mingw-w64.patch'
        '0002-Ensure-GLdouble-is-defined-when-using-dynamic-OpenGL.patch'
        '0003-Use-external-ANGLE-library.patch'
        '0004-Fix-too-many-sections-assemler-error-in-OpenGL-facto.patch'
        '0005-Make-sure-.pc-files-are-installed-correctly.patch'
        '0006-Don-t-add-resource-files-to-LIBS-parameter.patch'
        '0007-Prevent-debug-library-names-in-pkg-config-files.patch'
        '0008-Fix-linking-against-shared-static-libpng.patch'
        '0009-Fix-linking-against-static-D-Bus.patch'
        '0010-Don-t-try-to-use-debug-version-of-D-Bus-library.patch'
        '0011-Fix-linking-against-static-freetype2.patch'
        '0012-Fix-linking-against-static-harfbuzz.patch'
        '0013-Fix-linking-against-static-pcre.patch'
        '0014-Fix-linking-against-shared-static-MariaDB.patch'
        '0015-Fix-linking-against-shared-static-PostgreSQL.patch'
        '0016-Rename-qtmain-to-qt5main.patch'
        '0017-Build-dynamic-host-libraries.patch'
        '0018-Enable-rpath-for-build-tools.patch'
        '0019-Use-system-zlib-for-build-tools.patch'
        '0020-Disable-determing-default-include-and-lib-dirs-at-qm.patch'
        '0021-Use-.dll.a-as-import-lib-extension.patch'
        '0022-Merge-shared-and-static-library-trees.patch'
        '0023-Pull-dependencies-of-static-libraries-in-CMake-modul.patch'
        '0024-Allow-usage-of-static-version-with-CMake.patch'
        '0025-Adjust-linker-flags-for-static-build-with-cmake-ming.patch'
        '0026-Use-correct-pkg-config-static-flag.patch'
        '0027-Fix-macro-invoking-moc-rcc-and-uic.patch'
        '0028-Ignore-errors-about-missing-feature-static.patch'
        '0029-Enable-and-fix-use-of-iconv.patch'
        '0030-Ignore-failing-pkg-config-test.patch'
        '0031-Prevent-qmake-from-messing-static-lib-dependencies.patch'
        '0032-Hardcode-linker-flags-for-platform-plugins.patch'
        '0033-Fix-linking-against-static-plugins-with-qmake.patch')
sha256sums=('7fe2bb468955f633c71b3ddd3c269e68a2c4137a4e5b8dd12dcdb34cbc6d609b'
            '685fd08e1c4e97bbf6990959cb3dbe88dd3ed494221400dce6aef159d277c34a'
            '4e5115e62b952acface29882c5f6423569cd1c439c454e58594b5fb2cb740916'
            '0b339563844ccd325486d78711592561996fb256f0612c63b33b6ea52a6fc77e'
            '18945eb521df54d37922894c9bc82ccd03eb3fd9f6e0aed986facf2b49f336d4'
            '2c2b5f9b3db02750ae9a9626ea8a24a3516c881c5eaa9b19fb9a2621fc1263fc'
            '81559290cc03f7ff6042f28a6eb319882264876076a20e24531641ebe4ef3aee'
            'a3d657ee7f8bfa6c3e5a4aa626710bc27fc82fea3d834098bde2b2f67244d11c'
            '3df9bf81a936c737cc7ca53bdea9cfd2a4010fa190fe3e1a45611097d8213ef4'
            '5aac41daaf223726d31ab5a7aec0bdc050aa182522ca732cc31c3b5ac8cd28dc'
            '6844b7106e636d513b077edeba318990641b1ee294f2a70739830e3d0a9b0d02'
            '12b51c32069270e49e05e64b0f54d6e3e871523660fd17673e0ee6e67206955e'
            '4baa73f8b3d61b503a9de1437bdc9f7f84cd2443280afc1461456ae34d222e9b'
            'e34eec672f9f681302edd809cbcb7d6848a310a02acc5711e2e348aab1b8d74c'
            'd70f44c06a7bae6fbd91022ec79f09e2d658969aa5a6602bff6eb61076801b6e'
            'f705fcfe1f552536318c2c63d59e5ec95640321d9f1fff1016a34d1bc862c9df'
            '60034cce435d3eca60906e4af2f1ad55edd12b4e95ccc9905e793bc7b9d66917'
            '295c307f6b075b0c20b7d714b6ecff1bc25927b80dd60d725052b4bc05d1b055'
            '37c2d0bce780a15e7bdb477324936b1ae0ebe576c64d3a713a9086586518d50a'
            '36b6a2e1d2bf478746e931da5223dcfeffc5eda513b64596ffbbd663fd5e63e7'
            'e1b45c50ca09b065f218442a1fc3ddf3c8de1357a818925497fe0e3e7c28cacd'
            '03feabae42553a6960c2a257eb951d956fe31a9a4440a92b373e8a0d6cb301ff'
            '1ec8a7ebaf5e400aca7a0abe8cee78d0dae6b662c30bf245b81814cfcd048dd3'
            'bc2f049471853a6bb2e83de3c2691a4206d55c7fe018bb7910215e9968759082'
            '8611ac15ee36b803b5095466509c57d45532ab017d61513f2be7b34d5c13da0f'
            'f999f20131f0180439b59320ab350a284b169e5ee5e21379fa74dc07d4aeda25'
            'd9fed680c0313c89458361ac253a5710379fa8022c7c24b05d2807ecaf4f803a'
            'd263509d7951f12d9ccfa841cd7f205aebc7b9db28913925b65a23e627258023'
            '092176255153bae63f779833d25e5f64a2c489a1b6f33e8e158ff59629916b36'
            '65023b59b41797281876b5fcd8cb1542ad790b9b6f83125b6b0aa1e02d9de4fb'
            '3d5202be8837bccab4dedc9b6f10b3722ca57ea8b663e08b55d0235381397508'
            '4df4c2ad348c13a3b82c3a9b127464492898379a82dfd6db9d3ff9d051a08dab'
            'cfa48754bef9f7a95f1350c0c1ec1699c9dc413013ef78d218206f5d60335823'
            '135123e630efdbeb6d4edc9bc200754f2c881760652fe5152f0903ae238ce2c9')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

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
  unset PKG_CONFIG_PATH

  for _arch in ${_architectures}; do
    echo "INCLUDEPATH += /usr/${_arch}/include/openssl-1.0" >> src/network/network.pro

    # To prevent conflicts with the mingw-w64-qt4 package we have
    # to put tools in a dedicated folder

    # The last device option allows using ccache though the use of
    # pre-compile header
    # (sloppiness must be set to pch_defines,time_macros in ccache config)

    local qt_configure_args="\
      -xplatform mingw-w64-g++ \
      -optimized-qmake \
      -verbose \
      -opensource \
      -confirm-license \
      -force-pkg-config \
      -force-debug-info \
      -system-zlib \
      -system-libpng \
      -system-libjpeg \
      -system-sqlite \
      -system-freetype \
      -system-harfbuzz \
      -system-pcre \
      -no-fontconfig \
      -sql-mysql \
      -sql-psql \
      -sql-sqlite \
      -dbus-linked \
      -no-glib \
      -no-icu \
      -iconv \
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
      -device-option CROSS_COMPILE_PREFIX=/usr/${_arch} \
      -device-option CROSS_COMPILE_CFLAGS=-fpch-preprocess"

    # Fix include directory of freetype2 and dbus
    qt_configure_args+=" $(${_arch}-pkg-config --cflags-only-I freetype2 dbus-1)"

    # Enable debug build if MINGW_W64_QT_DEBUG_BUILD is set (in /etc/makepkg.config)
    [[ $MINGW_W64_QT_DEBUG_BUILD ]] \
      && qt_configure_args+=' -debug-and-release' \
      || qt_configure_args+=' -release'

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
        qt_configure_args+=' -angle'
      fi
      # GL_GLEXT_PROTOTYPES must be defined to enable declarations of GLES functions
      qt_configure_args+=' -DGL_GLEXT_PROTOTYPES'
    fi

    # Fix MariaDB
    qt_configure_args+=" -I/usr/${_arch}/include/mariadb"

    mkdir -p ../build-${_arch} && pushd ../build-${_arch}
    if isStatic; then
      export OPENSSL_LIBS="/usr/${_arch}/lib/openssl-1.0/libssl.a /usr/${_arch}/lib/openssl-1.0/libcrypto.a -lws2_32 -lgdi32 -lcrypt32"
      ../${_pkgfqn}/configure \
        $qt_configure_args \
        -static \
        -openssl-linked
      make
    else
      # The LD_LIBRARY_PATH override is needed because libQt5Bootstrap* are shared
      # libraries which various compiled tools (like moc) use. As the libQt5Bootstrap*
      # libraries aren't installed at this point yet, we have to workaround this
      ../${_pkgfqn}/configure $qt_configure_args \
        -shared \
        -openssl-runtime \
        -device-option 'CROSS_COMPILE_CUSTOM_CONFIG=actually_a_shared_build'
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
      rm -f \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}qt5main* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5AccessibilitySupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5DeviceDiscoverySupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5EventDispatcherSupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5FbSupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5FontDatabaseSupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5PlatformCompositorSupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5ThemeSupport* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5OpenGLExtensions* \
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5PlatformSupport* \
        "${pkgdir}/usr/${_arch}/lib/"libQt5Bootstrap* \

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
