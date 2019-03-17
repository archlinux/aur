# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: joezuntz
_pkgname=cosmosis
pkgname=cosmosis
pkgver=v1.6rc1.r1.2a9d319
pkgrel=1
pkgdesc="A cosmological parameter estimation code."
arch=('x86_64' 'i686')
url="http://bitbucket.org/joezuntz/cosmosis"
license=('GPL3')
depends=('git' 'cfitsio' 'fftw' 'lapack' 'gsl' 'gcc' 'python2' 'python2-numpy' 'python2-scipy' 'python2-nose' 'python2-pyaml' 'python2-matplotlib' 'python' 'python-numpy' 'python-scipy' 'python-nose' 'python-pyaml' 'python-matplotlib')
makedepends=('git' 'cfitsio' 'fftw' 'lapack' 'gsl' 'gcc' 'python2' 'python2-numpy' 'python2-scipy' 'python2-nose' 'python2-pyaml' 'python2-matplotlib' 'python' 'python-numpy' 'python-scipy' 'python-nose' 'python-pyaml' 'python-matplotlib' 'gcc-fortran')
source=("${_pkgname}::git+${url}")
#noextract=()
md5sums=('SKIP')

pkgver() {
	 cd $_pkgname
	 printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	  cd "$srcdir"/$_pkgname
	  echo "export COSMOSIS_SRC_DIR=${srcdir}/${_pkgname}" >> setup-my-cosmosis
	  echo "export GSL_INC=/usr/include" >> setup-my-cosmosis
	  echo "export GSL_LIB=/usr/lib" >> setup-my-cosmosis
	  echo "export CFITSIO_INC=/usr/include" >> setup-my-cosmosis
	  echo "export CFITSIO_LIB=/usr/lib" >> setup-my-cosmosis
	  echo "export FFTW_LIBRARY=/usr/lib" >> setup-my-cosmosis
	  echo "export FFTW_INCLUDE_DIR=/usr/include" >> setup-my-cosmosis
	  echo "export LAPACK_LINK='-L/usr/lib -llapack -lblas'" >> setup-my-cosmosis
	  echo "export DYLD_LIBRARY_PATH=/usr/lib64:${COSMOSIS_SRC_DIR}/cosmosis/datablock/:${COSMOSIS_SRC_DIR}/cosmosis-standard-library/likelihood/:${COSMOSIS_SRC_DIR}/cosmosis-standard-library/likelihood/planck/plc-1.0/lib/:${COSMOSIS_SRC_DIR}/cosmosis-standard-library/likelihood/planck2015/plc-2.0/lib/" >> setup-my-cosmosis
	  echo "export LD_LIBRARY_PATH=/usr/lib:${COSMOSIS_SRC_DIR}/cosmosis/datablock/:${COSMOSIS_SRC_DIR}/cosmosis-standard-library/likelihood/planck/plc-1.0/lib/:${COSMOSIS_SRC_DIR}/cosmosis-standard-library/likelihood/planck2015/plc-2.0/lib/:/usr/lib:/usr/lib:${LD_LIBRARY_PATH}" >> setup-my-cosmosis
	  echo "export PYTHONPATH=${COSMOSIS_SRC_DIR}:${PYTHONPATH}" >> setup-my-cosmosis
	  echo "export PATH=${COSMOSIS_SRC_DIR}/bin:$/usr/lib:/usr/bin:${PATH}" >> setup-my-cosmosis	  
}

build() {
	cd "$srcdir"/$_pkgname
	git checkout
	git clone http://bitbucket.org/joezuntz/cosmosis-standard-library
	cd cosmosis-standard-library
	git checkout
	cd ..
	source setup-my-cosmosis
	make
}


package() {
	  cd $_pkgname
	  source setup-my-cosmosis
	  make DESTDIR="$pkgdir"
}
