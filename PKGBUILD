# Maintainer: Yngve Inntjore Levinsen <yngveTODlevinsenTAcernTODch>

pkgname=madx-git
pkgver=r6826.f631c86e
pkgrel=1
pkgdesc="Accelerator Optics simulation code, git master version"
url="http://cern.ch/mad"
license=("custom")
depends=('gcc-libs' 'libx11')
conflicts=('madx-dev')
provides=('madx')
makedepends=('git' 'cmake')
arch=('i686' 'x86_64')

_gitroot=https://github.com/MethodicalAcceleratorDesign/MAD-X.git
_gitname=MAD-X

pkgver() {
    cd $_gitname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  if [ -d $_gitname ]
  then
    cd $_gitname
    git pull
  else
     git clone $_gitroot $_gitname
     cd $_gitname
  fi
}
build() {
    cd $srcdir/
    [ -d "build" ] && rm -rf build
    mkdir build
    cd build


    cmake -DCMAKE_C_COMPILER=gcc \
          -DCMAKE_Fortran_COMPILER=gfortran \
          -DMADX_STATIC=OFF \
          -DMADX_ONLINE=OFF \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
         ../$_gitname

      make
}

package() {
    cd ${srcdir}/build
    make DESTDIR=${pkgdir} install

    cd ${srcdir}/$_gitname
    install -D -m644 License.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
