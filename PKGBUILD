# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=qtutilities
pkgname=mingw-w64-qtutilities
_name=${pkgname#mingw-w64-}
pkgver=5.0.0
pkgrel=1
arch=('any')
pkgdesc='Common Qt related C++ classes and routines used by my applications such as dialogs, widgets and models (mingw-w64)'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-qt5-base' 'mingw-w64-c++utilities')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
optdepends=("$pkgname-doc: API documentation")
url="https://github.com/Martchus/${_reponame}"
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('3f8a6ea49b889febbb012674c773140793ad974731616b7142917ff53ed29cc0')
options=(!buildflags staticlibs !strip !emptydirs)
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
[[ $NO_STATIC_LIBS ]] ||
  makedepends+=('mingw-w64-qt5-base-static' 'mingw-w64-qt5-svg') \
  optdepends+=('mingw-w64-qt5-base-static: use of static library'
               'mingw-w64-qt5-svg: use of static library') \
  _configurations+=('static: -DENABLE_STATIC_LIBS:BOOL=ON -DDISABLE_SHARED_LIBS:BOOL=ON')
[[ $NO_SHARED_LIBS ]] || _configurations+=('shared: -DENABLE_STATIC_LIBS:BOOL=OFF -DDISABLE_SHARED_LIBS:BOOL=OFF')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  export CXXFLAGS='-O0'
  export PREVENT_FORCING_SHARED_LIBS=ON
  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      msg2 "Building ${_config%%: *} version for ${_arch}"
      mkdir -p "build-${_arch}-${_config%%: *}" && pushd "build-${_arch}-${_config%%: *}"
      echo ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" ${_config#*: } ../
      ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" ${_config#*: } ../
      make
      popd
    done
  done
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      msg2 "Packaging ${_config%%: *} version for ${_arch}"
      mkdir -p "build-${_arch}-${_config%%: *}" && pushd "build-${_arch}-${_config%%: *}"
      make DESTDIR="${pkgdir}" install-mingw-w64-strip
      popd
    done
  done
}
