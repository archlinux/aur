# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# Includes dynamic and static versions; if only one version is requried, just
# set $NO_STATIC_LIBS or $NO_SHARED_LIBS.

_qt_module=qtspeech
pkgname="mingw-w64-qt5-speech"
pkgver=5.10.0
pkgrel=1
arch=('any')
pkgdesc="Qt module to make text to speech and speech recognition easy (mingw-w64)"
depends=('mingw-w64-qt5-multimedia')
optdepends=()
makedepends=('mingw-w64-gcc')
# mingw-w64-flite and mingw-w64-speech-dispatcher are currently not available
#optdepends=('mingw-w64-flite: flite TTS backend' 'mingw-w64-speech-dispatcher: speech-dispatcher TTS backend')
#makedepends=('mingw-w64-gcc' 'mingw-w64-flite' 'mingw-w64-speech-dispatcher')
options=('!strip' '!buildflags' 'staticlibs')
groups=('mingw-w64-qt5')
license=('GPL3' 'LGPL' 'FDL' 'custom')
url='https://www.qt.io/'
_pkgfqn="${_qt_module}-everywhere-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('79159e1a9502ccb67145e0f6bdc43e3c2248835ff22be04a10c18db15a845ac1')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
[[ $NO_STATIC_LIBS ]] || \
  makedepends+=('mingw-w64-qt5-base-static') \
  optdepends+=('mingw-w64-qt5-base-static: use of static libraries') \
  _configurations+=('CONFIG+=static')
[[ $NO_SHARED_LIBS ]] || \
  _configurations+=('CONFIG+=actually_a_shared_build CONFIG+=shared')

build() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      msg2 "Building ${_config##*=} version for ${_arch}"
      mkdir -p build-${_arch}-${_config##*=} && pushd build-${_arch}-${_config##*=}
      ${_arch}-qmake-qt5 ../${_qt_module}.pro ${_config}
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
