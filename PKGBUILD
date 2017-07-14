# Maintainer:  <gucong43216@gmail.com>
pkgname=openfoam-plus
pkgver=v1706
_distname=OpenFOAM
_dist=$_distname-$pkgver
pkgrel=1
pkgdesc="The open source CFD toolbox (ESI-OpenCFD version)"
arch=('i686' 'x86_64')
url="http://www.openfoam.com/"
license=('GPL')
depends=('zlib' 'boost' 'openmpi' 'gnuplot' 'readline' 'ncurses' 'libxt'
         'scotch' 'cgal' 'fftw' 'parmetis' 'gperftools'
         'paraview' 'mgridgen' 'libccmio' 'zoltan')
makedepends=('cmake' 'flex' 'bison')
source=("https://newcontinuum.dl.sourceforge.net/project/openfoamplus/${pkgver}/${_dist}.tgz"
        all.patch)
md5sums=('630d30770f7b54d6809efbf94b7d7c8f'
         '70e3dcc738f880e77e9724f33af1692c')

prepare() {
  cd "$srcdir/$_dist"

  _PVMajor=$(pacman -Qi $(pacman -Qqo $(which paraview)) | grep Version | awk -F'[ :-]+' '{print $2}' | cut -d '.' -f1-2)
  sed "s/+ParaView_MAJOR=5.4/+ParaView_MAJOR=${_PVMajor}/g" "${srcdir}/all.patch" > "${srcdir}/all2.patch"

  patch -Np1 -i "$srcdir/all2.patch"
}

build() {
  export FOAM_INST_DIR=${srcdir}
  foamDotFile=${srcdir}/${_dist}/etc/bashrc
  [ -f ${foamDotFile} ] && . ${foamDotFile}

  cd "$srcdir/$_dist"

  ./Allwmake
  wclean all
  wmakeLnIncludeAll
}

package() {
  cd ${srcdir}

  # Create destination directories
  install -d ${pkgdir}/opt/${_distname} ${pkgdir}/etc/profile.d

  # copy package to pkgdir
  cp -r "${srcdir}/${_dist}" "${pkgdir}/opt/${_distname}"

  # Add source file
  echo "export FOAM_INST_DIR=/opt/${_distname}" > ${pkgdir}/etc/profile.d/openfoam-${pkgver}.sh
  echo "alias ofplus=\"source \${FOAM_INST_DIR}/${_dist}/etc/bashrc\"" >> ${pkgdir}/etc/profile.d/openfoam-${pkgver}.sh
  chmod 755 ${pkgdir}/etc/profile.d/openfoam-${pkgver}.sh

  # Permission fixes - for system-wide install and use
  chmod -R go+r ${pkgdir}/opt
  chmod -R 755 ${pkgdir}/opt/${_distname}/${_dist}/bin
  chmod -R 755 ${pkgdir}/opt/${_distname}/${_dist}/etc
}

# vim:set ts=2 sw=2 et:
