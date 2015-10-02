# Maintainer: Michele Mocciola <mickele>

pkgname=salome-netgenplugin
pkgver=7.6.0
_netgenver=4.9.13
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - NETGEN plugin"
url="http://www.salome-platform.org"
depends=('salome-smesh>=7.6.0' 'salome-smesh<7.7.0')
arch=('i686' 'x86_64')
license=('LGPL')
source=("http://downloads.sourceforge.net/netgen-mesher/netgen-${_netgenver}.tar.gz" "netgen-4.9.13-for-SALOME.patch" "netgen-4.9.13-for-CMake.patch" "salome-netgenplugin.profile")
options=()

_source=netgenplugin
_installdir=/opt/salome/netgenplugin
_paraviewrootdir=/usr
_paraviewver=4.2

prepare(){
  cd "netgen-${_netgenver}"
  patch -Np1 -i "${srcdir}/netgen-4.9.13-for-SALOME.patch"
  patch -Np1 -i "${srcdir}/netgen-4.9.13-for-CMake.patch"
  chmod u+x ./build_cmake
  sed -e "s|python|python2|" -i ./build_cmake
  sed -e "s|-avoid-version||" -i nglib/Makefile.am
  sed -e "s|-avoid-version||" -i nglib/Makefile.in

  cd "${srcdir}"
  msg "Connecting to git server..."
  if [[ -d ${_source} ]] ; then
     rm -rf ${_source}
  fi
  git clone git://git.salome-platform.org/plugins/${_source}.git
  cd ${_source}
  git checkout V${pkgver:0:1}_${pkgver:2:1}_${pkgver:4:1}
  msg "GIT checkout done or server timeout"

  # python -> python2
  for _FILE in `grep -Rl "/usr/bin/env python" * `
  do
	sed -e "s|/usr/bin/env python|/usr/bin/env python2|" -i ${_FILE}
  done
  for _FILE in `grep -Rl "'python'" * `
  do
    sed -e "s|'python'|'python2'|" -i ${_FILE}
  done
  for _FILE in `grep -Rl '"python"' * `
  do
    sed -e 's|"python"|"python2"|' -i ${_FILE}
  done
  for _FILE in `grep -Rl '"python ' * `
  do
    sed -e 's|"python |"python2 |' -i ${_FILE}
  done
}

build() {
  cd "netgen-${_netgenver}"
  ./build_cmake ./
  cmake -DCMAKE_INSTALL_PREFIX=${_installdir} \
        -DCASROOT=/opt/opencascade
  make
  make DESTDIR="${srcdir}" install

  rm -rf "${srcdir}/${_source}/build"
  mkdir -p "${srcdir}/${_source}/build"
  cd "${srcdir}/${_source}/build"
  source /etc/salome/profile.d/salome-kernel.sh
  source /etc/salome/profile.d/salome-gui.sh
  source /etc/salome/profile.d/salome-geom.sh
  source /etc/salome/profile.d/salome-smesh.sh
  cmake .. \
     -DCMAKE_INSTALL_PREFIX=${_installdir} \
     -DPYTHON_EXECUTABLE=/usr/bin/python2 \
     -DSWIG_EXECUTABLE=/usr/bin/swig-2 \
     -DVTK_DIR="${_paraviewrootdir}/lib/cmake/paraview-${_paraviewver}" \
     -DCAS_ROOT_DIR=/opt/opencascade \
     -DNETGEN_ROOT_DIR="${srcdir}${_installdir}"

  make
}

package() {
  cd "${srcdir}/netgen-${_netgenver}"
  
  make DESTDIR="${pkgdir}" install
  
  install -D -m644 "${srcdir}/netgen-${_netgenver}/doc/ng4.pdf" \
                   "${pkgdir}/${_installdir}/doc/netgen/ng4.pdf"

  cd "${srcdir}/${_source}/build"

  make DESTDIR="$pkgdir" install

  install -D -m755 "$srcdir/$pkgname.profile" \
                   "$pkgdir/etc/salome/profile.d/$pkgname.sh"
}
md5sums=('2d56642ca673106837bcd08ff9913d57'
         'b19f13b42651b992359eaf0ad4ae346b'
         '4ae279ab4558b1719fe1d8d65a1ed1a1'
         'd143fa3d279a64e0676eb0b43709ffee')
