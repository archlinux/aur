# Maintainer: Michele Mocciola <mickele>

pkgname=salome-med
pkgver=7.6.0
pkgrel=2
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - MED Module"
url="http://www.salome-platform.org"
depends=('scotch>=6.0.3' 'metis4' 'salome-gui>=7.6.0' 'salome-gui<7.7.0')
if test "$CARCH" == x86_64; then
  depends+=('med-salome>=3.0.8')
else
  depends+=('med>=3.0.8')
fi
makedepends=('doxygen' 'boost' 'swig2' 'python2-sphinx')
arch=('i686' 'x86_64')
license=('LGPL')
source=(scotch-bz2.diff salome-med.profile)

_source=med
_installdir=/opt/salome/med
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

  # scotch-6 requires bz2
  patch -Np1 -i ../scotch-bz2.diff
  
  # python -> python2
  for _FILE in `grep -Rl "/usr/bin/env python" * `
  do
	sed -e "s|/usr/bin/env python|/usr/bin/env python2|" -i ${_FILE}
  done
}

build() {
  source /etc/salome/profile.d/salome-kernel.sh
  source /etc/salome/profile.d/salome-gui.sh

  rm -rf "${srcdir}/${_source}/build"
  mkdir "${srcdir}/${_source}/build"
  cd "${srcdir}/${_source}/build"

  cmake .. \
     -DCMAKE_INSTALL_PREFIX=$_installdir \
     -DPYTHON_EXECUTABLE=/usr/bin/python2 \
     -DSALOME_MED_PARTITIONER_METIS=BOOL:ON \
     -DMETIS_INCLUDE_DIRS=/usr/include/metis-4 \
     -DMETIS_LIBRARIES=/usr/lib/libmetis-4.so \
     -DSALOME_MED_PARTITIONER_SCOTCH=BOOL:ON \
     -DSPHINX_APIDOC_EXECUTABLE=/usr/bin/sphinx-apidoc2 \
     -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build2 \
     -DSCOTCH_INCLUDE_DIRS=/usr/include/scotch \
     -DSCOTCH_LIBRARIES=/usr/lib/libscotch.so \
     -DSCOTCH_ERR_LIBRARIES=/usr/lib/libscotcherr.so \
     -DBZ2_LIBRARIES=/usr/lib/libbz2.so \
     -DVTK_DIR="${_paraviewrootdir}/lib/cmake/paraview-${_paraviewver}" \
     -DLIBXML2_ROOT_DIR=/usr \
     -DLibXml2_DIR=/usr/lib/cmake/libxml2 \
     -DLIBXML2_INCLUDE_DIR=/usr/include/libxml2 \
     -DSWIG_EXECUTABLE=/usr/bin/swig-2

  make
}

package() {
  cd "${srcdir}/${_source}/build"

  make DESTDIR="$pkgdir/" install

  install -D -m755 "${srcdir}/${pkgname}.profile" \
                   "${pkgdir}/etc/salome/profile.d/${pkgname}.sh"

}
md5sums=('b7887dda20d38ae64a33547b3d5a1d16'
         '653ad82b33fada22a22a6c96474d5e02')
