# Maintainer: somekool <somekool _ at _ gmail _ dot _com>

pkgname=netvirt-agent-git
pkgver=0.6.r20.g3798298
pkgrel=3798298
pkgdesc="NetVirt is an open source network virtualization platform (NVP)."
arch=('i686' 'x86_64')
url=("http://netvirt.org" "https://github.com/netvirt/netvirt")
license='GPLv3'
depends=()
optdepends=()
makedepends=('git' 'scons' 'cmake') # 'libqt6-dev' 'libssl-dev')
#install=${pkgname}.install
#source="${pkgname}::git+https://github.com/netvirt/netvirt.git"
#source="/home/mathieu/projects/dynvpn/netvirt"
#source=("${pkgname}::git+https://github.com/netvirt/netvirt.git#branch=linux-1547"
#"${pkgname}::git+https://github.com/netvirt/netvirt.git#tag=release-${pkgver}"
#"${pkgname}::git+https://github.com/netvirt/netvirt.git#tag=release-${pkgver}")
md5sums=() # 'SKIP')

pkgver() {
  # see https://wiki.archlinux.org/index.php/VCS_package_guidelines for more details
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

pkgrel() {
  git rev-parse --short HEAD
}

prepare() {
  cd ${srcdir}/${pkgname}
  set -e
  git submodule update --init --recursive

  pushd udt4
  make > /dev/null
  popd

  pushd libconfig
  #fix_libconfig_git
  [ ! -f Makefile ] && ./configure
  make > /dev/null
  popd

  pushd tapcfg
  ./buildall.sh linuxonly > /dev/null
  popd
  set +e
  echo ======================== prepare completed ========================
}

build() {
  [ -d ${srcdir}/${pkgname}/build ] && rm -fr ${srcdir}/${pkgname}/build
  mkdir ${srcdir}/${pkgname}/build
  cd ${srcdir}/${pkgname}/build
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr -DWITH_GUI=OFF
  make nvagent
  make package
  echo ======================== build completed ========================
}

package() {
  cd ${srcdir}/${pkgname}/build
  make install
}

