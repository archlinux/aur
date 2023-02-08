# Maintainer: OpenJowel <OpenJowel AT proton DOT me>
#
# This package installs the restbed library on the system
# I am not responsible for the code itself. This package is only an automated build/installation of the restbed library
# Technical questions or issues related to the library itself have to be addressed to the contributors

_tag="4.8"

pkgname="restbed"
arch=('i686' 'x86_64')
pkgver=4.8.0
pkgrel=1
pkgdesc="Framework bringing asynchronous RESTful functionality to C++14 applications"
url='https://github.com/Corvusoft/restbed'
license=('AGPL' 'CPL')
options=('staticlibs')
source=("git+https://github.com/Corvusoft/restbed#tag=${_tag}")
sha512sums=('SKIP')
makedepends=('git')


pkgver(){
  cd "$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}


prepare(){
  cd ${pkgname}
  git submodule update --init
}


build(){
  cd "${pkgname}"

  # BEGIN HOTFIX : There is a project version error in the CMakeLists for version 4.8. The following block is here to fix it
  if [ ${_tag} = "4.8" ]; then
    echo "Fixing version in CMakeLists.txt"
    sed -i "s/project( \"restbed\" VERSION 4.7.0 LANGUAGES CXX )/project( \"restbed\" VERSION ${_tag}.0 LANGUAGES CXX )/g" CMakeLists.txt
  fi
  # END HOTFIX

  mkdir -p build && cd build
  cmake -DBUILD_SSL=NO -DBUILD_TESTS=NO ..

  make -j4
  make install
}


package() {
  libPrefix="lib"
  libBasename=${libPrefix}${pkgname}
  fullSoName=${libBasename}.so.${_tag}
  majorSoName=$(echo -n ${fullSoName} | awk 'match($0, /[a-zA-Z0-9]+(.so)\.[0-9]+/) {print substr($0, RSTART, RLENGTH)}')
  shortSoName=$(echo -n ${fullSoName} | awk 'match($0, /[a-zA-Z0-9]+(.so)/) {print substr($0, RSTART, RLENGTH)}')

  mkdir -p ${pkgdir}/usr/lib
  cp ${pkgname}/distribution/library/librestbed.so.${_tag} ${pkgdir}/usr/lib/
  ln -s /usr/lib/${fullSoName} ${pkgdir}/usr/lib/${majorSoName}
  ln -s /usr/lib/${fullSoName} ${pkgdir}/usr/lib/${shortSoName}

  # The static lib would need a -fPIC flag to be relevant. Let's not mess at linking and just ignore it
  #cp ${pkgname}/distribution/library/${libBasename}.a ${pkgdir}/usr/lib/${libBasename}.a

  mkdir -p ${pkgdir}/usr/include
  cp -r ${pkgname}/distribution/include/* ${pkgdir}/usr/include/
}
