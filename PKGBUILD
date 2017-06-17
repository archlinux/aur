# Maintainer: Xwang <xwaang1976@gmail.com>
# Contributor: George Eleftheriou <eleftg>
 
pkgname=su2
pkgver=5.0.0
pkgrel=1
pkgdesc="Open-source collection of software tools written in C++ for performing Partial Differential Equation (PDE) analysis and solving PDE-constrained optimization problems"
url="http://su2.stanford.edu/index.html"
license=('LGPL')
depends=('python' 'openmpi')
makedepends=('git')
arch=('i686' 'x86_64')
source=("git+https://github.com/su2code/SU2"
        "git+https://github.com/su2code/TestCases"
        "configure.ac.patch")
install="${pkgname}.install"
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

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
  CXXFLAGS="-O3"
 
  make
}

package() {
  cd "${srcdir}/SU2"
  make prefix="${pkgdir}/opt/${pkgname}" install
  install -D -m755 "${srcdir}/su2_env.sh" "${pkgdir}/etc/profile.d/su2_env.sh"
}
