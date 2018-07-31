# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

gitname=Translator
author=RapidFingers
auxname=translator
pkgname=("${auxname}-git")
pkgver=latest
pkgrel=1
pkgdesc="Translater app that uses Yandex API. Designed for Pantheon"
arch=('i686' 'x86_64')
url="https://github.com/${author}/${gitname}"
license=('GPL3')
depends=('gtk3' 'vala' 'granite' 'glib2' 'json-glib' 'libgee' 'libsoup')
optdepends=()
makedepends=('cmake' 'git' 'vala')
provides=("${auxname}")
conflicts=("${auxname}")
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

