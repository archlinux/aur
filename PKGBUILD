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
pkgname=mingw-w64-qt5-declarative-static
pkgver=5.15.9
pkgrel=1
arch=('any')
pkgdesc='Classes for QML and JavaScript languages (mingw-w64)'
depends=('mingw-w64-qt5-base-static')
makedepends=('mingw-w64-gcc' 'mingw-w64-vulkan-headers' 'mingw-w64-pkg-config' 'python')
license=('GPL3' 'LGPL3' 'FDL' 'custom')
_commit=89bf481b9b14f038c5e16421a7fce6dc6523785f
_basever=$pkgver
pkgver+=+kde+r19
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
            '4437fc02e15a6f814af1111d34209a7424a1032aff54b22af47868fd505fad08'
            '17792373be52f230e255125ebb9442215b77cc2ce3988071481741832dbae4c9'
            '97a97599c90e42331554cfcef5f5e5da21642858a93c9d173eff1f1896bcde75')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

depends+=(${pkgname%-static}) # the static version relies on the shared version for build tools and headers
_configurations+=('CONFIG+=no_smart_library_merge CONFIG+=static')

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

      # delete duplicate files that are in the shared package
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete
      for shared_path in "${pkgdir}/usr/${_arch}/"{include,share} "${pkgdir}/usr/${_arch}/lib/"{qt/bin,qt/mkspecs}; do
        [[ -d $shared_path ]] && rm -fR "$shared_path"
      done
      for file in $(find "$pkgdir/usr/$_arch/lib"); do
        [[ -f "${file##$pkgdir}" ]] && rm "$file"
      done

      find "${pkgdir}/usr/${_arch}/lib" -maxdepth 1 -name '*.dll' -delete
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

}

