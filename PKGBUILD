# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor:

_gitname=gcleaner-vala
_author=gcleaner
pkgname=gcleaner-git
pkgver=r42.50fc6e4
pkgrel=2
pkgdesc="This is the original version of GCleaner writen in Vala lang"
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
depends=('gtk3' 'granite' 'glib2' 'json-glib')
optdepends=('lib32-glib2')
makedepends=('git' 'cmake' 'vala')
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

