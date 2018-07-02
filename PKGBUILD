# Maintainer: Norbert Weber <norbert.weber_at_hzdr.de>
# Contributor: Xwang <xwaang1976@gmail.com>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Andrew Fischer <andrew_at_apastron.co>
# Contributor: <gucong43216@gmail.com>

pkgname=openfoam-esi
pkgver=v1806
_distname=OpenFOAM
_dist=$_distname-$pkgver
pkgrel=2
pkgdesc="The open source CFD toolbox (ESI-OpenCFD version)"
arch=('i686' 'x86_64')
url="http://www.openfoam.com/"
license=('GPL')
depends=('gcc' 'cgal' 'cmake' 'fftw' 'boost' 'openmpi' 'paraview')

source=("https://newcontinuum.dl.sourceforge.net/project/openfoamplus/${pkgver}/${_dist}.tgz"
        "https://sourceforge.net/projects/openfoamplus/files/${pkgver}/ThirdParty-${pkgver}.tgz"
        "http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-5.1.0.tar.gz")

md5sums=('bb244a3bde7048a03edfccffc46c763f'
         '3c06cb20d08ab564b70f9df5186ec936'
         '5465e67079419a69e0116de24fce58fe')

prepare() {
  if [ $WM_PROJECT_DIR ]
  then
    echo " "
    echo -e "\e[1m\e[5m\e[31mPlease make sure that no OpenFOAM version is sourced in bashrc.\e[0m"
    echo " "
    return 1
  fi

  cd "$srcdir/$_dist"

  # Generate and install the system preferences file
  echo "export compilerInstall=system" > ${srcdir}/prefs.sh
  echo "export cmake_version=cmake-system" >> ${srcdir}/prefs.sh
  echo "export ParaView_QT=qt-system" >> ${srcdir}/prefs.sh
  cp ${srcdir}/prefs.sh ${srcdir}/${_distname}-${pkgver}/etc

  # get paraview-5.5 directories
  # paraview-5.5
  para_dir=`pacman -Q -l paraview | grep "include" | head -n3 | tail -n1 | sed -e 's!p.*/p!p!g' | sed -e 's!/.*!!g'`
  # /usr/include
  para_include_dir=`pacman -Q -l paraview | grep "include" | head -n3 | tail -n1 | awk '{print $2}' | sed 's!/paraview.*!!g'`
  # /usr/bin
  para_bin_dir=`which paraview | sed -e 's!/paraview!!g'`
  # /usr/lib
  para_lib_dir=`echo $para_bin_dir | sed -e 's/bin/lib/g'`

  # the variable ParaView_DIR must be defined to compile paraFoam,
  # but it cannot be /usr as it should be 
  # (otherwise all pathes containing /usr are removed from PATH)
  arbitrary_dir=`echo ${srcdir}/ThirdParty-${pkgver}/paraview`
  [ ! -d "$arbitrary_dir" ] && mkdir $arbitrary_dir

  # this is needed for compiling paraFoam
  echo "export ParaView_DIR=\$WM_THIRD_PARTY_DIR/paraview" > ${srcdir}/system_paraview
  echo "export ParaView_INCLUDE_DIR=$para_include_dir/$para_dir" >> ${srcdir}/system_paraview
  echo "export PV_PLUGIN_PATH=\$FOAM_LIBBIN/$para_dir" >> ${srcdir}/system_paraview
  echo "export PATH=$para_bin_dir:\$PATH" >> ${srcdir}/system_paraview
  echo "export LD_LIBRARY_PATH=$para_lib_dir/$para_dir:\$LD_LIBRARY_PATH" >> ${srcdir}/system_paraview
  echo "unset ParaView_VERSION" >> ${srcdir}/system_paraview
  cp ${srcdir}/system_paraview ${srcdir}/${_distname}-${pkgver}/etc/config.sh

  cd ${srcdir}/${_distname}-${pkgver}/etc/config.sh
  # write content of system_paraview into file "paraview"
  sed -i "/ParaView_VERSION=5./r system_paraview" ${srcdir}/${_distname}-${pkgver}/etc/config.sh/paraview
  # remove ParaView_VERSION in order to use system paraview
  sed -i '/ParaView_VERSION=5./d' ${srcdir}/${_distname}-${pkgver}/etc/config.sh/paraview

  # create link to metis
  cd "$srcdir/ThirdParty-${pkgver}"
  [[ ! -e "metis-5.1.0" ]] && ln -s ../metis-5.1.0 metis-5.1.0
  return 0
}

build() {

  if [ $WM_PROJECT_DIR ]
  then 
    echo " "
    echo -e "\e[1m\e[5m\e[31mPlease make sure that no OpenFOAM version is sourced in bashrc.\e[0m"
    echo " "
    return 1
  fi

  export FOAM_INST_DIR=${srcdir}
  foamDotFile=${srcdir}/${_dist}/etc/bashrc
  [ -f ${foamDotFile} ] || return 1
  # without && echo " ", makepkg fails
  source ${foamDotFile} && echo " "

  echo -e "\e[92mCompilation will take several hours."
  echo -e " "
  echo -e "Give write access to cmake directory using chmod."
  echo -e "This is needed to compile paraFoam."
  echo -e "\e[0m "
  sudo chmod 757 /usr/lib/cmake/paraview*/Modules

  cd "$srcdir/$_dist"
  ./Allwmake -j `nproc` 2>&1 | tee log.wmake

  # you need to enter the root password after 2 hours
  #sudo chmod 755 /usr/lib/cmake/paraview*/Modules

  wclean all
  wmakeLnIncludeAll
}

package() {
  cd ${srcdir}

  # Create destination directories
  install -d ${pkgdir}/opt/${_distname} ${pkgdir}/etc/profile.d

  # copy package to pkgdir
  cp -r "${srcdir}/${_dist}" "${pkgdir}/opt/${_distname}"
  cp -r "${srcdir}/ThirdParty-${pkgver}" "${pkgdir}/opt/${_distname}"

  # create alias in .bashrc
  echo "alias ofoam=\"source /opt/${_distname}/${_dist}/etc/bashrc\"" >> ~/.bashrc

  # Permission fixes - for system-wide install and use
  chmod -R go+r ${pkgdir}/opt
  chmod -R 755 ${pkgdir}/opt/${_distname}/${_dist}/bin
  chmod -R 755 ${pkgdir}/opt/${_distname}/${_dist}/etc
}
