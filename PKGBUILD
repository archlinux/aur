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

pkgname=mingw-w64-qt5-base-angle
pkgver=5.8.0
pkgrel=2
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
# The static variant doesn't contain any executables which need to be executed on the build machine
isStatic && arch=('any') || arch=('i686' 'x86_64')
url='https://www.qt.io/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-pcre')
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
        '0010-Fix-linking-against-static-freetype2.patch'
        '0011-Fix-linking-against-static-harfbuzz.patch'
        '0012-Fix-linking-against-static-pcre.patch'
        '0013-Fix-linking-against-shared-static-MariaDB.patch'
        '0014-Fix-linking-against-shared-static-PostgreSQL.patch'
        '0015-Rename-qtmain-to-qt5main.patch'
        '0016-Build-dynamic-host-libraries.patch'
        '0017-Enable-rpath-for-build-tools.patch'
        '0018-Use-system-zlib-for-build-tools.patch'
        '0019-Disable-determing-default-include-and-lib-dirs-at-qm.patch'
        '0020-Use-.dll.a-as-import-lib-extension.patch'
        '0021-Merge-shared-and-static-library-trees.patch'
        '0022-Allow-usage-of-static-version-with-CMake.patch'
        '0023-Use-correct-pkg-config-static-flag.patch'
        '0024-Fix-qt5_wrap_ui-macro.patch'
        '0025-Ignore-errors-about-missing-feature-static.patch'
        '0026-Enable-and-fix-use-of-iconv.patch'
        '0027-Ignore-failing-pkg-config-test.patch'
        '0028-Include-uiviewsettingsinterop.h-correctly.patch'
        '0029-Hardcode-linker-flags-for-libqwindows.dll.patch'
        '0030-Prevent-qmake-from-messing-static-lib-dependencies.patch')
md5sums=('6e1f7f6fb6333eb66e563b175c4e87e9'
         '59cabe2d0b5646342c6cec93f7ebc074'
         '9d45eaf425961899c40c76dbd1151204'
         '60fc8de6d43685fc158ff705891b12ff'
         'f8da92ad83e2d0e0ebc6ead7d49dcd62'
         'f4d2daf0e914d7df8ff9ea0db778164c'
         'd198fc82d361e5a52f066e20d0f2ac1a'
         'b8a9042191146eee8898c19090e6dd79'
         'bcf6b7aa10e04c1093c801d2f2b5722b'
         '50ef8614cb99b72b1e5cd5cb790b089e'
         '381c9f451602c72c9a11512b41a7e725'
         '6f2986a143d4d3fcbbf5ec6149742896'
         '398499d79aeb1ccbdc02c4e604035ee9'
         '94c63b114ee93f3d9892646090dceea2'
         '01c49b3786ce8852607aeb40482c56ab'
         '8d43ede146c545826b8667f4ebe1a92c'
         '47e13ec0622a3af2d89768cb6c228774'
         'e08a00d918adad4734e56be6f03ba9bc'
         '4808132cbdbc320d2e0dd26033fa245f'
         '92afca193efe77c51fe33c209047d6c5'
         '75ef72598c4274447b5668c791d019e4'
         '8eb99eec735bc566847ac692bec14ce6'
         'b22a8b34e4e403256fd9cfeba5fff508'
         '26c08be34065619f12a15b485c8c2ea3'
         '360f6a8dae753f3649bb7bea1ca9170f'
         'ac4b80a15f9004a8f668b80fb475ddd1'
         'ccec8075e73f445fcf4c600b4b990fee'
         '2a7a504e2b4572bef11855c8a0b2863a'
         '963f27d8f720a91b2345cda9fe0be8cd'
         'a12368572b27f714babb720258f7b81e'
         '3aa314937307e172c30258a82dd4ed67')

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
  unset PKG_CONFIG_PATH

  for _arch in ${_architectures}; do
    # Phonon is disabled for now because we lack the directx headers
    # FIXME: check whether this is still the case

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
      -openssl \
      -dbus-linked \
      -no-glib \
      -no-icu \
      -iconv \
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
        qt_configure_args+=' -angle'
      fi
      # GL_GLEXT_PROTOTYPES must be defined to enable declarations of GLES functions
      qt_configure_args+=' -DGL_GLEXT_PROTOTYPES'
    fi

    # Fix MariaDB
    qt_configure_args+=" -I/usr/${_arch}/include/mariadb"

    mkdir -p ../build-${_arch} && pushd ../build-${_arch}
    if isStatic; then
      ../${_pkgfqn}/configure -static $qt_configure_args
      make
    else
      # The LD_LIBRARY_PATH override is needed because libQt5Bootstrap* are shared
      # libraries which various compiled tools (like moc) use. As the libQt5Bootstrap*
      # libraries aren't installed at this point yet, we have to workaround this
      ../${_pkgfqn}/configure -shared $qt_configure_args
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
