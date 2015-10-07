#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="A robot simulation, planning, and control package from Indiana University / Duke University."
url='http://klampt.org'
pkgname=klampt
pkgver=0.6.1
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake')
depends=('assimp' 'boost' 'freeglut' 'glpk' 'glui' 'krislibrary' 'libxi' 'libxmu' 'ode'
         'python2' 'python2-opengl' 'qt4')
optdepends=()
_dir=Klampt-${pkgver}
source=("https://github.com/krishauser/Klampt/archive/v${pkgver}.tar.gz")
sha256sums=("cccf773afd60554d5347a611f1c24e98545b0dbd3e1c125a9a4cbeb1f778f99a")

prepare() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  # Dirty fixes
  # TODO: report that upstream
  sed -i "s,PYTHON \"python\",PYTHON \"python2\",g" "${srcdir}/${_dir}/Python/CMakeLists.txt"
  sed -i "s,\${SUDO},,g" "${srcdir}/${_dir}/Python/CMakeLists.txt"
  sed -i "s,'klampt/src','${srcdir}/${_dir}/Python/klampt/src',g" "${srcdir}/${_dir}/Python/setup.py.in"
  sed -i "s;packages=\['klampt'\];packages=['klampt'],package_dir={'': os.path.join(\"\${CMAKE_SOURCE_DIR}\",\"Python\")};g" "${srcdir}/${_dir}/Python/setup.py.in"
  sed -i "s,COMMAND \${PYTHON} setup.py install,COMMAND \${PYTHON} ${srcdir}/build/Python/setup.py install --root=$pkgdir --optimize=1 --skip-build,g" "${srcdir}/${_dir}/Python/CMakeLists.txt"
  sed -i "s,ADD_SUBDIRECTORY(Examples),\#ADD_SUBDIRECTORY(Examples),g" "${srcdir}/${_dir}/CMakeLists.txt"
  #sed -i "s,DESTINATION Examples,DESTINATION share/Klampt/Examples,g" "${srcdir}/${_dir}/Examples/CMakeLists.txt"

  # TODO: re-enable + fix examples

  cmake "${srcdir}/${_dir}" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=Release
}

build() {
  cd "${srcdir}/build"
  make
}

#check() {
#    cd "${srcdir}/build/test"
#    make test
#}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
  mkdir -p "${pkgdir}/usr/share/Klampt"
  mv "${pkgdir}/usr/"{Python,data} "${pkgdir}/usr/share/Klampt/"
}
