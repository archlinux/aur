# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: ohmyarch

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

# All patches are managed at https://github.com/Martchus/qtdeclarative

_qt_module=qtdeclarative
pkgname=mingw-w64-qt5-declarative
pkgver=5.15.12
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Classes for QML and JavaScript languages (mingw-w64)'
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-gcc' 'mingw-w64-vulkan-headers' 'mingw-w64-pkg-config' 'python')
license=('GPL3' 'LGPL3' 'FDL' 'custom')
_commit=792a55bb701d233116c3731c7a53ffdb8c67e407
_basever=${pkgver%%+*}
pkgver+=+kde+r31
makedepends+=('git')
options=('!strip' '!buildflags' 'staticlibs')
groups=('mingw-w64-qt5')
url='https://www.qt.io/'
_pkgfqn=${_qt_module}
source=(git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit
        '0001-Ensure-static-plugins-are-exported.patch'
        '0002-Prevent-exporting-QML-parser-symbols-on-static-build.patch'
        '0003-Disable-d3d12-requiring-fxc.exe.patch')
sha256sums=('SKIP'
            'bf3bf0817e05b54f8e09cc7d1ca6d048bdaf5288fd8c44e6f47d14d67d82a9ca'
            'cd888659520aa08abc677013be985c578b1b623d07616a3b2acaa680fa8b1000'
            '883de3bb703214511c760c2cfa6cec796bc9d1b8197de944864c7a4a31277e40')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

_configurations+=('CONFIG+=actually_a_shared_build CONFIG+=shared')

pkgver() {
  cd $_pkgfqn
  echo "$_basever+kde+r"`git rev-list --count v$_basever-lts-lgpl..$_commit`
}

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

    # strip native static libraries
    find "${pkgdir}/usr/${_arch}" -name 'libQt5QmlDevTools.a' -exec strip -g {} \;

    # drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "${pkgdir}/usr/${_arch}/lib" -type f -name '*.prl' -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
  done

  # make sure the executables don't conflict with their mingw-qt4 counterpart
  for _arch in ${_architectures}; do
    for exe_file in "${pkgdir}/usr/${_arch}/bin/"*.exe; do
      [[ -f $exe_file ]] && mv "${exe_file}" "${exe_file%.exe}-qt5.exe"
    done
  done
}
