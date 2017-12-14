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

pkgname=mingw-w64-qt5-base-angle
pkgver=5.10.0
pkgrel=1
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
# The static variant doesn't contain any executables which need to be executed on the build machine
isStatic && arch=('any') || arch=('i686' 'x86_64')
url='https://www.qt.io/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-pcre2')
groups=('mingw-w64-qt5')
optdepends=('mingw-w64-postgresql: PostgreSQL support' 'mingw-w64-mariadb-connector-c: MySQL support')
makedepends=('mingw-w64-gcc' 'mingw-w64-postgresql' 'mingw-w64-mariadb-connector-c' 'mingw-w64-pkg-config')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
_pkgfqn="qtbase-everywhere-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
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
        '0033-Fix-linking-against-static-plugins-with-qmake.patch'
        '0034-Don-t-use-the-statx-syscall.patch')
sha256sums=('fd5578cd320a13617c12cf2b19439386b203d6d45548e855f94e07be9829f762'
            'd2784f40a1f8f3f7041c94b89702404a21ef2fd1d6c63bbffe14e26321265745'
            'c695a25e6dc0ddd8b1dd07adba6eee518294ffb69b689f373dde861f935c876b'
            '4a7a855fe8abffe0aa3da450981439a1c26f7f65fe456149f627bccd603ad5b7'
            '46a42a20a4bed03f9f0b7abd55904be3e560dfd4e10e586d68479a5060ce06e2'
            '70550f6cbe95c5a14ccb7e9ba5fab7cb595a0fc49b889c9ac735cca41148ab5b'
            'fa16872915ce6d24bc217ee7c5e42c3c61e29034f832e32f2971da85eb4f3d08'
            '19b01e55dd3eb311c182d2ef682f15a2739556d5585d9e19de633e92dba9a788'
            'e13936a6f7d17a6c38c95e9cc9e19209a3d03970cf5157931f309edf45530132'
            '978a2f5a53c0fe50780a12c09bbc81ee8efe60d1437425b08b3c5b4a4edb217c'
            '8ffb5f68ebe09e99580d45c1279dc39ef811d0de7e4d363173af3be2cf3c9ee8'
            '305f18d1b011033fbb12ca544d3af47cb45a1b6d324bf68b671cb007dc2a8a0a'
            '53fb05efee9c024643cd607c623eda745a122cddc2880d6554b3168778942316'
            '927188133dc2708345f7c831e1253b59338a9554b544c1d2cfdf02493b92573f'
            '125f0b758bf2088589a31ced00146dc2cce28fa93bdd84684857ae60850c96b8'
            '016c3a2980060365dd7e83a001f274b6a7f736af2519fa7c5263b0def10e2703'
            '48930971f0ce225795bd0b6292c4e3ad27843ec0c95113b95be44274435b6623'
            'a6f8e6111b6960b86b347c3927251f41c8fa235aabf90e89965063326c7cedd3'
            'a57e452177fd1aa7f0d22b1a83f29dd18010dfef7b007157a7dc8d6399232471'
            '07b1ab8b25a02e1ed369017178847081afe937817e71384dfb17ab56ff278a0e'
            '2b426ab2aa774110c2b628c4987748520925e7ebfda2f524407cdc606315696b'
            'a78df9e2a5f3da89f944328a217ae5dd75fabd37f5b5c9ebc8eb75678f31910a'
            '8470c121a04702b1a0ef4f52d310e69906bab0c066fcb6c7601bcb678655b959'
            'ac09e38e4f555e5bae1bc0f01b70a67624b15ecf5affc06d85eaccbc85f3c1da'
            '0c1939eff41143bc78a6bf6e8b51515f4ba68337b9723674e6e7ab696167edae'
            'ed64b7a36a01d30bc9d35fed47186f9161e5ceba7dd92da7c60d288026fa8856'
            '3f42240d83d09c62b8a7d9a98fe2d6a9d9fcf8ba6b5ff3d303a941411ef7d1a4'
            'd44bdc6363d1e5e1cbcdb5b61e0a788a38368ab3090746c165981bd0a5eb0854'
            '15c0691f6fd058bf70be79b221ab4ace66cc574728b68d9f15bafe1877f46266'
            '05aec6b0c2d9add0e4181246b52096d4cf2f4176f4c0e9f467d5244492844c28'
            'ed1237884607a368190cb1ac4de2a12f00e54ecfcea901c7f1980ac37b94b57b'
            '4a83eb1549be9477bc002a6b939e24a6f1b6fd14bfcc804235771d484762aa3e'
            'a100076b67008b64f73fd4fd4b131e1774b84b24b61198cabecdb5916d634887'
            'fe9ecf6e82b64b3a955f688d51c87ca82a4aa4ad59e419c7c284ce18b72e223c'
            'cbc0e2570ca5b52681d99ab15e7a7a79a286e498203d34c2d67493a78dd6b84d')

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

    msg2 'Configure and build qmake'
    mkdir -p ../build-${_arch} && pushd ../build-${_arch}
    if isStatic; then
      export OPENSSL_LIBS="/usr/${_arch}/lib/libssl.a /usr/${_arch}/lib/libcrypto.a -lws2_32 -lgdi32 -lcrypt32"
      ../${_pkgfqn}/configure \
        $qt_configure_args \
        -static \
        -openssl-linked
      msg2 'Build static Qt libraries'
      make
    else
      # The LD_LIBRARY_PATH override is needed because libQt5Bootstrap* are shared
      # libraries which various compiled tools (like moc) use. As the libQt5Bootstrap*
      # libraries aren't installed at this point yet, we have to workaround this
      ../${_pkgfqn}/configure \
        $qt_configure_args \
        -shared \
        -openssl-runtime \
        -device-option 'CROSS_COMPILE_CUSTOM_CONFIG=actually_a_shared_build'
      msg2 'Build shared Qt libraries'
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
        "${pkgdir}/usr/${_arch}/lib/"{lib,}Qt5EdidSupport* \
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
