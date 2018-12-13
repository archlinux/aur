# $Id$
# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>

_dwnnum=488
pkgname=yaxt
pkgver=0.6.0
pkgrel=1
pkgdesc="Yet Another eXchange Tool"
arch=("i686" "x86_64")
url="https://www.dkrz.de/redmine/projects/yaxt"
depends=('openmpi')
options=('!libtool' '!makeflags')
license=('custom')
source=(https://www.dkrz.de/redmine/attachments/download/${_dwnnum}/${pkgname}-${pkgver}.tar.gz LICENSE)
md5sums=('01b1eb334401e388bc835a1e6fc370e5'
         '035e9ac10ea37067d3f7b178abafa029')

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
