# Maintainer: Han Luo <han dot luo at gmail dot com>
pkgname=mutationpp-git
provides=("${pkgname%-git}" "mutation++")
_pkgname=${pkgname%-git}
pkgver=r643.b100af0
pkgrel=1
#_config=linux-c-debug
pkgdesc="MUlticomponent Thermodynamic And Transport properties for partially IONized gases in C++"
arch=('i686' 'x86_64')
url="https://sync.vki.ac.be/mpp/mutationpp"
license=('LGPL3')
depends=('eigen3' 'gcc-libs')
makedepends=('git' 'gcc' 'cmake' 'gcc-fortran')
source=("$_pkgname::git+https://sync.vki.ac.be/mpp/mutationpp.git"
        0001-Fix-some-issues-with-CMake.patch)
sha256sums=('SKIP'
            '3471a798bc7a046d3b74c067ede3a953bdaeadae9b37f7a98898a31ff5ea09e2')
export MAKEFLAGS="-j"$(cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l)

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
  # patch based on https://bitbucket.org/luohan/mutationpp/commits/b93afe7395e2c011945d910821e09d55fbfd06d6
  cd $srcdir/$_pkgname
  patch -Np1 -i ${srcdir}/0001-Fix-some-issues-with-CMake.patch
}

build() {
  # eigen32
  # cd $srcdir/${_pkgname}/thirdparty/eigen
  # mkdir -p build
  # cd build
  # cmake ../ -DCMAKE_INSTALL_PREFIX=/usr

  # configure the code
  mkdir -p $srcdir/build
  cd $srcdir/build
  cmake ../${_pkgname} -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_FORTRAN_WRAPPER=ON

  # compile the code
  cd $srcdir/build
  make $MAKEFLAGS DESTDIR="$pkgdir"
}

package() {
  # eigen32
  # cd $srcdir/$_pkgname/thirdparty/eigen/build
  # make $MAKEFLAGS DESTDIR="$pkgdir" install

  cd $srcdir/build
  make $MAKEFLAGS DESTDIR="$pkgdir" install

  install -d ${pkgdir}/opt/mutationpp
  # mutationpp data
  cp -r $srcdir/$_pkgname/data ${pkgdir}/opt/mutationpp/

  # mutationpp example
  cp -r $srcdir/$_pkgname/examples ${pkgdir}/opt/mutationpp/

  # mutationpp src, we copy this to ease the diagnose
  cp -r $srcdir/$_pkgname/src ${pkgdir}/opt/mutationpp/

  # install a file for enviroment variables of mutationpp
  mkdir -p ${pkgdir}/etc/profile.d
  cat > ${pkgdir}/etc/profile.d/mutationpp.sh << EOF
export MPP_DATA_DIRECTORY=/opt/mutationpp/data
export MPP_DIRECTORY=/usr
EOF
  chmod +x ${pkgdir}/etc/profile.d/mutationpp.sh

  # pkgconfig
  # ! not test, use as own risk
  install -d -m755 ${pkgdir}/usr/share/pkgconfig
  cat > ${pkgdir}/usr/share/pkgconfig/mutationpp.pc << EOF
prefix=/usr
exec_prefix=\${prefix}

Name: Mutation++
Description: ${pkgdesc}
Requires: eigen3
Version: ${pkgver}
Libs: -L\${prefix}/lib -lmutation++ -lmutation++_fortran
Cflags: -I\${prefix}/include/mutation++
EOF

  # add symbolic link for eigen3 header, this is necessary for coolfluid
  # ln -srf ${pkgdir}/usr/include/eigen3 ${pkgdir}/usr/include/mutation++/eigen3
}
