# Maintainer: George Eleftheriou <eleftg>
# Contributor: Andrew Fischer <andrew_at_apastron.co>

pkgname=openfoam

# The distributors package name
_distpkgname=OpenFOAM

pkgver=2.4.0
pkgrel=2
pkgdesc="The open source CFD toolbox"
arch=("any")
url="http://www.openfoam.com"
license=("GPL")
depends=('bzip2' 'paraview' 'parmetis' 'scotch' 'boost' 'flex' 'cgal')
source=("http://downloads.sourceforge.net/foam/${_distpkgname}-${pkgver}.tgz"
        "decomp-options.patch"
        "paraFoam.patch"
        "scotch-options.patch"
        "settings.patch")
install="${pkgname}.install"
sha256sums=('aac4c9e2cc1b54724292add3e182ebf923a0929978e3b5ba524c97ce75477706'
            '3faef066228df77bad5b329bf251fc057dc5dac3b749d5bcd292438f89a546b7'
            'cdd8c599f34cc967e6fb75b7da5f337aa7b56b19cf0871ebf608af6507abe07c'
            'bbf370e411dc7fd95c3d823dac3534d4312fe90c0365b596aa2a3ed016463819'
            '9f36415505d71d86a7f18624f8ed9888f8fa7af09833b0dd215477ddca57302f')

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
  cp ${srcdir}/prefs.sh ${srcdir}/${_distpkgname}-${pkgver}/etc || return 1

  # Generate the scotch.sh file for arch
  echo "export SCOTCH_VERSION=scotch_${_sversion}" > ${srcdir}/scotch.sh
  echo "export SCOTCH_ARCH_PATH=/usr" >> ${srcdir}/scotch.sh
  cp ${srcdir}/scotch.sh ${srcdir}/${_distpkgname}-${pkgver}/etc/config || return 1

  # Patch for archlinux parmetis, paraview and openmpi paths, and scotch link lines
  patch -p1 < ${srcdir}/decomp-options.patch
  patch -p1 < ${srcdir}/paraFoam.patch
  patch -p1 < ${srcdir}/scotch-options.patch
}

build() {
  # Setup the build environment
  export FOAM_INST_DIR=${srcdir}
  foamDotFile=${srcdir}/${_distpkgname}-${pkgver}/etc/bashrc
  [ -f ${foamDotFile} ] && . ${foamDotFile} || return 1

  # Enter build directory
  cd ${srcdir}/${_distpkgname}-${pkgver} || return 1

  # Build and clean up OpenFOAM
  ./Allwmake || return 1
  wclean all || return 1
}

package() {
  cd ${srcdir}

  # Create destination directories
  install -d ${pkgdir}/opt/${_distpkgname} ${pkgdir}/etc/profile.d || return 1

  # Move package to pkgdir
  mv ${srcdir}/${_distpkgname}-${pkgver} ${pkgdir}/opt/${_distpkgname} || return 1

  # Add source file
  echo "export FOAM_INST_DIR=/opt/${_distpkgname}" > ${pkgdir}/etc/profile.d/openfoam.sh || return 1
  echo "alias ofoam=\"source \${FOAM_INST_DIR}/${_distpkgname}-${pkgver}/etc/bashrc\"" >> ${pkgdir}/etc/profile.d/openfoam.sh || return 1

  # Add stub thirdparty directory to keep openfoam happy
  install -d ${pkgdir}/opt/${_distpkgname}/ThirdParty-${pkgver} || return 1

  # Permission fixes - for system-wide install and use
  chmod -R go+r ${pkgdir}/opt
  chmod -R 755 ${pkgdir}/opt/${_distpkgname}/${_distpkgname}-${pkgver}/bin
  chmod -R 755 ${pkgdir}/opt/${_distpkgname}/${_distpkgname}-${pkgver}/etc
}

# vim:set ts=2 sw=2 et:


