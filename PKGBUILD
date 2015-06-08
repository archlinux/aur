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
makedepends=('git' 'scons' 'cmake' 'libcap') # 'libqt4-dev' 'libssl-dev')
source="${pkgname}::git+https://github.com/netvirt/netvirt.git"
md5sums=('SKIP')

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
  echo ======================== build completed ========================
}

package() {
  cd ${srcdir}/${pkgname}/build
  make install

  #TODO: this could/should become a post_install item
  echo "#!/bin/sh
  sudo chmod 666 /dev/net/tun
  sudo setcap cap_net_bind_service,cap_net_admin=ep /usr/bin/netvirt-agent
  " > ${pkgdir}/usr/bin/netvirt-allow_user

  # restartd on ubuntu allow to easily create a daemon with any command,
  # but unfortunatelly, it does not look to be available under arch linux
  #echo "#!/bin/sh
  #sudo pacman -S restartd
  #echo 'netvirt-agent \"netvirt-agent\" \"sleep 20 && su - \$USER -c netvirt-agent &\" \"\"' | sudo tee -a /etc/restartd.conf
  #" > ${pkgdir}/usr/bin/netvirt-daemonize
}

