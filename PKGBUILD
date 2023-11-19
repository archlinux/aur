# Maintainer:
# Contributor: Peter Mattern <pmattern at arcor dot de>

_pkgname='fatrat'
pkgname="$_pkgname-git"
pkgver=1.2.0.b2.r60.g1b0dd1f
pkgrel=1
pkgdesc='Qt Download/Upload Manager'
arch=('i686' 'x86_64')
url="https://github.com/LubosD/fatrat"
license=('GPL3')
depends=(
  'libtorrent-rasterbar'
  'qt5-svg'
  'qt5-tools'
  'qt5-webengine'

  # 'poco' # for webui
)
optdepends=(
  'desktop-file-utils: add application to MIME database'
)
makedepends=(
  'boost'
  'cmake'
  'git'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_branch='develop'
_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#branch=$_branch")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed 's/_/./; s/beta/b/; s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DWITH_DOCUMENTATION=ON
    -DWITH_NLS=ON
    -DWITH_CURL=ON
    -DWITH_BITTORRENT=ON
    -DWITH_WEBINTERFACE=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
