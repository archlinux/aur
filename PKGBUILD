# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Sevenseven < forauronly AT gmail.com >

pkgname=libmediawiki-git
pkgver=1.0.0.r17.g8741b29
pkgrel=1
pkgdesc='A KDE C++ interface for MediaWiki based web service as wikipedia.org'
arch=('i686' 'x86_64')
url='https://invent.kde.org/libraries/libmediawiki'
license=('GPL2')
depends=('qt5-base' 'kcoreaddons')
makedepends=('git' 'extra-cmake-modules' 'kdoctools')
provides=("libmediawiki=${pkgver}")
conflicts=('libmediawiki')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/libmediawiki"

  # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
  local _gitversion=$(git describe --long --tags --match 'v[0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

  # Format git-based version for pkgver
  echo "${_gitversion}" | sed \
    -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
    -e 's|\([0-9]\+-g\)|r\1|' \
    -e 's|-|.|g'
}

prepare() {
if [[ -d "${srcdir}/build" ]]; then
      msg "Cleaning the previous build directory..."
      rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake "${srcdir}/libmediawiki" -DCMAKE_BUILD_TYPE=Release \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DLIB_INSTALL_DIR=lib \
                -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
                -DBUILD_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
