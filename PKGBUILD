# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# Includes dynamic and static versions; if only one version is requried, just
# set $NO_STATIC_LIBS or $NO_SHARED_LIBS.

# Skip building mapboxgl as it increases compile time significantly and
# likely not a lot of people actually using it; if you need it, just remove the
# following line:
_mapboxcfg='QT.global.disabled_features+=geoservices_mapboxgl'

_qt_module=qtlocation
pkgname=mingw-w64-qt5-location
pkgver=5.10.0
pkgrel=1
arch=('any')
pkgdesc='Provides access to position, satellite and area monitoring classes (mingw-w64)'
depends=('mingw-w64-qt5-base' 'mingw-w64-qt5-declarative')
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config')
options=('!strip' '!buildflags' 'staticlibs')
groups=('mingw-w64-qt5')
license=('GPL3' 'LGPL' 'FDL' 'custom')
url='https://www.qt.io/'
_pkgfqn="${_qt_module}-everywhere-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Ensure-static-3rdparty-libs-are-linked-correctly.patch')
sha256sums=('d84dcec7cfbc99a13e048f935783b0c2e1cb540defc82d77ac869a5b76aa85c7'
            'a4380c11444f11f79f5c78d76121e45aa27add611bc53204bb867fdf0832888c')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
[[ $NO_STATIC_LIBS ]] || \
  makedepends+=('mingw-w64-qt5-base-static') \
  optdepends+=('mingw-w64-qt5-base-static: use of static libraries') \
  _configurations+=('CONFIG+=static')
[[ $NO_SHARED_LIBS ]] || \
  _configurations+=('CONFIG+=actually_a_shared_build CONFIG+=shared')

prepare() {
  cd "${srcdir}/${_pkgfqn}"

  # Apply patches; further descriptions can be found in patch files itself
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
      ${_arch}-qmake-qt5 ../${_qt_module}.pro ${_config} ${_mapboxcfg}
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
