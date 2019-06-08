# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=slingscold
_author=chrisnharvey
pkgname=("${_gitname}-git")
pkgver=r15.df2116e
pkgrel=1
pkgdesc="Slingscold fork with modifications for Molly-Rose Linux"
arch=('i686' 'x86_64')
url="https://gitlab.com/${_author}/${_gitname}"
license=('GPL3')
depends=('libunique' 'libgee06' 'gnome-menus2' 'libwnck' 'gtk2' 'cairo')
optdepends=('lib32-glib2')
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

