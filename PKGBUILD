# Maintainer: George Eleftheriou <eleftg>
# Contributor: George Eleftheriou <eleftg>
 
pkgname=su2
pkgver=4.0.0
pkgrel=1
pkgdesc="open-source collection of software tools written in C++ for performing Partial Differential Equation (PDE) analysis and solving PDE-constrained optimization problems"
url="http://su2.stanford.edu/index.html"
license=('LGPL')
depends=('lapack' 'jsoncpp' 'cgns' 'zlib' 'openmpi' 'bzip2'
         'hdf5-openmpi')
makedepends=('git')
arch=('any')
source=("git+https://github.com/su2code/SU2#tag=v${pkgver}"
        "configure.ac.patch")
install="${pkgname}.install"
sha256sums=('SKIP'
            '5173fdaa4fecaa3913e9edcb6bb1ab5f8ff2f5fab285e19be44775cc1d7a2bd8')

prepare() {
  cd "${srcdir}/SU2"
  patch < "${srcdir}/configure.ac.patch"
  autoreconf -i
  echo "export PATH=\${PATH}:/opt/${pkgname}/bin" > "${srcdir}/su2_env.sh"
}

build() {
  cd "${srcdir}/SU2"

  ./configure --prefix="/opt/${pkgname}" --enable-mpi \
  --with-cxx=/usr/bin/mpicxx --with-cc=/usr/bin/mpicc \
  --with-CGNS-lib=/usr/lib --with-CGNS-include=/usr/include \
  --with-Jsoncpp-lib=/usr/lib --with-Jsoncpp-include=/usr/include \
  --with-LAPACK-lib=/usr/lib --with-LAPACK-include=/usr/include LIBS="-lhdf5"
 
  make
}

package() {
  cd "${srcdir}/SU2"
  make prefix="${pkgdir}/opt/${pkgname}" install
  install -D -m755 "${srcdir}/su2_env.sh" "${pkgdir}/etc/profile.d/su2_env.sh"
}
