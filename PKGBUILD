# Maintainer: George Eleftheriou <eleftg>
# Contributor: George Eleftheriou <eleftg>
 
pkgname=su2
pkgver=3.2.9
pkgrel=3
pkgdesc="open-source collection of software tools written in C++ for performing Partial Differential Equation (PDE) analysis and solving PDE-constrained optimization problems"
url="http://su2.stanford.edu/index.html"
license=('LGPL')
depends=('lapack' 'jsoncpp' 'libcgns-paraview' 'zlib' 'openmpi' 'bzip2'
         'hdf5-openmpi')
makedepends=('git')
arch=('any')
source=("git+https://github.com/su2code/SU2#tag=v3.2.9"
        "configure.ac.patch")
install="${pkgname}.install"
sha256sums=('SKIP'
            '5f6de8db5c15fa1a1e60dae5bb640ab2d4a17e62934689ee97073199439daa47')

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
