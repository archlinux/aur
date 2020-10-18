# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=dolfin-git
pkgdesc="C++ interface of FEniCS for ordinary and partial differential equations."
pkgver=20201015
pkgrel=4
arch=('i686' 'x86_64')
url="https://github.com/FEniCS/dolfinx"
license=('GPL3')
groups=('fenics-git')
depends=('cppunit' 'eigen' 'gl2ps' 'python-ffc-git' 'petsc' 'slepc')
makedepends=('git' 'boost')
options=(!emptydirs)
source=("dolfin::git+https://github.com/FEniCS/dolfinx.git")
md5sums=('SKIP')

pkgver() {
    cd dolfin
    git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
    cd dolfin/cpp
    [ -d build ] && rm -rf build
    mkdir build
    cd build

    [ -n "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh
    [ -e /etc/profile.d/slepc.sh ] && [ -n "$SLEPC_DIR" ] && source /etc/profile.d/slepc.sh

    cmake ..\
          -DCMAKE_INSTALL_PREFIX="${pkg}"/usr \
          -DCMAKE_INSTALL_LIBDIR=lib \
          -DCMAKE_SKIP_BUILD_RPATH=TRUE \
          -DCMAKE_SKIP_RPATH=TRUE \
          -DCMAKE_BUILD_TYPE="Release"

    make
}

package() {
    cd dolfin/cpp/build
    make install DESTDIR="${pkgdir}"
}
