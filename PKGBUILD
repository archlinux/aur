# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Alexey D. <lq07829icatm at rambler.ru>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=ark-git
pkgver=22.04.0.r13.g3981425a
pkgrel=1
pkgdesc="Archiving Tool"
arch=(i686 x86_64)
url='http://kde.org/applications/utilities/ark/'
license=(GPL)
depends=(kparts-git kpty-git libarchive-git libzip kitemmodels-git hicolor-icon-theme)
makedepends=(extra-cmake-modules-git git kdoctools-git python)
optdepends=(p7zip zip unzip unrar)
provides=(ark)
conflicts=(ark)
source=('git+https://invent.kde.org/utilities/ark.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}

  # Generate git tag based version. Count only proper v#.#* [#=number] tags.
  local _gitversion=$(git describe --long --tags --match 'v[0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

  # Format git-based version for pkgver
  echo "${_gitversion}" | sed \
    -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
    -e 's|\([0-9]\+-g\)|r\1|' \
    -e 's|-|.|g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ark \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
