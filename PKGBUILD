# Maintainer:  gagnonlg NOSPAM protonmail NOSPAM com
# See also: https://github.com/paulgessinger/dd4hep-aur
pkgname=dd4hep
_pkgver=01-19
pkgver=$(echo $_pkgver | sed 's/-/./g')
pkgrel=1
pkgdesc="Detector Description Toolkit for High Energy Physics"
arch=('x86_64')
url="https://dd4hep.web.cern.ch/dd4hep/"
license=('LGPL3')
depends=('xerces-c'
	 'geant4>=10.2.2'
	 'root>=6.08'
	 'boost-libs>=1.49'
	 'intel-tbb'
	 'cern-vdt'
        )
makedepends=('boost>=1.49' 'cmake>=3.12')
source=(https://github.com/AIDASoft/$pkgname/archive/v$_pkgver.tar.gz)
md5sums=('c439da43813ecf3d417d9edc2cfb605b')

prepare () {
  _pyver="$(python -V | awk '{print $2}')"
  sed -i "s/SET(REQUIRE_PYTHON_VERSION \${ROOT_PYTHON_VERSION})/SET(REQUIRE_PYTHON_VERSION \"$_pyver\")/" \
      "$srcdir/DD4hep-$_pkgver"/cmake/DD4hepBuild.cmake
}

build() {
  cd "$srcdir/DD4hep-$_pkgver"
  mkdir -p build && cd build

  # NOTE: build currently fails with latest tbb, so turned off for now

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_CXX_STANDARD=17 \
	-DDD4HEP_USE_GEANT4=ON \
	-DDD4HEP_USE_TBB=OFF \
	-DDD4HEP_USE_XERCESC=ON \
	..

  make
}

package() {
  cd "$srcdir/DD4hep-$_pkgver/build"

  make DESTDIR="${pkgdir}" install
}
