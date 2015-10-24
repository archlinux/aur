# Maintainer: mickele <mimocciola[at]yahoo[dot]com>
pkgname=ifcopenshell
pkgver=0.4.0rc2
_pkgsrcver=0.4.0-rc2
pkgrel=1
pkgdesc="Open source IFC library and geometry engine."
url="http://ifcopenshell.org/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('opencascade' 'opencollada' 'boost-libs>=1.58.0' 'python2' )
optdepends=()
makedepends=('cmake' 'boost>=1.58.0' 'swig')
conflicts=()
replaces=()
backup=()
source=("https://github.com/aothms/IfcOpenShell/archive/v${_pkgsrcver}.tar.gz" "boost-1.58.patch")

prepare(){
  cd "${srcdir}/IfcOpenShell-${_pkgsrcver}"

  patch -Np1 -i "${srcdir}/boost-1.58.patch"

  for _FILE in `grep -Rl "COMMAND python" *`; do
    sed -e "s|COMMAND python|COMMAND python2|" -i ${_FILE}
  done
}

build() {
  cd "${srcdir}/IfcOpenShell-${_pkgsrcver}/cmake"
  
  local _pythonver=$(python2 --version 2>&1)
  
  cmake ./ \
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
  cd "${srcdir}/IfcOpenShell-${_pkgsrcver}/cmake"
  
  make DESTDIR="${pkgdir}" install
  
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

md5sums=('bc6cfcc290e66cfcd96dae45c0e55ceb'
         '9628e73de9049ae183774aa2363b6fda')
