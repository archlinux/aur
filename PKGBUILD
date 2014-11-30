# Maintainer: Yngve Inntjore Levinsen <yngveTODlevinsenTAcernTODch>

pkgname=madx-svn
pkgver=4727
pkgrel=1
pkgdesc="Accelerator Optics simulation code, svn trunk version"
url="http://cern.ch/mad"
license=("custom")
depends=('gcc-libs' 'libx11')
conflicts=('madx-dev')
provides=('madx')
makedepends=('subversion' 'cmake')
arch=('x86_64')

source=('madX::svn+http://svnweb.cern.ch/guest/madx/trunk/madX')
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/madX" &&  svnversion
}

prepare() {
    cd madX

    msg "Patching.."
    # when patch level is 00 we want this:
    #patch -p0 -i ../../madx_install_header.patch

    msg "Configuring.."
    # Note, BINARY_POSTFIX forced to not conflict with package 'madx' 
    cmake -DCMAKE_C_COMPILER=gcc \
          -DCMAKE_Fortran_COMPILER=gfortran \
          -DMADX_STATIC=OFF \
          -DMADX_ONLINE=OFF \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DBINARY_POSTFIX=_dev \
          -DCMAKE_BUILD_TYPE=RelWithDebInfo \
         .

}
build() {
    cd madX

    msg "Starting make..."

    make
}

check() {
     cd madX
     ctest -E LONG
}

package() {
    pwd
    cd madX
    make DESTDIR=${pkgdir} install

    cd ${srcdir}/${_svnmod}/madX
    install -D -m644 License.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
