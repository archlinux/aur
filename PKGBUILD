# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

gitname=monitor
auxname=("pantheon-system-${gitname}")
pkgname=("${auxname}-git")
pkgver=latest
pkgrel=1
pkgdesc="Manage processes and monitor system resources. 
        Designed for elementary OS"
arch=('i686' 'x86_64')
url="https://github.com/stsdc/${gitname}"
license=('GPL3')
depends=('granite' 'gtk3' 'vala'
         'bamf' 'glib2' 'glibc' 'libgee' 'libgtop' 'libwnck3')
optdepends=('lib32-glib2')
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

