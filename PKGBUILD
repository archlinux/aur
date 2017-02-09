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
pkgver=5.8.0
pkgrel=1
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
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' 'python' 'gperf' 'ruby')
options=('!strip' '!buildflags' 'staticlibs')
groups=('mingw-w64-qt5')
license=('GPL3' 'LGPL' 'FDL' 'custom')
url='https://www.qt.io/'
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
groups=('mingw-w64-qt5')
source=("https://download.qt.io/community_releases/${pkgver:0:3}/${pkgver}-final/${_pkgfqn}.tar.xz"
         '0001-Use-correct-ICU-libs.patch'
         '0002-Use-pkg-config.patch'
         '0003-Use-system-ANGLE-rather-than-bundled-version.patch'
         '0004-Prevent-symbols-not-being-exported-in-Qt5WebKit.dll.patch'
         '0005-Build-with-smaller-debug-info.patch'
         '0006-Establish-compatibility-with-latest-ANGLE.patch'
         '0007-Include-intrin.h-for-declaration-of-_mm_mfence.patch'
         '0008-Link-against-ANGLE-even-if-Qt-is-configured-not-to.patch'
         '0009-Fixed-crash-probably-miscompilation-with-MinGW-w64-5.patch')
md5sums=('60a6935aca4a7c553d0ec4646ceed3b4'
         '208ff77dc291de1c91b8143e7fb9c1ae'
         '1ea0dc59ce4283e533126a0abb30f21a'
         '695ba1f69129024dd3abb0bf6eb2b736'
         '6b65ea17730b99ee3e24821089624d56'
         'fdacb552245d089c77017977f52e8d51'
         '5964c02a0dcf8c4af354bc0a0f4babd3'
         '83fae95c74b670d84a03985d3dbd83d0'
         '307d500b217ca9183d9f97d617461803'
         'a9fd04dcfe19ef9458a0485219f24c64')

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

