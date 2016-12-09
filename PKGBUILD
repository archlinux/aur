# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# See the comments to enable further dependencies/functionality.

# Includes dynamic and static versions; if only one version is requried, just
# set $NO_STATIC_LIBS or $NO_SHARED_LIBS.

# All patches are managed at https://github.com/Martchus/qtwebkit
# Note: most patches are originally from http://pkgs.fedoraproject.org/git/rpms/mingw-qt5-qtwebkit.git

_qt_module=qtwebkit
pkgname=mingw-w64-qt5-webkit
pkgver=5.7.0
pkgrel=3
arch=('any')
pkgdesc="Classes for a WebKit2 based implementation and a new QML API (mingw-w64)"
depends=('mingw-w64-qt5-declarative'
         'mingw-w64-qt5-sensors'
         'mingw-w64-qt5-location'
         'mingw-w64-qt5-multimedia'
         'mingw-w64-angleproject'
         'mingw-w64-fontconfig'
         'mingw-w64-libpng'
         'mingw-w64-libjpeg-turbo'
         'mingw-w64-libxslt'
         'mingw-w64-zlib'
         'mingw-w64-icu'
         'mingw-w64-sqlite'
         'mingw-w64-libwebp')
# These dependencies will enable further functionality
#depends+=('mingw-w64-webchannel')
#depends+=('mingw-w64-gst-plugins-base')
#optdepends+=('mingw-w64-gst-plugins-good: Webm codec support')
makedepends=('mingw-w64-gcc' 'python' 'gperf' 'ruby' 'mingw-w64-pkg-config')
options=('!strip' '!buildflags' 'staticlibs')
license=('GPL3' 'LGPL' 'FDL' 'custom')
url="https://www.qt.io/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
groups=(mingw-w64-qt mingw-w64-qt5)
source=("https://download.qt.io/community_releases/${pkgver:0:3}/${pkgver}/${_pkgfqn}.tar.xz"
         '0001-Use-correct-ICU-libs.patch'
         '0002-Use-pkg-config.patch'
         '0003-Use-system-ANGLE-rather-than-bundled-version.patch'
         '0004-Prevent-symbols-not-being-exported-in-Qt5WebKit.dll.patch'
         '0005-Build-with-smaller-debug-info.patch'
         '0006-Establish-compatibility-with-latest-ANGLE.patch'
         '0007-Include-intrin.h-for-declaration-of-_mm_mfence.patch'
         '0008-Link-against-ANGLE-even-if-Qt-is-configured-not-to.patch'
         '0009-Fixed-crash-probably-miscompilation-with-MinGW-w64-5.patch')
sha256sums=('c7a3253cbf8e6035c54c3b08d8a9457bd82efbce71d4b363c8f753fd07bd34df'
            '922c12e3726cfcecd99d773a3135ea05a36bd325c24cf07463d21f8778d5c5a0'
            '2f7887173f777c6fb5ff49a37e1015b8e1d8f22f692917b0b0a24e22ad3022c5'
            '8c0dc51d02814577c4ac557493a2b7d7b74311649bf3c91072e798fd7b2d7a98'
            '3e9893be250bcadf2a3437f2fd1cc0d454211e315071939d9ebf27f00d600253'
            'cc0c239676f747b9c30fe1b774a5208fde5650f02f8388379d164d9ccaccab17'
            'b87eaa3c18764347f04a8d5fcae322052a194508ea0ba6eb2cd69db6385633c1'
            '4da5c29a054a8a087b95f4a7788aee83a1a4388efa948150f8cf4e233ec426bc'
            '79587af527bbb80d7954de6fb23c279493166e88c0f44e3aaa956964b04fbd3e'
            '8302e606050da917b01fa3af8388c0d7ae6ff999129b8eb2ed27bcf5d4d37dd9')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

# Disable building static version: building static Qt WebKit is not supported since Qt 4.7
NO_STATIC_LIBS=true

[[ $NO_STATIC_LIBS ]] || \
  makedepends+=('mingw-w64-qt5-base-static') \
  optdepends+=('mingw-w64-qt5-base-static: use of static libraries') \
  _configurations+=('CONFIG+=static')
[[ $NO_SHARED_LIBS ]] || \
  _configurations+=('CONFIG+=shared')

prepare() {
  cd "${srcdir}/${_pkgfqn}"

  # Apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    patch -p1 -i "$patch"
  done

  # Make sure the bundled copy of the ANGLE libraries isn't used
  rm -rf Source/ThirdParty/ANGLE
}

build() {
  cd "${srcdir}/${_pkgfqn}"
  unset PKG_CONFIG_PATH
  local default_cpath="$CPATH"
  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      msg2 "Building ${_config##*=} version for ${_arch}"
      mkdir -p build-${_arch}-${_config##*=} && pushd build-${_arch}-${_config##*=}
      # Since Source/ThirdParty/ANGLE has been removed ensure files from system ANGLE can be included
      export CPATH="${default_cpath}:/usr/$_arch/include:/usr/$_arch/include/GLSLANG"

      ${_arch}-qmake-qt5 \
        "QMAKE_CXXFLAGS+=-Wno-c++0x-compat" \
        ../WebKit.pro
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
}

