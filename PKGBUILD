# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.in contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtmultimedia

# Includes dynamic and static versions; if only one version is requried, just
# set $NO_STATIC_LIBS or $NO_SHARED_LIBS.

_qt_module=qtmultimedia
pkgname=mingw-w64-qt5-multimedia
pkgver=5.14.1
pkgrel=1
arch=('any')
pkgdesc='Classes for audio, video, radio and camera functionality (mingw-w64)'
depends=('mingw-w64-qt5-base' 'mingw-w64-qt5-declarative')
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config')
license=('GPL3' 'LGPL' 'FDL' 'custom')
options=('!strip' '!buildflags' 'staticlibs')
groups=('mingw-w64-qt5')
url='https://www.qt.io/'
_pkgfqn="${_qt_module}-everywhere-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Recorder-includes-to-prevent-conflict-with-vsnprintf.patch'
        '0002-Fix-build-with-ANGLE.patch'
        '0003-Link-directshow-plugin-against-libamstrmid.patch'
        '0004-Fix-case-of-header-file-includes-for-building-with-m.patch')
sha256sums=('c458121c8db7ff77eefe643a7c9847ff324647f2603bb5664bcafa6435edeae7'
            '868eee99997f42ea69f1fd58938b447be77a20b3e210f6b4a2e547666f5e8456'
            'c47b93ba7de47f0a67c7a200b1d9d36b7aefa507c5a8f2fb510cc69545fd3a7b'
            'e35c8f9877b2ade5c650ca79e56b527db30dcfc39048f2694e4da25281f530a0'
            'a008984f200628a3a58bcde1c95247b578af77d0abcab242f2a16f46db23e911')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

[[ $NO_STATIC_LIBS ]] || \
  makedepends+=('mingw-w64-qt5-base-static') \
  optdepends+=('mingw-w64-qt5-base-static: use of static libraries') \
  _configurations+=('CONFIG+=no_smart_library_merge CONFIG+=static')
[[ $NO_SHARED_LIBS ]] || \
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
      popd
    done

    # drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "${pkgdir}/usr/${_arch}/lib" -type f -name '*.prl' -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
  done
}
