# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname='g4python-git'
pkgrel=1
pkgver=11.0.0
pkgdesc="Geant4 python Bindings"
depends=('pybind11' 'geant4')
makedepends=('cmake')
provides=('g4python')
arch=('x86_64')
source=(
  "$pkgname"::"git+https://github.com/koichi-murakami/g4python.git"
  "g4python.install"
  "Geant4Config_cmake.patch"
  "config_cmake.patch"
)
sha256sums=(
  'SKIP'
  '34c4d158305d85a9408bf15683557395a250019e653a5e7f740992be50b950d4'
  'd1fc6a1fc5716ba915ad8a88b1505557cf34dff54db40fbf1d4e145814c4d38b'
  'c8731e74b01d563ba23cfa7b68097af17d944917a4c7f8eb804612ab608c43ae'
  )
install=g4python.install
# The GIT repository does not have tags, but the last version there is 11.0.0
#
#pkgver() {
#  cd "$pkgname"
#  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
  cd ${srcdir}
  echo "
export PYTHONPATH=/opt/Geant4/geant4py-11.0.0/site-packages" > g4python.sh

cd ${srcdir}/g4python-git
  patch config.cmake < ${srcdir}/config_cmake.patch

  cd ${srcdir}/g4python-git/cmake
  patch Geant4Config.cmake < ${srcdir}/Geant4Config_cmake.patch

}

package() {
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  cmake ../g4python-git -DGEANT4_LIBRARY_DIR=/opt/Geant4/Geant4-v11.1.0/lib -DCMAKE_INSTALL_PREFIX=${pkgdir}/opt/Geant4/geant4py-${pkgver}
  make
  make install prefix=${pkgdir}/opt/Geant4/geant4py-${pkgver}

  cd ${srcdir}
  install -D -m 755 g4python.sh $pkgdir/etc/profile.d/g4python.sh
}
