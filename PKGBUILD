# Maintainer: Yngve Levinsen <yngve.levinsen@ess.eu>

pkgname=madx-git
pkgver=5.08.01.r162.g02249df0
pkgrel=1
pkgdesc="Accelerator Optics simulation code, git master version"
url="http://cern.ch/mad"
license=("custom")
depends=('libx11' 'lapack')
conflicts=('madx-dev' 'nmap')
provides=('madx')
makedepends=('git' 'cmake')
arch=('i686' 'x86_64')
_gitname=MAD-X
source=("git+https://github.com/MethodicalAcceleratorDesign/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
    cd $_gitname
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
    #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/
    [ -d "build" ] && rm -rf build
    mkdir build
    cd build


    cmake -DCMAKE_C_COMPILER=gcc \
          -DCMAKE_Fortran_COMPILER=gfortran \
          -DBLA_VENDOR=Generic \
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
