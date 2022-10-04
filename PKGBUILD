# Contributor: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >
pkgname=mcnptools-git
_pkgname=mcnptools
pkgver=r2.d476edf
pkgrel=1
tag=v${pkgver}
pkgdesc="Several utility programs to perform common tasks when interacting with the MCNP® code"
url="https://github.com/lanl/mcnptools"
license=('BSD-3')
arch=('x86_64')
makedepends=('git' 'cmake')
depends=('hdf5' 'python')
source=($pkgname::git+https://github.com/lanl/mcnptools.git)
sha256sums=('SKIP')
provides=(${_pkgname})
conflicts=(${_pkgname})

pkgver() {
  cd ${srcdir}/${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
    cd ${srcdir}/${pkgname}
    msg "git checkout main"
    git checkout main
    msg "git fetch origin"
    git fetch origin
}

build() {
    rm -rf ${srcdir}/build
    mkdir ${srcdir}/build
    cd ${srcdir}/build
    cmake -D CMAKE_INSTALL_PREFIX=/usr \
          -D mcnptools.python_install=User \
          ../${pkgname}
    cmake --build . --config Release
}

check(){
    cd ${srcdir}/build
    ctest --build-config Release
}

package() {
    cd ${srcdir}/build
    DESTDIR="$pkgdir" cmake --install . --config Release
}
