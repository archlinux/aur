# Maintainer: Achmad Fathoni <fathoniDOTidATgmailDOTcom>
_pkgname=RTKLIB
pkgname=rtklib-emlid-git
provides=("rtklib-qt")
pkgver=r587.81b5a61
pkgrel=1
pkgdesc="An Open Source Program Package for GNSS Positioning tuned for Emlid Device"
arch=('x86_64')
url="https://github.com/emlid/RTKLIB/tree/reach"
license=('GPL')
groups=('GNSS')
depends=('glibc')
makedepends=('git' 'gcc-fortran' 'qt5-base')
source=("${_pkgname}::git+https://github.com/emlid/RTKLIB.git#branch=reach" "fix.patch")
sha256sums=('SKIP' 'ec8c224aabd6f8b90fc3c86afe6df20bca457e2884ee61988161d3903e0fae6b')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
    cd "${_pkgname}"
    patch --forward --strip=1 --input="${srcdir}/fix.patch"
    find . -name "*_qt.pro*" -exec sed -i '$ a target.path = /usr/bin\nINSTALLS += target' {} \;
}

build() {
    cd "${_pkgname}"
    mkdir -p build && cd build
    qmake -recursive ..
    make
}

package() {
    make -C ${_pkgname}/build INSTALL_ROOT="$pkgdir" install
}
