# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=bertini
pkgver=1.6
pkgrel=3
pkgdesc="Homotopy continuation solver for systems of polynomial equations"
url="https://bertini.nd.edu/"
arch=('i686' 'x86_64')
license=('custom: Bertini license')
depends=('boost' 'mpfr')
optdepends=('openmpi: multithreading support')
source=("${url}/BertiniSource_v${pkgver}.tar.gz"
        "${url}/BertiniUsersManual.pdf")
sha256sums=('0bc4c5f0b057366500fc62b37526af116cadb7dcc190ca454e0ebe00a8998998'
            '017313464d162bb32640858faa0dc40ec8498eee439cb703dc22507baa15394f')

prepare () {
  cd ${srcdir}/BertiniSource_v${pkgver/./}

  # workaround for OpenMPI 4 compatibility
  find . -type f -exec sed -i -e s/MPI_Address/MPI_Get_address/ -e s/MPI_Type_struct/MPI_Type_create_struct/ {} +

  rm aclocal.m4 Makefile.in
  aclocal
  automake --add-missing
  autoconf
}

build () {
  cd ${srcdir}/BertiniSource_v${pkgver/./}
  ./configure --prefix=/usr --includedir=/usr/include/bertini
  make
}

package() {
  cd ${srcdir}
  install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" BertiniUsersManual.pdf
  cd BertiniSource_v${pkgver/./}
  install -D -m644 Bertini_License -t "${pkgdir}/usr/share/licenses/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
