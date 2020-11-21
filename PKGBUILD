# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

_qt_module=qtvirtualkeyboard
pkgname=mingw-w64-qt5-virtualkeyboard-static
#_fix_deps_of_static_3rdparty_libs='s:\(-L\/.*\/lib.*\.a\) \(\/.*\/libqt\)\(openwnn\|pinyin\|tcime\)\(d*\.a\)\(.*\):\2\3\4 \1 \5:g'        # -L is used (pre Qt 5.13)
_fix_deps_of_static_3rdparty_libs='s:\(LIBS *= *\)\(.*\)\(\/build\/.*\/libqt\)\(openwnn\|pinyin\|tcime\)\(d*\.a\)\(.*\):\1 \3\4\5 \2 \6:g' # absolute paths are used (Qt 5.13 and above)
pkgver=5.15.2
pkgrel=1
arch=('any')
pkgdesc="Virtual keyboard framework (translations, mingw-w64)"
depends=('mingw-w64-pkg-config' 'mingw-w64-qt5-declarative-static' 'mingw-w64-qt5-svg-static')
makedepends=('mingw-w64-gcc')
license=('GPL3')
options=('!strip' '!buildflags' 'staticlibs')
groups=('mingw-w64-qt5')
url='https://www.qt.io/'
_pkgfqn="${_qt_module}-everywhere-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('9a3193913be30f09a896e3b8c2f9696d2e9b3f88a63ae9ca8c97a2786b68cf55')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

depends+=(${pkgname%-static}) # the static version relies on the shared version for build tools and headers
_configurations+=('CONFIG+=no_smart_library_merge CONFIG+=static')

build() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      msg2 "Building ${_config##*=} version for ${_arch}"
      mkdir -p build-${_arch}-${_config##*=} && pushd build-${_arch}-${_config##*=}
      ${_arch}-qmake-qt5 ../${_qt_module}.pro ${_config} ${_additional_qmake_args}

      # fix dependency order for libqtopenwnn and other static 3rdparty libraries which depend Qt5Core and hence need
      # it subsequent on the linker line
      # (Not sure why qmake isn't smart enough to put it in the right order itself. It also appears that in Qt 5.12
      #  the order is messed in a different way than in Qt 5.11. Now it also seems to update the Makefile again unless
      #  touched to a date in the future.)
      make qmake_all
      find . \( -type f -name 'Makefile*' -o -name '*.prl' \) -exec sed -i "$_fix_deps_of_static_3rdparty_libs" {} \; -exec touch -d 300101 {} \;

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

      # apply the fix for the dependency order like in build
      find "${pkgdir}/usr/${_arch}/lib" \( -type f -name '*.prl' -o -name '*.pc' \) -exec sed -i -e "$_fix_deps_of_static_3rdparty_libs" {} \;

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

    # drop QMAKE_PRL_BUILD_DIR because reference the build dir
    find "${pkgdir}/usr/${_arch}/lib" -type f -name '*.prl' -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
  done
}

