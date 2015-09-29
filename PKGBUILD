# Maintainer: Michele Mocciola <mickele>

pkgname=salome-paravis
pkgver=7.6.0
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - PARAVIS Module"
url="http://www.salome-platform.org"
depends=('salome-smesh>=7.6.0' 'salome-smesh<7.7.0' 'paraview-salome>=4.1.0')
makedepends=('boost' 'python2-sphinx')
arch=('i686' 'x86_64')
conflicts=()
provides=()
license=('LGPL')
source=(salome-paravis.profile)

_source=paravis
_installdir=/opt/salome/paravis
_paraviewrootdir=/usr
_paraviewver=4.2

prepare() {
  msg "Connecting to git server..."

  if [[ -d ${_source} ]] ; then
     rm -rf ${_source}
  fi

  git clone git://git.salome-platform.org/modules/${_source}.git
  cd ${_source}
  git checkout V${pkgver:0:1}_${pkgver:2:1}_${pkgver:4:1}

  msg "GIT checkout done or server timeout"
    
  # python -> python2
  for _FILE in `grep -Rl "/usr/bin/env python" * `
  do
	sed -e "s|/usr/bin/env python|/usr/bin/env python2|" -i ${_FILE}
  done
}

build() {
  source /etc/salome/profile.d/salome-kernel.sh
  source /etc/salome/profile.d/salome-gui.sh
  source /etc/salome/profile.d/salome-med.sh
  source /etc/salome/profile.d/salome-geom.sh
  source /etc/salome/profile.d/salome-smesh.sh  

  cd "${srcdir}/${_source}"

  rm -rf build
  mkdir -p build
  cd build

  export PYTHONPATH=$PYTHONPATH:"${_paraviewrootdir}/lib/paraview-${_paraviewver}/site-packages/":"${_paraviewrootdir}/lib/paraview-${_paraviewver}/site-packages/vtk"
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"${_paraviewrootdir}/lib/paraview-${_paraviewver}/"

  cmake .. \
     -DCMAKE_INSTALL_PREFIX="${_installdir}" \
     -DMEDFILE_ROOT_DIR=/usr \
     -DPARAVIEW_ROOT_DIR="${_paraviewrootdir}" \
     -DPYTHON_EXECUTABLE=/usr/bin/python2 \
     -DCAS_ROOT_DIR=/opt/opencascade \
     -DVTK_DIR="${_paraviewrootdir}/lib/cmake/paraview-${_paraviewver}" \
     -DSWIG_EXECUTABLE=/usr/bin/swig-2 \
     -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build2 \
     -DSPHINX_APIDOC_EXECUTABLE=/usr/bin/sphinx-apidoc2
     
  make
}

package() {
  cd "${srcdir}/${_source}/build"

  make DESTDIR="${pkgdir}" install

  install -D -m755 "${srcdir}/${pkgname}.profile" \
                   "${pkgdir}/etc/salome/profile.d/${pkgname}.sh"
}
md5sums=('c135f9d48f56ccd950de4c0c09221595')
