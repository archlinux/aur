# Maintainer: Jure Varlec <jure@varlec.si>
# Contributor: Giuseppe Marco Randazzo <gmrandazzo@gmail.com>
pkgname=ball
_pkgname=BALL
pkgver=1.4.2
pkgrel=4
pkgdesc="Application framework in C++ for Computational Molecular Biology and Molecular Modeling."
arch=("i686" "x86_64")
url="http://www.ball-project.org/"
license=('LGPL')
groups=()
depends=('fftw' 'gsl' 'glew' 'lpsolve' 'python2' 'qt4' 'libsvm' 'lapack' 'boost-libs' 'libgl')
makedepends=('eigen' 'flex' 'bison' 'intel-tbb' 'boost')
provides=()
source=("http://abibuilder.informatik.uni-tuebingen.de/archive/ball/BALL/stable/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	"${_pkgname}-${pkgver}-PersistentObject_cast.patch"
	"${_pkgname}-${pkgver}-Qt_macro.patch"
        "${_pkgname}-${pkgver}-link_view_X11.patch"
	)

md5sums=('5a6153d07b417421feb702cd0a5bd2df'
	 'fd446b28c76146b057e3b642f9b19f72'
	 'ef374b4e94456be9860a2923a1b20077'
         '49c955cae5602d3a804732239849f304'
	 )

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch -p1 < $srcdir/${_pkgname}-${pkgver}-PersistentObject_cast.patch
  patch -p1 < $srcdir/${_pkgname}-${pkgver}-Qt_macro.patch
  patch -p1 < $srcdir/${_pkgname}-${pkgver}-link_view_X11.patch
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
