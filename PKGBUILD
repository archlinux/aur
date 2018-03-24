# $Id$
# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>

_dwnnum=486
pkgname=yaxt
pkgver=0.5.2
pkgrel=1
pkgdesc="Yet Another eXchange Tool"
arch=("i686" "x86_64")
url="https://www.dkrz.de/redmine/projects/yaxt"
depends=('openmpi')
options=('!libtool' '!makeflags')
license=('custom')
source=(https://www.dkrz.de/redmine/attachments/download/${_dwnnum}/${pkgname}-${pkgver}.tar.gz LICENSE)
md5sums=('7d6a8214b70b322848f01f650f12c503'
         '49dfdde5efdb4300973164ae321f549c')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # Fix for building on laptop...
  sed -i configure -e 's/MPI_LAUNCH -n 4/MPI_LAUNCH -n 2/' \
                   -e 's/EXEEXT 4/EXEEXT 2/'
  ./configure --prefix=/usr CC=mpicc FC=mpif90 FCFLAGS="$FCFLAGS -cpp"
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
