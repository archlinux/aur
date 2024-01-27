# Maintainer:
# Contributor: Peter Mattern <pmattern at arcor dot de>

_pkgname='fatrat'
pkgname="$_pkgname-git"
pkgver=1.2.0.b2.r60.g1b0dd1f6
pkgrel=1
pkgdesc='Qt download and upload manager'
url="https://github.com/LubosD/fatrat"
license=('GPL-3.0-only')
arch=('i686' 'x86_64')

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
  'ninja'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_branch='develop'
_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#branch=$_branch")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=8 | sed 's/_/./; s/beta/b/; s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -GNinja
    -DCMAKE_INSTALL_PREFIX='/usr'

    -DWITH_BITTORRENT=ON
    #-DWITH_JABBER=ON
    -DWITH_NLS=ON
    -DWITH_DOCUMENTATION=ON
    -DWITH_WEBINTERFACE=OFF
    -DWITH_CURL=ON
    #-DWITH_JPLUGINS=ON

    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
