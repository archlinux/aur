# Maintainer: Xwang <xwaang1976@gmail.com>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Andrew Fischer <andrew_at_apastron.co>

pkgname=openfoam

# The distributors package name
_distpkgname=OpenFOAM

pkgver=3.0.x
pkgrel=3
pkgdesc="The open source CFD toolbox"
arch=("any")
url="http://www.openfoam.org"
license=("GPL")
depends=('bzip2' 'paraview' 'parmetis' 'scotch' 'boost' 'flex' 'cgal')

#source=("http://downloads.sourceforge.net/foam/${_distpkgname}-${pkgver}.tgz"
#        "paraFoam.patch"
#        "readSTLASCII_L.patch"
#        "ansysToFoam_L.patch"
#        "STLsurfaceFormatASCII_L.patch"
#        "renumberMesh_options.patch"
#        "decomposePar_options.patch"
#        "gambitToFoam_L.patch"
#        "fluent3DMeshToFoam_L.patch"
#        "fluentMeshToFoam_L.patch")
        
source=("git+git://github.com/OpenFOAM/OpenFOAM-3.0.x.git")        

install="${pkgname}.install"
        
#md5sums=('304e6a14b9e69c20989527f5fb1ed724'
#         '352b06d5c1f42eceff784b9130bfe444'
#         '1f1850ac3d005baa6039b5dca5780e55'
#         '23dc21fb55ffc6cfbc8dd5dca903ab22'
#         '285cdc4cd6039da598156fa405e31d29'
#         '815ba1f4df3c40b298e31c57738acd93'
#         '029a20598e565da2638441aa0c39ff74'
#         'be0952767725ff63115f73064a594b35'
#         'a3f8054fe234e18bc2f831d6c23f9abd'
#         '7ab2085baeb8393d4bf7b418658612a9')  

md5sums=('SKIP')      

prepare() {
  # Extract the current version and major of paraview and of scotch for use in the system preferences
  _pversion=`pacman -Q paraview | sed -e 's/.* //; s/-.*//g'`
  _pmajor=`echo $_pversion | cut -d '.' -f1`
  _sversion=`pacman -Q scotch | sed -e 's/.* //; s/-.*//g'`

  # Generate and install the system preferences file
  echo "compilerInstall=system" > ${srcdir}/prefs.sh
  echo "export WM_MPLIB=SYSTEMOPENMPI" >> ${srcdir}/prefs.sh
  echo "export ParaView_VERSION=${_pversion}" >> ${srcdir}/prefs.sh
  echo "export ParaView_MAJOR=${_pmajor}" >> ${srcdir}/prefs.sh
#  mv ${srcdir}/${_distpkgname}-3.0.x ${srcdir}/${_distpkgname}-${pkgver}
  cp ${srcdir}/prefs.sh ${srcdir}/${_distpkgname}-${pkgver}/etc #|| return 1

  # Generate the scotch.sh file for arch
  echo "export SCOTCH_VERSION=scotch_${_sversion}" > ${srcdir}/scotch.sh
  echo "export SCOTCH_ARCH_PATH=/usr" >> ${srcdir}/scotch.sh
  cp ${srcdir}/scotch.sh ${srcdir}/${_distpkgname}-${pkgver}/etc/config #|| return 1

  # Patch for archlinux parmetis, paraview and openmpi paths, and scotch link lines

#  patch -p1 < ${srcdir}/paraFoam.patch
#  patch -p1 < ${srcdir}/readSTLASCII_L.patch
#  patch -p1 < ${srcdir}/ansysToFoam_L.patch
#  patch -p1 < ${srcdir}/STLsurfaceFormatASCII_L.patch
#  patch -p1 < ${srcdir}/renumberMesh_options.patch
#  patch -p1 < ${srcdir}/decomposePar_options.patch
#  patch -p1 < ${srcdir}/gambitToFoam_L.patch
#  patch -p1 < ${srcdir}/fluent3DMeshToFoam_L.patch
#  patch -p1 < ${srcdir}/fluentMeshToFoam_L.patch
}

build() {
  # Setup the build environment
  export FOAM_INST_DIR=${srcdir}
  foamDotFile=${srcdir}/${_distpkgname}-${pkgver}/etc/bashrc
  [ -f ${foamDotFile} ] && . ${foamDotFile} #|| return 1

  # Enter build directory
  cd ${srcdir}/${_distpkgname}-${pkgver} #|| return 1

  # Build and clean up OpenFOAM
  ./Allwmake > ../../openfoam_log.make 2>&1 #|| return 1
  wclean all || return 1
}

package() {
  cd ${srcdir}

  # Create destination directories
  install -d ${pkgdir}/opt/${_distpkgname} ${pkgdir}/etc/profile.d || return 1

  # copy package to pkgdir
  cp -r ${srcdir}/${_distpkgname}-${pkgver} ${pkgdir}/opt/${_distpkgname} || return 1

  # Add source file
  echo "export FOAM_INST_DIR=/opt/${_distpkgname}" > ${pkgdir}/etc/profile.d/openfoam-${pkgver}.sh || return 1
  echo "alias ofoam=\"source \${FOAM_INST_DIR}/${_distpkgname}-${pkgver}/etc/bashrc\"" >> ${pkgdir}/etc/profile.d/openfoam-${pkgver}.sh || return 1
  chmod 755 ${pkgdir}/etc/profile.d/openfoam-${pkgver}.sh || return 1
  
  # Add stub thirdparty directory to keep openfoam happy
  install -d ${pkgdir}/opt/${_distpkgname}/ThirdParty-${pkgver} || return 1

  # Permission fixes - for system-wide install and use
  chmod -R go+r ${pkgdir}/opt
  chmod -R 755 ${pkgdir}/opt/${_distpkgname}/${_distpkgname}-${pkgver}/bin
  chmod -R 755 ${pkgdir}/opt/${_distpkgname}/${_distpkgname}-${pkgver}/etc
}

# vim:set ts=2 sw=2 et:


