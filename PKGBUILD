# Maintainer: Achmad Fathoni <fathoniDOTidATgmailDOTcom>
_pkgname=RTKLIB
pkgname=rtklib-emlid-git
provides=("rtklib-qt")
pkgver=r587.81b5a61
pkgrel=3
pkgdesc="An Open Source Program Package for GNSS Positioning tuned for Emlid Device"
arch=('x86_64')
url="https://github.com/emlid/RTKLIB/tree/reach"
license=('GPL')
groups=('GNSS')
depends=('glibc' 'qt5-base' 'qt5-serialport')
makedepends=('git' 'gcc-fortran')
source=("${_pkgname}::git+https://github.com/emlid/RTKLIB.git#branch=reach"
        "https://github.com/emlid/RTKLIB/pull/110.patch"
        "https://github.com/emlid/RTKLIB/pull/111.patch")
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
    cd "${_pkgname}"
    patch --forward --strip=1 --input="${srcdir}/110.patch"
    patch --forward --strip=1 --input="${srcdir}/111.patch"
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
