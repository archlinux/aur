# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

gitname=configurator
pkgname=("${gitname}-git")
pkgver=latest
pkgrel=1
pkgdesc="Stylish dconf editor designed for elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/cassidyjames/${gitname}"
license=('GPL3')
depends=('gtk3' 'vala' 'granite' 'glib2')
optdepends=('lib32-glib2')
makedepends=('cmake' 'vala' 'git')
provides=("${gitname}")
conflicts=("${gitname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${gitname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
  cd "${gitname}"
  install -d build
}

build() {
  cd "${gitname}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${gitname}/build"
  make DESTDIR="${pkgdir}" install
}

