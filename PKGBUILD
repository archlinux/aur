# Maintainer: Jure Varlec <jure.varlec@gmail.com>
# Contributor: Giuseppe Marco Randazzo <gmrandazzo@gmail.com>
pkgname=ball
_pkgname=BALL
pkgver=1.4.2
pkgrel=3
pkgdesc="Application framework in C++ for Computational Molecular Biology and Molecular Modeling."
arch=("i686" "x86_64")
url="http://www.ball-project.org/"
license=('LGPL')
groups=()
depends=('fftw' 'gsl' 'glew' 'lpsolve' 'python2' 'qt4' 'libsvm' 'lapack' 'boost-libs' 'libgl')
makedepends=('eigen' 'flex' 'bison' 'intel-tbb' 'boost')
provides=()
source=("${_pkgname}-${pkgver}.tar.gz::http://www.ball-project.org/Downloads/v${pkgver}/${_pkgname}-${pkgver}.tar.gz/@@download"
	"${_pkgname}-${pkgver}-PersistentObject_cast.patch"
	"${_pkgname}-${pkgver}-Qt_macro.patch"
	)

md5sums=('5a6153d07b417421feb702cd0a5bd2df'
	 'fd446b28c76146b057e3b642f9b19f72'
	 'ef374b4e94456be9860a2923a1b20077'
	 )

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch -p1 < $srcdir/${_pkgname}-${pkgver}-PersistentObject_cast.patch
  patch -p1 < $srcdir/${_pkgname}-${pkgver}-Qt_macro.patch
  cd ..
  mkdir -p build
  cd build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBALL_PYTHON_SUPPORT=OFF		# broken with current SIP

  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
