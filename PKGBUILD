# Maintainer: effeffe - Filippo Falezza <filippo dot falezza at outlook dot com>
# Contributor: Luis Sarmiento <lgsarmientop-ala-unal.edu.co>

pkgname=radware
_pkgname=rw
pkgver=05.3
_pkgver=05
pkgrel=5
pkgdesc="Software package for interactive graphical analysis of gamma-ray coincidence data"
url="http://radware.phy.ornl.gov/"
arch=('i686' 'x86_64')
license=('unknown')
depends=('openmotif' 'gtk2' 'upak' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi' 'xorg-fonts-type1'
  'xorg-fonts-misc' 'xorg-font-util' 'xorg-fonts-alias-75dpi' 'xorg-fonts-alias-100dpi'
  'xorg-fonts-alias-misc' 'xorg-fonts-encodings' 'xorg-fonts-misc' 'xorg-fonts-type1' 'xorg-mkfontscale')
makedepends=('gcc-fortran')
install='radware.install'
options=('!emptydirs')
source=(
  'git+https://github.com/radforddc/rw05.git'
  'Makefile_common.patch'
  'Makefile_install_ucb.patch'
  'Makefile_linux.patch'
  'radware.csh'
  'radware.sh')
md5sums=(
  'SKIP'
  'd1938cf6a67d8fb2e3c420935ec3816f'
  'e627dc4fc39af8649ffae3ce7037e094'
  '9bd1841b9f741bb45850d3de908c4606'
  'ee654c4fedca3a09f90101263ffadb1a'
  'f81032b69ef924426cf346564787c6a7')

prepare() {
  cd "${srcdir}/${_pkgname}${_pkgver}/src"
  patch -Np3 < ${srcdir}/Makefile_linux.patch
  patch -Np3 < ${srcdir}/Makefile_common.patch
  patch -Np3 < ${srcdir}/Makefile_install_ucb.patch
}

build() {
  cd "${srcdir}/${_pkgname}${_pkgver}/src"
  rm Makefile
  cp Makefile.linux Makefile
  make -j1 all gtk xm
}

package() {
  cd "${srcdir}/${_pkgname}${_pkgver}/src"
  make DESTINATION_DIR=${pkgdir}/opt/radware install

  install -m755 -d ${pkgdir}/etc/profile.d
  install -m755 ${srcdir}/radware.* ${pkgdir}/etc/profile.d/
  rm ${pkgdir}/opt/radware/.radware*
}
