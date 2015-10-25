# Maintainer: mickele <mimocciola[at]yahoo[dot]com>
pkgname=python2-ifcopenshell
pkgver=0.4.0
pkgrel=1
pkgdesc="Open source IFC library and geometry engine. Python-2 version."
url="http://ifcopenshell.org/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('opencascade' 'opencollada' 'boost-libs>=1.58.0' 'python2' 'python')
optdepends=()
makedepends=('cmake' 'boost>=1.58.0' 'swig')
conflicts=()
replaces=()
backup=()
source=("https://github.com/IfcOpenShell/IfcOpenShell/archive/v${pkgver}.tar.gz" "boost-1.58.patch")

prepare(){
  cd "${srcdir}/IfcOpenShell-${pkgver}"

  patch -Np1 -i "${srcdir}/boost-1.58.patch"
}

build() {
  cd "${srcdir}/IfcOpenShell-${pkgver}"
  for _FILE in `grep -Rl "COMMAND python" *`; do
    sed -e "s|COMMAND python|COMMAND python2|" -i ${_FILE}
  done
  mkdir -p build
  cd "${srcdir}/IfcOpenShell-${pkgver}/build"
  local _pythonver=$(python2 --version 2>&1)
  cmake ../cmake \
  	-DCMAKE_INSTALL_PREFIX=/usr \
	-DOCC_INCLUDE_DIR=/opt/opencascade/inc \
	-DOCC_LIBRARY_DIR=/opt/opencascade/lib \
	-DOPENCOLLADA_INCLUDE_DIR=/usr/include/opencollada \
	-DOPENCOLLADA_LIBRARY_DIR=/usr/lib/opencollada \
        -DPYTHON_INCLUDE_DIR:PATH=/usr/include/python${_pythonver:7:3} \
        -DPYTHON_LIBRARY:FILEPATH=/usr/lib64/libpython${_pythonver:7:3}.so
  make
}

package() {
  cd "${srcdir}/IfcOpenShell-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/IfcOpenShell-${pkgver}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # file already provided by ifcopenshell
  rm -f "${pkgdir}"/usr/lib/libIfc*.a
  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/include"
}

md5sums=('12bbb9726d8012cf88222f5921a767c3'
         '9628e73de9049ae183774aa2363b6fda')
