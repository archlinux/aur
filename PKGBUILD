# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor:

_gitname=torrential
_author=davidmhewitt
pkgname=("${_gitname}-git")
pkgver=r219.465f834
pkgrel=1
pkgdesc="Download torrents in style with this speedy, minimalist torrent client designed for Pantheon Shell"
arch=('i686' 'x86_64')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
depends=('gtk3' 'granite' 'curl' 'libb64' 'libevent' 'libnatpmp' 'libunity' 
		 'libtransmission' 'libutp-git' 'miniupnpc' 'openssl')
optdepends=()
makedepends=('cmake' 'vala' 'git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
  cd "${_gitname}"
  install -d build
}

build() {
  cd "${_gitname}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${_gitname}/build"
  make DESTDIR="${pkgdir}" install
}

