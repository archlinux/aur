# Maintainer: Aetf <aetf@unlimitedcodeworks.xyz>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=kio-gdrive
pkgname=${_pkgname}-git
pkgver=1.2.4.r82.gecf8a41
pkgrel=2
arch=(i686 x86_64)
pkgdesc="KIO Slave to access Google Drive"
url="https://projects.kde.org/kio-gdrive"
license=(GPL)
depends=(libkgapi kaccounts-providers)
makedepends=(extra-cmake-modules git kdesignerplugin intltool kdoctools)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git://anongit.kde.org/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_pkgname \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install
}
