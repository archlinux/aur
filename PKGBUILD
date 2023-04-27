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
provides=("$_pkgname")
conflicts=(${provides[@]})

_branch='develop'
source=(
  "$_pkgname"::"git+$url#branch=develop"
)
sha256sums=(
  "SKIP"
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/_/./; s/beta/b/; s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build \
        -S "$_pkgname" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_DOCUMENTATION=ON \
        -DWITH_NLS=ON \
        -DWITH_CURL=ON \
        -DWITH_BITTORRENT=ON \
        -DWITH_WEBINTERFACE=OFF

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
