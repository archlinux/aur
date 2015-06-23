# Maintainer: sxe <sxxe@gmx.de>

pkgname=kcm_baloo_advanced
_pkgname=baloo-kcmadv
pkgver=v1.00.00.r0.g35991b9
pkgrel=3
pkgdesc="Advanced KCM module for baloo file"
url="https://gitlab.com/ericlnu/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('baloo' )
makedepends=('cmake' 'automoc4' 'git')
source=("git+https://gitlab.com/ericlnu/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  mkdir -p "$srcdir/build"
  sed -i.bak 's/org::kde::baloo::file/OrgKdeBalooInterface/' $srcdir/baloo-kcmadv/kcm.h
  sed -i.bak 's/org::kde::baloo::file/OrgKdeBalooInterface/' $srcdir/baloo-kcmadv/kcm.cpp
}

build() {
  cd "$srcdir/build"

  cmake ../$_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
}
